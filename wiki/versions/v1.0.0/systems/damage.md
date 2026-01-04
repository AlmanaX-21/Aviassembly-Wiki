# Damage System

The damage system handles structural failure, explosions, and debris generation.

## Failure Triggers
Parts can fail due to:
1.  **Impact**: Hitting terrain or obstacles at high speed.
2.  **Stress**: Exceeding aerodynamic limits (Drag/Lift forces).
3.  **Overload**: Wheels supporting too much weight.

## Explosion Logic
Handled by `PartExploder.cs`.

### `ExplodePart(part)`
When a part fails:
1.  **Detachment**: The part is conceptually removed from the active aircraft hierarchy.
2.  **Resource Loss**: If the part stored Fuel or Electricity, that capacity is removed from the global pool.
3.  **Visuals**:
    *   An explosion particle effect is spawned.
    *   An explosion sound is played.
4.  **Debris Generation**:
    *   A visual copy of the part is created.
    *   Code components (`MonoBehaviours`) are stripped to prevent "zombie" logic.
    *   A `Rigidbody` is added to the debris to simulate physical fallout.
5.  **Chain Reaction**: All children of the exploded part are also exploded recursively.

## Recursive Failure
Because parts are linked in a tree structure, destroying a parent part (like a Fuselage) will detach and "explode" all wings, engines, and gear attached to it.
