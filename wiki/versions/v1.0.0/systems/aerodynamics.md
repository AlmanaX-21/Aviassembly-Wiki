# Aerodynamics

Aerodynamics in Aviassembly are calculated on a per-part basis for lifting surfaces and a global basis for drag.

## Wing Logic
The `Wing` component (`Wing.cs`) handles lift and drag forces based on the airflow velocity and angle of attack.

### Airflow Calculation
Local airflow is calculated relative to the wing's orientation:
1.  **Point Velocity**: `Rigidbody.GetPointVelocity(WingPosition)`
2.  **Airflow Vector**: `-PointVelocity`
3.  **Local Airflow**: Transformed into the wing's local space.

### Angle of Attack (AoA)
The Angle of Attack is the angle between the wing's chord line (forward vector) and the relative wind.
*   Calculated using `Mathf.Atan2(localAirflow.y, Abs(localAirflow.z))`.
*   Converted to degrees.
*   Includes a `Sign` flip based on the Z component to handle backward flight correctly.

## Forces

### Lift Force
Lift is applied perpendicular to the airflow direction.
*   **Direction**: `Cross(Airflow.normalized, Wing.right)`
*   **Application Point**: Lerped between CoM and Wing position (`GetLiftOrigin`).

### Drag Force (Induced)
Wings generate their own induced drag separate from the global `DragSimulator`.
*   **Direction**: `-VelocityAtWing` (Opposite to motion).
*   **Limit**: Drag calculation includes a text-book correlation to AoA (cosine factor).

## Stall Behavior
The lift curve uses a `Sin(2 * AoA)` function.
*   **0 degrees**: 0 Lift.
*   **45 degrees**: Max Lift (Stall peak in this simplified model).
*   **90 degrees**: 0 Lift.

> ⚠️ **Note**: This is a simplified sine-based model, not a true airway simulation with complex stall drop-off.
