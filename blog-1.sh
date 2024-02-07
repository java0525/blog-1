#!/bin/bash

# print user name
echo "Hello, Java"

# today's date print
echo "Today's date is: $(date +"%Y-%m-%d")"

# Validate input arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

# Set variables
PROJECT_NAME=$1

# Check if the project directory already exists
if [ -d "$PROJECT_NAME" ]; then
  echo "Error: Directory '$PROJECT_NAME' already exists. Choose a different name or remove the existing directory."
  exit 1
fi


# # Create project directory
# mkdir -p "$PROJECT_NAME"
#
# # Create subdirectories within the project directory
# mkdir -p "$PROJECT_NAME/css"
# mkdir -p "$PROJECT_NAME/scripts"
# mkdir -p "$PROJECT_NAME/assets"
# mkdir -p "$PROJECT_NAME/images"


# Create project directory and essential subdirectories
mkdir -p "$PROJECT_NAME"/{css,scripts,assets,images}

# Navigate into the project directory
cd "$PROJECT_NAME" || exit

# Create main files
touch index.html css/style.css scripts/main.js .gitignore README.md

# Populate index.html with basic HTML5 structure and the red h1
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$PROJECT_NAME</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Hello, h1 is blue.</h1>
    <script src="scripts/main.js"></script>
</body>
</html>
EOF

# Add a simple CSS reset and blue h1 style to style.css
echo "* { margin: 0; padding: 0; box-sizing: border-box; }" > css/style.css
echo "h1 { color: blue; }" >> css/style.css

# a console log to main.js to confirm it's loaded
echo "console.log('JS loaded');" > scripts/main.js

# Setup a basic .gitignore file
echo "node_modules/" > .gitignore
echo ".DS_Store" >> .gitignore

# Initialize a new git repository
git init

echo "'$PROJECT_NAME' has been set up. Have fun!"

# Open the project directory in the default file manager
open .
