#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx

sudo tee /var/www/html/index.html <<EOF
<html>
<head>
    <title>My First AWS Website</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>Welcome to my website hosted on AWS EC2!</p>
</body>
</html>
EOF