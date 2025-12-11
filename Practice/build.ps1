# Stop on first error
$ErrorActionPreference = "Stop"

Write-Host "Assembling..."

rgbasm -Werror -Weverything -o sample.o .\sample.rgbinc
rgbasm -Werror -Weverything -o main.o .\main.rgbasm

Write-Host "Linking..."

rgblink --dmg --tiny --map sample.map --sym sample.sym -o base.gb .\main.o .\sample.o

Write-Host "Fixing ROM header..."

rgbfix --title game --pad-value 0 --validate .\base.gb

Write-Host "`nBuild complete!"
