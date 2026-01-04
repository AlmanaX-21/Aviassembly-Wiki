# Wheels

Wheels provide suspension and traction for taxiing, takeoff, and landing.

## Physics Model
Wheels use a raycast suspension system (`Wheel.cs`).
*   **Suspension Force**: Calculated based on compression distance.
*   **Friction**: Applied sidways to prevent sliding.
*   **Traction**: Applied forward/backward for braking or acceleration (if motorized).

### Failure Conditions
Wheels can fail (explode) under two conditions:
1.  **Overload**: If the sustained load exceeds `MaxWeightCapacity`.
    *   Warning: "Wheel load too heavy".
2.  **Impact**: If vertical velocity on contact exceeds `MaxImpactVelocity`.

## Properties
| Property | Description |
| Property | Description |
| :--- | :--- |
| **Suspension Length** | Max travel distance of the suspension. |
| **Strength** | Spring force multiplier. |
| **Damping** | Shock absorber resistance. |
| **Load Limit** | Max weight supported before failure. |
| **Traction** | Grip multiplier for braking/acceleration. |
| **Max Friction** | Maximum sideways friction before sliding. |
| **Ray Up Offset** | Height adjustment for the suspension raycast. |

## Retractable Gear
Some wheels (`RetractableLandingGear`) can be retracted to reduce drag during flight.

## Part Stats
| Name | Price |
| :--- | :--- |
| Light wheel | 75 |
| Light wheel | 75 |
| Big Wheel | 75 |
| Bike Wheel | 25 |
| Steel wheels | 50 |
| RearWheel | 100 |
| Wheel | 100 |
| Retractable wheel | 300 |
