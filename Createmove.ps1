# Variables
$BasePath = "/temp"
$SourceDir = "SourceFolder"
$DestDir = "DestinyFolder"
$SourcePath = Join-Path -Path $BasePath -ChildPath $SourceDir
$DestPath = Join-Path -Path $BasePath -ChildPath $DestDir

# Crear "SourceFolder" si no existe
if (-not (Test-Path -Path $SourcePath)) {
    New-Item -Path $SourcePath -ItemType Directory | Out-Null
}

# Crear archivos en "SourceFolder"
for ($i = 1; $i -le 10; $i++) {
    $FileName = "file$i.txt"
    $FilePath = Join-Path -Path $SourcePath -ChildPath $FileName

    # Crear archivo y agregar contenido
    New-Item -Path $FilePath -ItemType File -Force | Out-Null
    Set-Content -Path $FilePath -Value "This content is the file $i"
}

# Crear "DestinyFolder" si no existe
if (-not (Test-Path -Path $DestPath)) {
    New-Item -Path $DestPath -ItemType Directory | Out-Null
}

# Mover archivos de "SourceFolder" a "DestinyFolder"
$Files = Get-ChildItem -Path $SourcePath
foreach ($File in $Files) {
    Move-Item -Path $File.FullName -Destination $DestPath
}

# Listar los archivos movidos
Write-Host "Archivos movidos a $($DestPath):" -ForegroundColor Green
Get-ChildItem -Path $DestPath | ForEach-Object { $_.Name }
