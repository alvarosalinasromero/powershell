# Create and list a directory

# Variables
$BasePath = "/Users/alvaro/Desktop"
$Namedir = "PracticaPowerShell"
$FullPath = Join-Path -Path $BasePath -ChildPath $Namedir # Se utiliza Join-Path para generar rutas dinámicamente, evitando errores al concatenar manualmente.

# Crear el directorio si no existe
if (-not (Test-Path -Path $FullPath)) {
    New-Item -Path $FullPath -ItemType Directory | Out-Null
}

# Crear y modificar los archivos en un bucle
# Se utiliza un bucle for para evitar repetición de código al crear y modificar los archivos.

for ($i = 1; $i -le 5; $i++) {
    $FileName = "file$i.txt"
    $FilePath = Join-Path -Path $FullPath -ChildPath $FileName

    # Crear el archivo
    # Se agrega | Out-Null para ocultar salidas de cmdlets como New-Item
    New-Item -Path $FilePath -ItemType File -Force | Out-Null

    # Modificar el contenido del archivo
    Set-Content -Path $FilePath -Value "This content is the file $i"
}

# Listar el contenido del directorio
Get-ChildItem -Path $FullPath
