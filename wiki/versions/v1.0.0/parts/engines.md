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
| **Throttle Speed** | How fast the engine responds to input changes. |
| **Max Power** | Maximum power output (likely for electric engines). |
| **Consumption** | Fuel/Electricity usage at max throttle. |
| **Afterburner** | Whether the engine supports afterburner mode. |
| **Afterburner Thrust** | Thrust output when afterburner is active. |
| **Afterburner Fuel** | Fuel consumption rate during afterburner. |
| **Invert Direction** | Support for reversing thrust direction. |
| **Electric Engine** | Whether this is an electric motor. |
