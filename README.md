
# PowerShell File Management Script

Este repositorio contiene un script de PowerShell diseñado para gestionar archivos en un directorio específico. El script realiza las siguientes funciones:

- Crea archivos con nombres que incluyen fechas aleatorias.
- Filtra archivos basados en una fecha de referencia.
- Mueve y renombra archivos que cumplen con ciertos criterios.

## Requisitos

- PowerShell 5.0 o superior.
- Sistema operativo Windows, macOS o Linux con PowerShell instalado.

## Uso

1. **Clonar el repositorio:**

   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio
   ```

2. **Ejecutar el script:**

   Abre PowerShell y navega al directorio del repositorio. Luego, ejecuta el script:

   ```powershell
   .\filesdates.ps1
   ```

3. **Descripción del script:**

   - **Creación de archivos:** El script crea 15 archivos en el directorio `DataFiles` con nombres en el formato `file_YYYY-MM-DD.txt`, donde `YYYY-MM-DD` es una fecha aleatoria.
   - **Filtrado de archivos:** Filtra los archivos que tienen fechas anteriores al 1 de junio del año actual.
   - **Movimiento y renombrado:** Mueve los archivos filtrados al directorio `OldFiles` y les añade el sufijo `_archived` a sus nombres.

## Personalización

- Puedes cambiar el número de archivos creados modificando el bucle `for` en el script.
- Ajusta las fechas aleatorias cambiando los parámetros de `Get-Random`.
- Modifica los directorios de origen y destino cambiando las variables `$SourceDir` y `$DestDir`.
