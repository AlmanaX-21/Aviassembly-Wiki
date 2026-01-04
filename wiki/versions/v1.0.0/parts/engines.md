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

## Part Stats
| Name | Price | Thrust | Throttle | Fuel | AbThrust | Electric |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| BigElectricEngine | 1200 | 20 | 1.75 | 0.01 | 0 | true |
| ElectricEngine | 800 | 15 | 1.75 | 0.01 | 0 | true |
| Engine | 300 | 15 | 1.75 | 0.03 | 0 | false |
| Turbojet engine | 3500 | 65 | 1.75 | 0.1 | 78 | false |
| Turbofan engine | 3000 | 40 | 1.75 | 0.04 | 0 | false |
| RocketEngine | 5000 | 80 | 1.75 | 0.12 | 0 | false |
| SmallJetEngine | 1000 | 25 | 1.75 | 0.04 | 0 | false |
| Turbo prop engine | 650 | 200 | 1.75 | 0.03 | 0 | false |
| WoodEngine | 150 | 10 | 1.75 | 0.02 | 0 | false |
