## Context

KOF96 marks an executing special with `PF0B_SPECMOVE`; the common special-input
validator rejects another special while that bit is set. Move animation data
also stores a final visible mapping offset. Recovery is normally represented by
that final mapping remaining visible for several frames before the move calls
`Play_Pl_EndMove`.

Damage enters the engine through the move-animation table and the common current
or pending damage setters. Projectile moves normally copy the pending player
damage into their projectile object.

## Goals / Non-Goals

- Goals: expose the mode in OPTION, require full logical POW, open only the
  non-attacking final recovery window, support specials and supers, and reduce
  all damage belonging to the cancelled-into move.
- Non-goals: cancel normals, cancel active attack frames, bypass normal move
  resource/legality checks, alter hit or guard cancels, or redesign CPU tactics.

## Decisions

- Use DIP bit 0 for Super Cancel because it is unused in the original game.
- Gate each Super Cancel attempt on `iPlInfo_Pow == PLAY_POW_MAX` (`$28`). Use
  the logical meter rather than `iPlInfo_PowVisual`, because the latter may lag
  behind while the bar animates. This prerequisite does not itself alter POW;
  the accepted target move keeps its existing meter checks and consumption.
- Treat recovery as the current visible animation offset equalling
  `iPlInfo_OBJLstPtrTblOffsetMoveEnd` while both the regular and forced hitboxes
  are zero. This excludes active attack frames even when a move uses its final
  mapping for custom timing.
- Store per-player pending and active Super Cancel damage state in an unused
  byte in the `$100`-byte player structure. Pending state is set only by a
  successful full-POW and recovery-window validation; active state begins only
  when the next special is actually initialized and ends with that move.
- Reduce non-zero integer damage as `max(1, floor(original / 3))`; keep zero as
  zero so the engine's zero-damage and pending-damage sentinels remain valid.
- Scale both initial move-table damage and all common current/pending damage
  writes. Projectile copies therefore inherit scaled values. Each chained
  Super Cancel starts from the new move's original damage; reduction does not
  compound to one ninth.
- Permit any move accepted by the existing character-specific special reader;
  the same move is not specially prohibited.
- Re-check full POW for every link in a Super Cancel chain. A prior cancel does
  not grant a later cancel if the target move's ordinary behavior has reduced
  POW below maximum.

## Risks / Trade-offs

- A few bespoke moves hold their final animation mapping for custom conditions.
  Requiring both hitboxes to be zero prevents active-frame cancellation, but
  emulator playtesting across the roster is still required to identify moves
  whose recovery is encoded unusually.
- Minimum-one rounding means original one- or two-unit hits cannot become an
  exact third. Allowing zero would suppress hits and conflict with the pending
  damage sentinel.
- A cancelled-into super may consume or otherwise alter POW through its
  existing logic, so a later chained Super Cancel may be unavailable. POWER UP
  mode retains its original meter behavior; Super Cancel adds no exemption.
- CPU players may use the same window only when their existing AI happens to
  supply a valid special input; this change does not add new tactical AI.

## Migration Plan

Build a new Japanese ROM artifact under a distinct all-options/super-cancel
name. The option defaults off, so existing behavior is the rollback path.

## Open Questions

- None required for implementation. Full POW is a non-consuming prerequisite;
  target moves retain their existing meter behavior.
