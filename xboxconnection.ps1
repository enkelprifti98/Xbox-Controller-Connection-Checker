$started = $false

Do {
    
    [System.Threading.Thread]::Sleep(200)
    
    $status = Get-PnpDevice -FriendlyName 'Xbox One Wireless Controller' -Status 'OK' -ErrorAction SilentlyContinue | foreach { $_.PriorityClass = "Idle" } 

    If (!($status)) { Write-Host 'Waiting for an Xbox One Wireless Controller to connect...' ; Start-Sleep -Seconds 1 }
    
    Else { Write-Host 'A controller was connected!' ; $started = $true }

}
Until ( $started )