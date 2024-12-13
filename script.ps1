# Create and list a directory

# Variables
$BasePath = "/Users/alvaro/Desktop"
$Namedir = "PracticaPowerShell"
$FullPath = Join-Path -Path $BasePath -ChildPath $Namedir

# Crear el directorio si no existe
if (-not (Test-Path -Path $FullPath)) {
    New-Item -Path $FullPath -ItemType Directory | Out-Null
}

# Crear y modificar los archivos en un bucle
for ($i = 1; $i -le 5; $i++) {
    $FileName = "file$i.txt"
    $FilePath = Join-Path -Path $FullPath -ChildPath $FileName

    # Crear el archivo
    New-Item -Path $FilePath -ItemType File -Force | Out-Null

    # Modificar el contenido del archivo
    Set-Content -Path $FilePath -Value "This content is the file $i"
}

# Listar el contenido del directorio
Get-ChildItem -Path $FullPath
