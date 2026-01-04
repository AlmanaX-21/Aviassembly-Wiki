# Engines

Engines generate thrust to propel the aircraft.

## Types
1.  **Propeller / Fuel**: Consumes Fuel.
2.  **Electric**: Consumes Electricity.

## Mechanics
*   **Thrust**: Force applied forward.
*   **Consumption**: Resources drained per second based on throttle level.
*   **Generation**: Some engines generate electricity while running.
*   **Afterburner**: Boosts thrust (and consumption) significantly above 80% throttle.

## Input
Controlled via the "Throttle" axis. Supports an "Invert" option for push configurations.

## Properties
| Property | Description |
| :--- | :--- |
| **Thrust** | Maximum force output. |
| **Consumption** | Fuel/Electricity usage at max throttle. |
| **Afterburner** | Whether the engine supports afterburner mode. |
