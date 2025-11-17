param(
    [int]$Port = 8080,
    [int]$TimeoutSeconds = 60
)

Write-Host "Building and starting containers..."
docker-compose up -d --build

$url = "http://localhost:$Port/"
$deadline = (Get-Date).AddSeconds($TimeoutSeconds)
Write-Host "Waiting for $url to respond (timeout: $TimeoutSeconds s)"
while ((Get-Date) -lt $deadline) {
    try {
        $r = Invoke-WebRequest -Uri $url -UseBasicParsing -Method GET -TimeoutSec 5
        if ($r.StatusCode -ge 200 -and $r.StatusCode -lt 400) {
            Write-Host "Service available at $url"
            exit 0
        }
    } catch {
        Start-Sleep -Seconds 2
    }
}
Write-Error "Timed out waiting for $url"
exit 1
