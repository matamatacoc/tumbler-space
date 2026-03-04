$path = "C:\Users\admin\.gemini\antigravity\scratch\homey-tumbler\index.html"
$content = Get-Content -Path $path -Raw -Encoding UTF8

# 1. Strip Auto-text from Koleksi Favorit (Product Cards)
$content = $content -replace 'https://wa\.me/6283891321222\?text=Halo%20saya%20tertarik%20pesan%20Tumbler.*?"', 'https://wa.me/6283891321222"'

# 2. Add back Auto-text to UV Print
$content = $content -replace '<a href="https://wa.me/6283891321222" target="_blank" class="btn btn-outline btn-full">Konsultasi\s*Harga Cetak UV</a>', '<a href="https://wa.me/6283891321222?text=Halo%20saya%20tertarik%20tanya%20Jasa%20UV%20Print" target="_blank" class="btn btn-outline btn-full">Konsultasi Harga Cetak UV</a>'

# 3. Add back Auto-text to Grafir Laser
$content = $content -replace '<a href="https://wa.me/6283891321222" target="_blank" class="btn btn-outline btn-full">Konsultasi\s*Harga Grafir</a>', '<a href="https://wa.me/6283891321222?text=Halo%20saya%20tertarik%20tanya%20Jasa%20Grafir%20Laser" target="_blank" class="btn btn-outline btn-full">Konsultasi Harga Grafir</a>'

Set-Content -Path $path -Value $content -Encoding UTF8
Write-Output "URL_UPDATED"
