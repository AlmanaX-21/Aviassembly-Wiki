# Fuel & Resources

Aviassembly manages two primary resource types for propulsion: **Fuel** and **Electricity**.

## Fuel System
Used by combustion engines (Propellers, Jets).
*   **Storage**: `FuelTank` parts.
*   **Weight**: Fuel adds weight to the aircraft.
    *   `TotalWeight = DryMass + (FuelVolume * FuelDensity)`
*   **Consumption**: Engines drain fuel from the global "Plane Container" pool, not individual tanks.

## Electricity System
Used by electric motors.
*   **Storage**: `Battery` parts.
*   **Generation**: Some engines generate electricity while running.
*   **Consumption**: Electric motors drain electricity from the global pool.

## Resource Management
Resources are pooled globally in `PlaneContainer`.
*   **Capacity**: Sum of all `volume` (Fuel) or `capacity` (Battery) values from attached parts.
*   **Part Loss**: If a tank/battery is destroyed, its capacity is subtracted from the total. If current resources exceed the new capacity, they are clamped to the new limit.
