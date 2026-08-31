# Repository agent guidance

## Game Boy runtime validation

- Prefer PyBoy for ROM regression testing. Its scripted inputs, memory reads,
  save states, screenshots, and deterministic pass/fail checks make repeated
  character, move, projectile, and menu validation practical.
- Record the exact ROM path and SHA-256 alongside PyBoy results so runtime
  evidence can be tied to the build that produced it.
- Keep source inspection, successful RGBDS builds, PyBoy runtime checks, and
  physical-device behavior as separate evidence levels.
- SameBoy's manual testing workflow has proved inefficient for this project.
  Use it only when an emulator-specific visual or audio spot check is useful,
  not as the primary regression-test environment.
