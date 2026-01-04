# Parts

Parts are the building blocks of aircraft in Aviassembly. All parts inherit from `PlanePart` or `BuildingPart`.

## Categories
*   **[Wings](./wings.md)** - Generate lift and drag.
*   **[Engines](./engines.md)** - Generate thrust.
*   **[Wheels](./wheels.md)** - Provide ground capability and suspension.
*   **[Structural](./structural.md)** - Fuselages and connecting parts.
*   **[Utility](./utility.md)** - Parachutes, Decouplers, etc.
*   **[Power](./power.md)** - Batteries, Solar Panels, etc.

## Common Properties
Most parts share these attributes:
*   **Mass**: Affects center of mass and inertia.
*   **Drag**: Calculated based on projected area.
*   **Cost**: In-game currency value.
*   **Strength**: Maximum impact/stress before explosion.

### Parenting System
Parts are attached in a hierarchy:
*   **Parent**: The part this object is attached to.
*   **Children**: Parts attached to this object.
*   **Root**: The base part of the aircraft.
