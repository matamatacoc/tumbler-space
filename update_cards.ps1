$path = "c:\Users\admin\.gemini\antigravity\scratch\homey-tumbler\index.html"
$content = Get-Content -Path $path -Raw -Encoding UTF8

# Hapus info produk (h4, .price, .capacity)
$content = $content -replace "(?s)<div class=`"product-info`">\s*<h4>.*?</h4>\s*<div class=`"price`">.*?</div>\s*<p class=`"capacity`">.*?</p>\s*(<a href)", '<div class="product-info">$1'

# Tambah produk ke-6 sebelum penutup product-grid
$product6 = @"
                <!-- Product 6 -->
                <div class="product-card shadow-soft">
                    <div class="product-img">
                        <img src="image_7_homey.png" alt="Tumbler Homey">
                    </div>
                    <div class="product-info">
                        <a href="https://wa.me/6282211616808?text=Halo%20saya%20tertarik%20pesan%20Tumbler%20Koleksi%20Homey"
                            target="_blank" class="btn btn-outline btn-full">Pesan via WhatsApp</a>
                    </div>
                </div>
            </div>
"@

$content = $content -replace "(?s)</div>\s*</div>\s*</section>\s*<!-- Testimonial Section -->", "$product6`n        </div>`n    </section>`n`n    <!-- Testimonial Section -->"

Set-Content -Path $path -Value $content -Encoding UTF8
Write-Output "SECTION3_DONE"
