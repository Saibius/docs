$startTime = Get-Date

# Run the server as a background process
$process = Start-Process ./Saibius.exe -ArgumentList "--file ./" -PassThru -NoNewWindow -RedirectStandardOutput "./server_log.txt"

Write-Host "Starting server... Waiting for ready signal."

# Continuously check the log file until "Server ready!" appears
while ($true) {
    if (Test-Path "./server_log.txt") {
        $log = Get-Content "./server_log.txt" -Raw
        if ($log -match "Server ready!") {
            $endTime = Get-Date
            break
        }
    }
    Start-Sleep -Milliseconds 100
}

$duration = $endTime - $startTime
Write-Host "------------------------------------" -ForegroundColor Green
Write-Host "Server startup time: $($duration.TotalSeconds) seconds"
Write-Host "------------------------------------" -ForegroundColor Green

# You can choose to keep the process running or terminate it after measurement.
# Stop-Process $process  # Uncomment this line if you want to stop the server immediately.
