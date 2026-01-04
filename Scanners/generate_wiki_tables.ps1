$dumpsDir = ".\PartDumps"
$jsonFiles = Get-ChildItem -Path $dumpsDir -Filter "*.json"

$engines = @()
$wings = @()
$wheels = @()
$structural = @()
$utility = @()
$power = @()
$others = @()

foreach ($file in $jsonFiles) {
    try {
        $content = Get-Content $file.FullName -Raw
        $json = $content | ConvertFrom-Json

        $name = $json.name
        if ([string]::IsNullOrWhiteSpace($name)) { $name = $json.id }
        
        $price = $json.price
        $overrides = $json.overrides
        
        function Get-Prop($obj, $propName) {
            if ($obj -and $obj.PSObject.Properties[$propName]) {
                return $obj.$propName
            }
            return "-"
        }
        
        function Has-Prop($obj, $propName) {
            if ($obj -and $obj.PSObject.Properties[$propName]) {
                return $true
            }
            return $false
        }

        if (Has-Prop $overrides "Engine") {
            $e = $overrides.Engine
            $engines += [PSCustomObject]@{
                Name     = $name
                Price    = $price
                Thrust   = Get-Prop $e "thrust"
                Throttle = Get-Prop $e "throttleSpeed"
                Gen      = Get-Prop $e "electricityGeneration"
                Fuel     = Get-Prop $e "fuelConsumption"
                AbThrust = Get-Prop $e "afterburnerThrust"
                Electric = Get-Prop $e "electricEngine"
            }
        }
        elseif (Has-Prop $overrides "Wing") {
            $w = $overrides.Wing
            $wings += [PSCustomObject]@{
                Name     = $name
                Price    = $price
                Lift     = Get-Prop $w "liftForce"
                Drag     = Get-Prop $w "dragForce"
                MaxSpeed = Get-Prop $w "maxSpeed"
                Fuel     = Get-Prop $w "fuel"
            }
        }
        elseif ($json.id -match "Wheel") {
            $wheels += [PSCustomObject]@{
                Name  = $name
                Price = $price
            }
        }
        elseif ($json.id -match "Batter|Solar|Turbine|Generator|Fan") {
            $type = "Power"
            $val = "-"
            
            if (Has-Prop $overrides "Battery") { 
                $p = $overrides.Battery; $type = "Battery"; $valKey = "capacity" 
            }
            elseif (Has-Prop $overrides "SolarPanel") { 
                $p = $overrides.SolarPanel; $type = "Solar"; $valKey = "rechargeSpeed" 
            }
            elseif (Has-Prop $overrides "AirTurbine") { 
                $p = $overrides.AirTurbine; $type = "Turbine"; $valKey = "capacity" 
            }
            
            if ($p) { $val = Get-Prop $p $valKey }

            $power += [PSCustomObject]@{
                Name  = $name
                Price = $price
                Type  = $type
                Value = $val
            }
        }
        elseif ($json.id -match "Coupler|Rotator|Parachute|Break") {
            $utility += [PSCustomObject]@{
                Name  = $name
                Price = $price
                Type  = $json.basePrefabName
            }
        }
        elseif ($json.id -match "Fuselage|Tank|Body|Strut|Connector|Block|Cube|Beam|Nose|Tail") {
            $structural += [PSCustomObject]@{
                Name  = $name
                Price = $price
                Type  = $json.basePrefabName
            }
        }
        elseif ($json.id -match "Cockpit") {
            # Cockpits are arguably structural or control. Let's put them in structural for now or separate.
            # User didn't specify Cockpit page, so maybe Structural or new Control page.
            # Let's put in structural with type Cockpit
            $structural += [PSCustomObject]@{
                Name  = $name
                Price = $price
                Type  = "Cockpit"
            }
        }
        else {
            $others += [PSCustomObject]@{
                Name      = $name
                Price     = $price
                Overrides = ($overrides.PSObject.Properties.Name -join ", ")
            }
        }

    }
    catch {
        Write-Warning "Failed to parse $($file.Name): $_"
    }
}

function Print-Table($data, $headers) {
    if ($data.Count -eq 0) { return }
    
    $line1 = "| " + ($headers -join " | ") + " |"
    $line2 = "| " + (($headers | ForEach-Object { ":---" }) -join " | ") + " |"
    Write-Output $line1
    Write-Output $line2

    foreach ($row in $data) {
        $vals = @()
        foreach ($h in $headers) {
            $val = $row.$h
            if ($null -eq $val) { $val = "-" }
            $vals += $val
        }
        Write-Output ("| " + ($vals -join " | ") + " |")
    }
    Write-Output ""
}

Write-Output "### Engines"
Print-Table $engines @("Name", "Price", "Thrust", "Throttle", "Fuel", "AbThrust", "Electric")
Write-Output "### Wings"
Print-Table $wings @("Name", "Price", "Lift", "Drag", "MaxSpeed", "Fuel")
Write-Output "### Wheels"
Print-Table $wheels @("Name", "Price")
Write-Output "### Power"
Print-Table $power @("Name", "Price", "Type", "Value")
Write-Output "### Structural"
Print-Table $structural @("Name", "Price", "Type")
Write-Output "### Utility"
Print-Table $utility @("Name", "Price", "Type")
Write-Output "### Others"
Print-Table $others @("Name", "Price", "Overrides")
