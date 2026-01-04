# Constants

Core simulation constants.

## Physics
*   **Gravity**: 9.81 m/s² (Default), unless modified by `SpaceGravity`.
*   **Drag Multiplier**: Global scaling factor for drag simulation.

## Gameplay
*   **Max Wheel Impact**: Threshold for gear collapse.
*   **Wing Stress Limit**: 80% of `MaxSpeed` (Warning), 100% (Failure).
*   **Earthquake Threshold**: > 8 seconds duration triggers `PostEarthquake` state.
