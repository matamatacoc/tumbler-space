$path = "C:\Users\admin\.gemini\antigravity\scratch\homey-tumbler\index.html"
$content = Get-Content -Path $path -Raw -Encoding UTF8

# 1. Update WhatsApp links globally
$content = $content -replace '6282211616808', '6283891321222'

# 2. Update descriptive text about supplier
$oldDesc = "<p>Menghadirkan kenyamanan, kepraktisan, dan estetika yang menyatu dengan kehangatan rumah Anda.</p>"
$newDesc = "<p>Kami adalah supplier tumbler profesional pertama dan terpercaya. Kami melayani pengadaan tumbler untuk suvenir, kebutuhan korporat, dan acara spesial dengan jaminan kualitas terbaik dan harga yang kompetitif.</p>"
$content = $content.Replace($oldDesc, $newDesc)

# 3. Remove "Layanan Pelanggan" section in Footer
$oldLayanan = @"
                <div class="footer-col">
                    <h4>Layanan Pelanggan</h4>
                    <ul>
                        <li><a href="#">Cara Pemesanan</a></li>
                        <li><a href="#">Syarat & Ketentuan</a></li>
                        <li><a href="#">Cara Perawatan</a></li>
                    </ul>
                </div>
"@
$content = $content.Replace($oldLayanan, "")

# 4. Update Footer Contact Info
$content = $content.Replace("+62 822 1161 6808", "+62 838 9132 1222")
$content = $content.Replace("hello@tumblerku.com", "sumardi.han@gmail.com")

Set-Content -Path $path -Value $content -Encoding UTF8
Write-Output "CONTACT_INFO_UPDATED"
