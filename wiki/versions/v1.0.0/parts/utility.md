# Utility Parts

Utility parts provide specialized functionality for aircraft operations.

## Airbreak
Deployable drag panels to slow the aircraft.
*   **Property**: `Airbreak Transform` (Visual component).

## Parachute
Safety device for slowing decent during emergencies or landing.
*   **Property**: `Parachute Transform` (Visual component).

## Decoupler
Explosive bolts or mechanical latches to separate stages or drop payloads.
*   **Input**: Can be triggered via specific `Input Override`.

## Rotator
Motorized hinge for moving parts.
### Properties
| Property | Description |
| :--- | :--- |
| **Speed** | Rotation speed. |
| **Input Override** | Control binding for the rotator. |
| **Rotator Base** | The stationary part of the hinge. |

## Other Parts
| Name | Price | Overrides |
| :--- | :--- | :--- |
| Air intake | 25 | BasicPart, BuildingPart |
| Air intake | 40 | BasicPart, BuildingPart |
| Air intake | 10 | BasicPart, BuildingPart |
| RotationJoint | 50 | Rotator, BuildingPart |
| WoodConnection | 5 | BasicPart, BuildingPart |
