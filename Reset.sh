#restore VM
Get-VM | Restore-VMCheckpoint -Name "Starting Image" -Confirm:$false

#start VM
Start-VM -VMName 20741B-LON-DC1 -Confirm:$false
Start-Sleep 60
Start-VM -VMName 20741B-NA-RTR -Confirm:$false
Start-VM -VMName 20741B-EU-RTR -Confirm:$false
Start-Sleep 30
Start-VM -VMName 20741B-LON-CL1 -Confirm:$false
Start-VM -VMName 20741B-LON-CL2 -Confirm:$false
Start-VM -VMName 20741B-INET1 -Confirm:$false
Start-VM -VMName 20741B-SYD-SVR1 -Confirm:$false
Start-VM -VMName 20741B-TOR-SVR1 -Confirm:$false
Start-VM -VMName 20741B-LON-SVR1 -Confirm:$false
Start-VM -VMName 20741B-LON-SVR2 -Confirm:$false

#End
