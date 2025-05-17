$htmlFiles = Get-ChildItem -Path "F:\blogger\css_projects" -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw

    # Replace header background color
    $content = $content -replace 'background-color:\s*#[0-9a-fA-F]{3,6};\s*\/\*\s*header\s*\*\/', 'background-color: #091330; /* header */'
    $content = $content -replace '(header\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #091330'

    # Replace headings color
    $content = $content -replace '(h[1-6]\s*\{[^}]*color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    $content = $content -replace 'color:\s*#[0-9a-fA-F]{3,6};\s*\/\*\s*headings\s*\*\/', 'color: #5592f5; /* headings */'
    
    # Replace button background
    $content = $content -replace '(button\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    $content = $content -replace '(\.back-link\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    $content = $content -replace '(\.project-card a\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    
    # Replace button hover
    $content = $content -replace '(button:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    $content = $content -replace '(\.back-link:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    $content = $content -replace '(\.project-card a:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    
    # Replace example background
    $content = $content -replace '(\.example\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #f0f5ff'
    
    # Replace example border
    $content = $content -replace '(\.example\s*\{[^}]*border-left:.*solid\s+)#[0-9a-fA-F]{3,6}', '$1#5592f5'
    
    # Replace StudentHub with StudoChart (if any instances remain)
    $content = $content -replace 'StudentHub', 'StudoChart'
    
    # Save the updated content
    Set-Content -Path $file.FullName -Value $content
}

# Now update CSS files
$cssFiles = Get-ChildItem -Path "F:\blogger\css_projects" -Filter "*.css"

foreach ($file in $cssFiles) {
    $content = Get-Content -Path $file.FullName -Raw

    # Replace header background color
    $content = $content -replace '(header\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #091330'
    
    # Replace headings color
    $content = $content -replace '(h[1-6]\s*\{[^}]*color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    
    # Replace button background
    $content = $content -replace '(button\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    $content = $content -replace '(\.back-link\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    $content = $content -replace '(\.project-card a\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #5592f5'
    
    # Replace button hover
    $content = $content -replace '(button:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    $content = $content -replace '(\.back-link:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    $content = $content -replace '(\.project-card a:hover\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #09cc09'
    
    # Replace example background
    $content = $content -replace '(\.example\s*\{[^}]*background-color:)\s*#[0-9a-fA-F]{3,6}', '$1 #f0f5ff'
    
    # Replace example border
    $content = $content -replace '(\.example\s*\{[^}]*border-left:.*solid\s+)#[0-9a-fA-F]{3,6}', '$1#5592f5'
    
    # Save the updated content
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "Brand colors have been updated in all HTML and CSS files in the css_projects folder."