$extensions = @(".txt", ".log",".docx")
for ($i = 1; $i -le 6; $i++) {
    $ExtensionIndex = ($i - 1) % $extensions.Count
    Write-Host "Archivo $i tiene extensión $($extensions[$ExtensionIndex])"
}

 Write-Host "show number extensions:  $($extensions.Count)"