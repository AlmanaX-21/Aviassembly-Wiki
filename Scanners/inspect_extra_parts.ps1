$managedPath = Convert-Path ".\Managed"
$targetDll = Join-Path $managedPath "Assembly-CSharp.dll"

# Pre-load Unity Core
try { [System.Reflection.Assembly]::LoadFrom((Join-Path $managedPath "UnityEngine.CoreModule.dll")) | Out-Null } catch {}
try { [System.Reflection.Assembly]::LoadFrom((Join-Path $managedPath "UnityEngine.dll")) | Out-Null } catch {}

try {
    $asm = [System.Reflection.Assembly]::LoadFrom($targetDll)
    $types = $asm.GetTypes()
    
    $parts = @("Airbreak", "Battery", "SolarPanel", "Decoupler", "Rotator", "Parachute", "CoolingFan", "AirTurbine")

    foreach ($p in $parts) {
        $t = $types | Where-Object { $_.Name -eq $p }
        if ($t) {
            Write-Output "CLASS: $($t.Name)"
            Write-Output "  Base: $($t.BaseType.Name)"
            $t.GetFields([System.Reflection.BindingFlags]"Public,Instance,DeclaredOnly") | ForEach-Object { 
                Write-Output "    $($_.Name) : $($_.FieldType.Name)" 
            }
            Write-Output "--------------------------------"
        } else {
            Write-Warning "Type $p not found."
        }
    }
}
catch { Write-Error $_ }
