# Missions Overview

Missions (Quests) in Aviassembly are structured into several types, primarily focused on cargo delivery and exploration tracking.

## Quest Types

### 1. Delivery Quest
The core gameplay loop involves transporting cargo between airports.

*   **Logic**: `DeliveryQuest.cs`
*   **Requirements**:
    *   **Location**: Distance to target airport < 100 units.
    *   **State**: Velocity < 25 units/s (Landed).
    *   **Cargo**: Inventory must contain `>= Amount` of the specific `CargoType`.
*   **Origin**: The airport that supplies the specific `CargoType` (using `AirportManager.GetCargoAirport(type)`).
*   **Destination**: The `deliveryAirport` specified in the quest data.
*   **Rewards**:
    *   Money (Coins)
    *   Research Points (Scrap)
    *   Advanced Research Points (Advanced Scrap)

### 2. Track Quest
Used for story progression or meta-goals.

*   **Logic**: `TrackQuest.cs`
*   **Function**: Checks if a list of *other* specific quests have been completed.
*   **Completion**: All referenced `QuestData` items in `trackQuests` list must be in `AirportManager.completedQuests`.

### 3. Container Quest
A wrapper quest that groups multiple sub-quests.

*   **Logic**: `ContainerQuest.cs`
*   **Completion**: All `childQuests` must be completed.

## Data Structure

Quests are defined as `QuestData` ScriptableObjects, which contain:
*   `QuestName`
*   `Description`
*   `GiveMessage` (Dialog on start)
*   `CompleteMessage` (Dialog on finish)
*   `Rewards` (Money, RP, ARP)
*   `FollowupQuest` (Chains to the next mission)
*   `StoryState` (Triggers world state changes)

## Campaign Flow
The game features a main campaign managed by `StoryManager`:
1.  **Weather Station**: Initial missions.
2.  **Earthquake Event**: Triggered after specific Hospital missions; unlocks `PostEarthquake` state.
3.  **Radio Tower**: Unlocked after Earthquake.
4.  **Research Facility**: Advanced missions.
5.  **Underground Storage**: Endgame.
6.  **Explosion Site**: Final mystery.

> ⚠️ **Note**: Specific mission parameters (e.g., "Deliver 10 Apples") are stored in asset files and vary by version.
