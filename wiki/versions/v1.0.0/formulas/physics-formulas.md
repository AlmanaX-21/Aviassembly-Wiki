# Physics Formulas

Mathematical models used in the engine.

## Aerodynamics

### Wing Lift
$$
L = \sin(|AoA| \times 2) \times \text{sign}(AoA) \times V^2 \times A \times C_L
$$

**Variables:**
*   $L$: Lift Force
*   $AoA$: Angle of Attack (radians)
*   $V$: Velocity Magnitude at Wing
*   $A$: Wing Area (`x * y`)
*   $C_L$: Lift Force Coefficient (`liftForce` in inspector)

**Code Source**: `Wing.cs:ApplyLift`

### Wing Drag
$$
D = (0.5 - 0.5 \cos(|AoA|)) \times V^2 \times A \times C_D
$$

**Variables:**
*   $D$: Drag Force
*   $AoA$: Angle of Attack (radians)
*   $V$: Velocity Magnitude at Wing
*   $A$: Wing Area
*   $C_D$: Drag Force Coefficient (`dragForce` in inspector)

**Code Source**: `Wing.cs:ApplyDrag`

## Engine Thrust

### Propeller Engine
$$
T_{total} = T_{base} \times Throttle \times \text{MaxPower}
$$

**Variables:**
*   $T_{total}$: Final Force
*   $T_{base}$: Base Thrust (`thrust` stat)
*   $Throttle$: Current input (0.0 to 1.0)
*   $MaxPower$: Engine efficiency multiplier

### Consumption
$$
\text{FuelLoss} = |Throttle| \times \text{ConsumptionRate} \times \text{MaxPower} \times \Delta t
$$
