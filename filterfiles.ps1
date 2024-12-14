# Variables
$BasePath = "/Users/2341498/Desktop"
$SourceDir = "SourceFolder"
$DestDir = "FilteredFolder"
$SourcePath = Join-Path -Path $BasePath -ChildPath $SourceDir
$DestPath = Join-Path -Path $BasePath -ChildPath $DestDir

# Crear directorios si no existen
foreach ($Path in @($SourcePath, $DestPath)) {
    if (-not (Test-Path -Path $Path)) {
        Write-Host "Creando el directorio: $Path"
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
}

# Crear archivos con extensiones mixtas en "SourceFolder"
Write-Host "Creando archivos en $SourcePath..."
$extensions = @(".txt", ".log")
for ($i = 1; $i -le 10; $i++) {
    # Ajusta el índice para que empiece en 0, ya que los arrays en PowerShell son indexados desde 0.
    $ExtensionIndex = ($i - 1) % $extensions.Count # Extension.counts Devuelve la cantidad de elementos en $extensions
    $FileName = "file$i" + $extensions[$ExtensionIndex]
    $FilePath = Join-Path -Path $SourcePath -ChildPath $FileName
    New-Item -Path $FilePath -ItemType File -Force | Out-Null
}

# Filtrar archivos con extensión .txt y copiarlos a "FilteredFolder"
Write-Host "Filtrando archivos .txt y copiándolos a $DestPath..."
Get-ChildItem -Path $SourcePath -Filter "*.txt" | ForEach-Object {
    $FilteredPath = Join-Path -Path $DestPath -ChildPath $_.Name
    Copy-Item -Path $_.FullName -Destination $FilteredPath -Force | Out-Null
}

# Renombrar archivos en "FilteredFolder" con el prefijo "filtered_"
Write-Host "Renombrando archivos en $DestPath..."
Get-ChildItem -Path $DestPath | ForEach-Object {
    $NewName = "filtered_" + $_.Name
    Rename-Item -Path $_.FullName -NewName $NewName -Force | Out-Null
}

Write-Host "Operación completada exitosamente." -ForegroundColor Green
