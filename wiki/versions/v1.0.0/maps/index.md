# Maps

The world of Aviassembly is procedurally generated using noise algorithms and predefined biomes.

## Generation System
Logic: `TerrainGenerationManager.cs`

The world consists of:
1.  **Biomes**: Defined by `MapType` (Forest, Snow, Desert, etc.).
2.  **Continents**: Falloff curves determine island shapes.
3.  **Flat Features**: Airports flatten the terrain around them to ensure safe landing zones.

## Map Types
The active map type determines:
*   Terrain Material
*   Surface Decorations (Trees, Rocks)
*   Min/Max Height

| Type | Characteristics |
| :--- | :--- |
| **Forest** | Standard green terrain with tree cover. |
| **Desert** | Sandy terrain, generally flatter. |
| **Snow** | High altitude peaks, white terrain. |
| **Hills** | Rolling terrain with significant elevation changes. |
| **Ocean** | Water level customization. |

## Fog of War
Unexplored areas are covered by fog. Visiting an area (or unlocking specific content) clears the fog texture.
