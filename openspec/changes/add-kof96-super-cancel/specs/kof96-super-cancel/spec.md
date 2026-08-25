## MODIFIED Requirements

### Requirement: Selectable MAX Chain mode

The modified KOF96 ROM SHALL expose a `MAX CHAIN` OPTION backed by the existing
independent Super Cancel DIP bit, and the option SHALL default to disabled.

#### Scenario: Enable MAX Chain

- **WHEN** the player changes `MAX CHAIN` from `N` to `Y`
- **THEN** phase-based special and super routing is enabled without changing any other OPTION value

#### Scenario: Leave MAX Chain disabled

- **WHEN** `MAX CHAIN` is `N`
- **THEN** special start legality, move damage, MAX duration, and move routing remain equivalent to the prior options build

#### Scenario: Keep CPU routing unchanged

- **WHEN** a CPU-controlled fighter is running, including hard COM with POWER UP enabled
- **THEN** it does not enter MAX Chain and continues to use the original AI move-routing rules

### Requirement: MAX duration as cancel resource

The game SHALL require sufficient `iPlInfo_MaxPow` for every MAX Chain link and
SHALL subtract the route cost only after a target move has been accepted.
Special-to-special SHALL cost `$08`; special-to-super and super-to-special SHALL
cost `$10`.

#### Scenario: Pay for a special-to-special link

- **WHEN** a legal special-to-special route is accepted with at least `$08` MAX duration remaining
- **THEN** the target special starts and `iPlInfo_MaxPow` decreases by `$08`

#### Scenario: Pay the higher super route cost

- **WHEN** a legal special-to-super or super-to-special route is accepted with at least `$10` MAX duration remaining
- **THEN** the target move starts and `iPlInfo_MaxPow` decreases by `$10`

#### Scenario: Reject insufficient MAX duration

- **WHEN** the phase and command are valid but the remaining MAX duration is below the applicable route cost
- **THEN** the target move does not start and MAX duration is unchanged

#### Scenario: Do not charge a failed command

- **WHEN** MAX Chain validation runs but no target move is accepted
- **THEN** MAX duration is unchanged

#### Scenario: Spend the exact remaining duration

- **WHEN** an accepted route cost equals the remaining `iPlInfo_MaxPow`
- **THEN** MAX duration reaches zero through the normal termination path and does not wrap to `$FF`

### Requirement: Active-and-recovery cancel window

An attack-bearing special or super SHALL become a valid MAX Chain source on the
first frame where its regular or forced player hitbox is non-zero. It SHALL
remain a valid source through its later active and recovery frames without
requiring the current hitbox to be zero or the visible animation offset to equal
`iPlInfo_OBJLstPtrTblOffsetMoveEnd`.

#### Scenario: Cancel on the first active frame

- **WHEN** a legal command is accepted on the first frame where the source exposes a regular or forced hitbox
- **THEN** the target move starts even though the source hitbox is still active

#### Scenario: Cancel during later active frames

- **WHEN** the source previously exposed a hitbox and still has an active hitbox now
- **THEN** a legal target may start

#### Scenario: Cancel throughout recovery

- **WHEN** the source previously exposed a hitbox and is now in any later non-attacking recovery frame
- **THEN** a legal target may start without an exact `MoveEnd` offset match

#### Scenario: Reject uncommitted startup

- **WHEN** the source has not exposed a hitbox, confirmed a hit or guard, or completed the utility-move transition rule
- **THEN** MAX Chain does not start another move

#### Scenario: Remember an earlier active frame

- **WHEN** the source exposed a hitbox on an earlier frame but the player first attempts MAX Chain during later recovery
- **THEN** the latched source phase allows a legal target without requiring an earlier cancel attempt

### Requirement: Hit, guard, projectile, and utility opening

The game SHALL latch confirmation for the current source move after its direct
or owned-projectile attack hits or is guarded. Confirmation SHALL open MAX Chain
for that source. A source that never exposes a player hitbox SHALL instead open
after its first completed visible animation transition unless it is an unsafe
source.

#### Scenario: Direct hit or guard confirmation

