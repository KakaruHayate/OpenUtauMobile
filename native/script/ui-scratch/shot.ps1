param([string]$Out = "shot.png", [int]$Monitor = 1)
Add-Type -AssemblyName System.Windows.Forms, System.Drawing -ErrorAction Stop
New-Item -ItemType Directory -Force -Path (Split-Path $Out) | Out-Null
$b = [System.Windows.Forms.Screen]::AllScreens[$Monitor].Bounds
$bmp = New-Object System.Drawing.Bitmap $b.Width, $b.Height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.CopyFromScreen($b.Location, [System.Drawing.Point]::Empty, $b.Size)
$g.Dispose()
$bmp.Save($Out, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Output "shot -> $Out ($((Get-Item $Out).Length) bytes)"
