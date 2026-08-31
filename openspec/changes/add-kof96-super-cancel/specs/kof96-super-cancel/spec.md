## ADDED Requirements

### Requirement: Selectable Super Cancel mode

The modified KOF96 ROM SHALL expose a `SUP CANCEL` OPTION backed by its own DIP
bit, and the option SHALL default to disabled.

#### Scenario: Enable the mode from OPTION

- **WHEN** the player changes `SUP CANCEL` from `N` to `Y`
- **THEN** Super Cancel behavior is enabled without changing the other DIP options

#### Scenario: Leave the mode disabled

- **WHEN** `SUP CANCEL` is `N`
- **THEN** special-move start validation and damage remain equivalent to the prior modified ROM

### Requirement: Full POW prerequisite

The game SHALL permit a Super Cancel attempt only when the cancelling player's
logical `iPlInfo_Pow` value equals `PLAY_POW_MAX` (`$28`) at the time of the
attempt. Checking this prerequisite SHALL NOT itself consume or reset POW; any
meter use by the move started from the cancel SHALL remain governed by that
move's ordinary rules.

#### Scenario: Continue validation at full POW

- **WHEN** `iPlInfo_Pow` equals `PLAY_POW_MAX` and the player attempts a Super Cancel
- **THEN** the game continues with the recovery-window and ordinary move-legality checks

#### Scenario: Reject a cancel below full POW

- **WHEN** `iPlInfo_Pow` is below `PLAY_POW_MAX`, even if the current special is in valid non-attacking recovery
- **THEN** Super Cancel does not make another special or super start

#### Scenario: Do not spend POW merely for checking

- **WHEN** the full-POW prerequisite succeeds but no target move is accepted
- **THEN** the Super Cancel check leaves the player's POW unchanged

### Requirement: Recovery-only special cancellation

When Super Cancel mode is enabled, the game SHALL allow a special or super move
to cancel into a move accepted by the normal character-specific special reader
only while the player's logical POW meter is full and the current special or
super is on its final visible move frame with neither a regular nor a forced
hitbox.

#### Scenario: Cancel during non-attacking recovery

- **WHEN** POW is full, a special or super is on its final visible frame, both hitboxes are zero, and the player inputs a legal special or super
- **THEN** the new move starts before the current recovery finishes

#### Scenario: Reject an active-frame cancel

- **WHEN** the current move still has a regular or forced hitbox
- **THEN** Super Cancel does not make another special or super start

#### Scenario: Preserve move legality

- **WHEN** the requested move fails its ordinary meter, health, projectile, throw, hit-state, or no-special validation
- **THEN** Super Cancel does not bypass that failure

#### Scenario: Do not cancel into a normal

- **WHEN** the player presses a normal attack during special-move recovery
- **THEN** Super Cancel does not start a normal move

### Requirement: One-third cancelled-move damage

The game SHALL scale every non-zero damage component belonging to the special
or super started by a Super Cancel to `max(1, floor(original / 3))`, including initial,
mid-move, multi-hit, and projectile damage. Zero damage SHALL remain zero.

#### Scenario: Scale ordinary damage units

- **WHEN** a cancelled-into move would deal 12 damage units
- **THEN** that damage component deals 4 units

#### Scenario: Preserve a non-zero low-damage hit

- **WHEN** a cancelled-into move would deal 1 or 2 damage units
- **THEN** that damage component deals 1 unit

#### Scenario: Chain another Super Cancel

- **WHEN** a reduced-damage move reaches valid recovery and the player's POW is full again
- **THEN** the next move is scaled from its own original damage and is not cumulatively reduced to one ninth

#### Scenario: Finish the reduced move

- **WHEN** the cancelled-into move ends or a later special starts normally
- **THEN** subsequent uncancelled moves use their original damage
