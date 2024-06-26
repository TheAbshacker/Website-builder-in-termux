#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Prompt the user for website details
echo -e "${GREEN}Enter website's name:${NC}"
read website_name

echo -e "${YELLOW}Enter website's header:${NC}"
read website_header

echo -e "${RED}Enter website's paragraph:${NC}"
read website_paragraph

echo -e "${GREEN}Enter website's footer:${NC}"
read website_footer

# Ask if the user wants to include a CSS file
echo -e "${CYAN}Do you want to include a CSS file? (yes/no):${NC}"
read include_css

# Create styles.css if the user opts to include a CSS file
if [ "$include_css" == "yes" ]; then
cat <<EOF > styles.css
body {
    font-family: Arial, sans-serif;
    background: #f0f0f0;
    color: #333;
    margin: 0;
    padding: 20px;
}
header, footer {
    background: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
}
main {
    margin: 20px 0;
}
EOF
    css_link='<link rel="stylesheet" href="styles.css">'
else
    css_link=''
fi

# Ask if the user wants to include a JavaScript file
echo -e "${BLUE}Do you want to include a JavaScript file? (yes/no):${NC}"
read include_js

# Create script.js if the user opts to include a JavaScript file
if [ "$include_js" == "yes" ]; then
cat <<EOF > script.js
document.addEventListener('DOMContentLoaded', function() {
    console.log('JavaScript is loaded and ready.');
});
EOF
    js_script='<script src="script.js"></script>'
else
    js_script=''
fi

# Ask if the user wants to include an image
echo -e "${YELLOW}Do you want to include an image? (yes/no):${NC}"
read include_image

if [ "$include_image" == "yes" ]; then
    echo -e "${RED}Enter image path or URL:${NC}"
    read image_path
    image_tag="<img src=\"$image_path\" alt=\"Website Image\" style=\"width:100%;height:auto;\">"
else
    image_tag=''
fi

# Create the index.html file
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$website_name</title>
    $css_link
</head>
<body>
    <header>
        <h1>$website_header</h1>
    </header>
    <main>
        $image_tag
        <p>$website_paragraph</p>
    </main>
    <footer>
        <p>$website_footer</p>
    </footer>
    $js_script
</body>
</html>
EOF

# Notify the user
echo -e "${GREEN}index.html has been created successfully.${NC}"

# Additional notifications for CSS and JS files
if [ "$include_css" == "yes" ]; then
    echo -e "${GREEN}styles.css has been created successfully.${NC}"
fi

if [ "$include_js" == "yes" ]; then
    echo -e "${GREEN}script.js has been created successfully.${NC}"
fi
