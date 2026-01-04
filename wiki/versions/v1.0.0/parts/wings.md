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

| **Area** | Surface area (`x * y`), directly scaling lift. |
| **Lift Force** | Coefficient of lift. |
| **Drag Force** | Coefficient of drag. |
| **AoA Offset** | Built-in angle of attack adjustment. |
| **Fuel** | Fuel capacity stored within the wing. |
| **Control Surface** | (If applicable) Range of motion for aileron/flap. |

## Part Stats

| Name | Price | Lift | Drag | MaxSpeed | Fuel |
| :--- | :--- | :--- | :--- | :--- | :--- |
| BigWing | 2500 | 0.015 | 0.0001 | 1500 | 2 |
| Wood wing | 75 | 0.0035 | 0.00035 | 225 | 0 |
| GliderWing | 1000 | 0.009 | 0.0001 | 110 | 0 |
| SmallJetWing | 800 | 0.009 | 0.0002 | 2000 | 1.5 |
| TailWing | 15 | 0.00033 | 0.0001 | 600 | 0 |
| Big tailwing | 250 | 0.002 | 0.0001 | 3000 | 0 |
| Wing | 150 | 0.0055 | 0.00035 | 600 | 0 |
| WoodWing | 75 | 0.0035 | 0.0003 | 250 | 0 |
