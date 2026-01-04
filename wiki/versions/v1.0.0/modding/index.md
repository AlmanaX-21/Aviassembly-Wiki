# Modding Overview

Aviassembly runs on Unity, making it relatively friendly for modding via BepInEx.

## Architecture
The game code is located in `Assembly-CSharp.dll`.
*   **Parts**: Defined by `MonoBehaviour` scripts (`Wing`, `Engine`).
*   **Data**: Uses `ScriptableObject` assets (`QuestData`, `CargoType`).

## Adding Custom Parts
To add a new part:
1.  Create a Unity Asset Bundle.
2.  Include your Prefab.
3.  Ensure it has the correct components (`BuildingPart` + specific logic like `Wing`).
4.  Use a plugin to inject it into the `PartDepot` or `PartPlacer`.
5.  *Alternatively*, use the **Simple Parts Loader** mod if available.

## Modifying Stats
You can hook into `PartStat` or specific classes (`Wing.cs`) using Harmony patches to change:
*   Lift/Drag coefficients.
*   Engine thrust.
*   Fuel consumption.
