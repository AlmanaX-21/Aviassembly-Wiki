# Wings

Wings are the primary source of lift.

## Functional Behavior
*   **Lift Generation**: Proportional to velocity squared and Angle of Attack (AoA).
*   **Stall**: Simplified stall model where lift decreases beyond 45 degrees AoA.
*   **Induced Drag**: Drag increases with AoA.

## Structural Limits
Wings have a `MaxSpeed` rating.
*   **Stress Warning**: At 80% of Max Speed.
*   **Failure**: At 100% of Max Speed, the wing will explode/detach.

## Properties

| Property | Description |
| :--- | :--- |
| Property | Description |
| :--- | :--- |
| **Area** | Surface area (`x * y`), directly scaling lift. |
| **Lift Force** | Coefficient of lift. |
| **Drag Force** | Coefficient of drag. |
| **AoA Offset** | Built-in angle of attack adjustment. |
| **Fuel** | Fuel capacity stored within the wing. |
| **Control Surface** | (If applicable) Range of motion for aileron/flap. |
