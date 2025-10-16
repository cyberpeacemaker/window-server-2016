# Define VM groups
$initialVMs = @("20741B-LON-DC1")
$midVMs = @("20741B-NA-RTR", "20741B-EU-RTR")
$finalVMs = @(
    "20741B-LON-CL1", "20741B-LON-CL2", "20741B-INET1",
    "20741B-SYD-SVR1", "20741B-TOR-SVR1", 
    "20741B-LON-SVR1", "20741B-LON-SVR2"
)

# Restore all VMs to a known state
Get-VM | Restore-VMCheckpoint -Name "Starting Image" -Confirm:$false

# Function to wait for heartbeat
function Wait-ForHeartbeat {
    param (
        [string[]]$VMNames,
        [int]$TimeoutSeconds = 120
    )
    
    $startTime = Get-Date
    $goodStatus = '狀況良好'  # Use localized term or switch to English if possible
    $heartbeatServiceName = '活動訊號'

    do {
        Start-Sleep -Seconds 2
        Write-Output "Waiting for VM(s): $($VMNames -join ', ')..."

        $statuses = @{}
        foreach ($vm in $VMNames) {
            $heartbeat = (Get-VMIntegrationService -VMName $vm | Where-Object Name -like $heartbeatServiceName).PrimaryStatusDescription
            $statuses[$vm] = $heartbeat
        }

        $allGood = $statuses.Values -notcontains ($statuses.Values | Where-Object { $_ -ne $goodStatus })
    } while (-not $allGood -and ((Get-Date) - $startTime).TotalSeconds -lt $TimeoutSeconds)

    if (-not $allGood) {
        Write-Warning "Timeout reached while waiting for VM(s): $($VMNames -join ', ')"
    }
}

# Start and wait for initial VMs
$initialVMs | ForEach-Object { Start-VM -VMName $_ -Confirm:$false }
Wait-ForHeartbeat -VMNames $initialVMs

# Start and wait for mid VMs
$midVMs | ForEach-Object { Start-VM -VMName $_ -Confirm:$false }
Wait-ForHeartbeat -VMNames $midVMs

# Start the remaining VMs
$finalVMs | ForEach-Object { Start-VM -VMName $_ -Confirm:$false }