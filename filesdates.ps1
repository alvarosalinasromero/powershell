# Variables
$BasePath = "/temp"
$SourceDir = "DataFiles"
$DestDir = "OldFiles"
$SourcePath = Join-Path -Path $BasePath -ChildPath $SourceDir
$DestPath = Join-Path -Path $BasePath -ChildPath $DestDir

# Crear directorios si no existen
foreach ($Path in @($SourcePath, $DestPath)) {
    if (-not (Test-Path -Path $Path)) {
        Write-Host "Creando directorio: $Path" -ForegroundColor Yellow
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
}

# Crear 15 archivos con fechas aleatorias
Write-Host "Creando archivos en $SourcePath..." -ForegroundColor Yellow
for ($i = 1; $i -le 15; $i++) {
    $RandomDate = Get-Date -Year (Get-Random -Minimum ((Get-Date).Year - 1) -Maximum ((Get-Date).Year)) `
        -Month (Get-Random -Minimum 1 -Maximum 12) `
        -Day (Get-Random -Minimum 1 -Maximum 28)

    $FormattedDate = $RandomDate.ToString("yyyy-MM-dd")
    $FileName = "file_$FormattedDate.txt"
    $FilePath = Join-Path -Path $SourcePath -ChildPath $FileName
    New-Item -Path $FilePath -ItemType File -Force | Out-Null
}

Write-Host "15 archivos creados exitosamente en $SourcePath." -ForegroundColor Green

# Fecha de referencia: 1 de junio del año actual
$ReferenceDate = Get-Date -Year (Get-Date).Year -Month 6 -Day 1

# Filtrar, mover y renombrar archivos
Write-Host "Filtrando y moviendo archivos anteriores a $($ReferenceDate.ToShortDateString())..." -ForegroundColor Yellow
Get-ChildItem -Path $SourcePath -Filter "file_*.txt" | ForEach-Object {
    if ($_ -match "file_(\d{4}-\d{2}-\d{2})\.txt") {
        $FileDate = [datetime]::ParseExact($matches[1], "yyyy-MM-dd", $null)

        if ($FileDate -lt $ReferenceDate) {
            # Crear el nuevo nombre con el sufijo _archived
            $NewFileName = $_.BaseName + "_archived" + $_.Extension
            $DestFilePath = Join-Path -Path $DestPath -ChildPath $NewFileName

            # Mover y renombrar el archivo
            Move-Item -Path $_.FullName -Destination $DestFilePath -Force
            Write-Host "Movido y renombrado: $($_.Name) -> $NewFileName" -ForegroundColor Green
        }
    }
}

Write-Host "Filtrado, movimiento y renombrado completado." -ForegroundColor Green

# ... existing code ...