- **WHEN** the current source directly hits the opponent or its direct attack is guarded
- **THEN** that source records confirmation and accepts a legal MAX Chain route

#### Scenario: Owned projectile confirmation

- **WHEN** a projectile belonging to the current source hits the opponent or is guarded
- **THEN** the owner records confirmation and accepts a legal MAX Chain route while the source move is still executing

#### Scenario: No-hitbox utility move

- **WHEN** a safe special has never exposed a player hitbox and completes its first visible animation transition
- **THEN** it becomes a valid MAX Chain source

### Requirement: Route and chain restrictions

The game SHALL allow special-to-special, special-to-super, and super-to-special
MAX Chain routes. It SHALL reject super-to-super, a consecutive target in the
same move family, and any route beyond two accepted links in one chain.

#### Scenario: Chain two different special families

- **WHEN** the player routes special A into special B and then into special C with valid phases, commands, and resources
- **THEN** both links are accepted and the chain depth becomes two

#### Scenario: Reject the third link

- **WHEN** a chain at depth two attempts another MAX Chain route
- **THEN** the target move does not start and no MAX cost is charged

#### Scenario: Reject the same move family

- **WHEN** the requested target is the same command family as the source, including a different light/heavy or super/desperation variant
- **THEN** the target move does not start and no MAX cost is charged

#### Scenario: Reject super-to-super

- **WHEN** the source and requested target are both supers
- **THEN** the target super does not start and no MAX cost is charged

#### Scenario: Commit route state only after selecting the target

- **WHEN** a character reader selects a candidate target after the source window has opened
- **THEN** route type, move family, depth, exact cost, and ordinary legality are validated before any target-init side effect or MAX charge

#### Scenario: Clear super state on a super-to-special route

- **WHEN** a legal super-to-special route is committed
- **THEN** the target is marked as a special but not a super, and the `$10` route charge replaces the canceled source super's deferred end-of-super meter emptying

### Requirement: Preserve legality and locked-sequence safety

MAX Chain SHALL preserve the normal target move's meter, health, projectile,
proximity, ground/air, hit-state, no-special, and character-specific legality.
It SHALL also reject a source while a throw, grab rotation, or opponent-locking
cinematic sequence is active.

#### Scenario: Preserve target legality

- **WHEN** the requested target fails any ordinary move legality check
- **THEN** MAX Chain does not bypass that failure or charge MAX duration

#### Scenario: Cancel a projectile owner into a non-projectile move

- **WHEN** the source projectile is still active and the requested non-projectile target is otherwise legal
- **THEN** the target may start

#### Scenario: Preserve the one-projectile restriction

- **WHEN** the source projectile remains active and the requested target would create an illegal second projectile
- **THEN** the target projectile move does not start

#### Scenario: Reject an opponent-locking source

- **WHEN** the source is in a throw, grab rotation, or opponent-locking cinematic state
- **THEN** MAX Chain does not interrupt that state

### Requirement: Chain-depth damage scaling

The game SHALL scale every non-zero damage component of the first
cancelled-into move to `max(1, floor(original * 3 / 4))` and every non-zero
damage component of the second cancelled-into move to
`max(1, floor(original / 2))`. Initial, later, multi-hit, and projectile damage
SHALL use the same tier. Zero SHALL remain zero, and each target SHALL scale
from its own original damage.

#### Scenario: Scale the first target

- **WHEN** the first cancelled-into move would deal 12 damage units
- **THEN** that component deals 9 units

#### Scenario: Scale the second target

- **WHEN** the second cancelled-into move would deal 12 damage units
- **THEN** that component deals 6 units

#### Scenario: Preserve low non-zero damage

- **WHEN** either tier receives an original component too small to remain non-zero after integer scaling
- **THEN** that component deals 1 unit

#### Scenario: Do not compound tiers

- **WHEN** the second target originally deals 12 damage units after a first target was scaled to three quarters
- **THEN** the second target deals 6 units rather than scaling the first target's result

#### Scenario: Finish or break the chain

- **WHEN** the current move ends without another accepted MAX Chain link or a later special starts normally
- **THEN** chain depth and reduced-damage state reset and subsequent moves use original damage
