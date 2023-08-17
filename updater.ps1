$download_files = @(
    'https://f-droid.org/F-Droid.apk',
    'https://f-droid.org/repo/org.videolan.vlc_13050408.apk',
    'https://auroraoss.com/AuroraStore/Stable/AuroraStore_4.3.0.apk'
)

$download_directory = "$PSScriptRoot/apks"
mkdir $download_directory -ErrorAction SilentlyContinue
Set-Location $download_directory

$download_files | ForEach-Object -ThrottleLimit 10 -Parallel {
    $output_name = $_ -split '/' | Select-Object -Last 1
    Invoke-WebRequest $_ -OutFile $output_name
}

Set-Location ..
