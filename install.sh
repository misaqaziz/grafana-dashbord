#!/bin/bash

# Update packages
yum update -y

# Install Apache HTTPD
yum install -y httpd

# Start and enable the service
systemctl start httpd
systemctl enable httpd

# Create HTML page
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Product Card</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* CSS styles here (same as your original code) */
        body { background-color: #f5f5f5; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .product-card { width: 300px; background: #fff; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; transition: transform 0.3s ease; }
        .product-card:hover { transform: translateY(-5px); }
        .product-image { position: relative; height: 200px; overflow: hidden; }
        .product-image img { width: 100%; height: 100%; object-fit: cover; }
        .discount-tag { position: absolute; top: 10px; right: 10px; background: #ff5722; color: #fff; padding: 5px 10px; border-radius: 5px; font-size: 12px; font-weight: bold; }
        .product-details { padding: 15px; }
        .product-title { font-size: 18px; margin-bottom: 10px; color: #333; }
        .product-description { font-size: 14px; color: #777; margin-bottom: 15px; }
        .price { margin-bottom: 15px; }
        .current-price { font-size: 20px; font-weight: bold; color: #ff5722; }
        .old-price { font-size: 14px; color: #999; text-decoration: line-through; margin-left: 5px; }
        .rating { margin-bottom: 15px; color: #ffc107; font-size: 14px; }
        .rating span { color: #777; margin-left: 5px; }
        .add-to-cart { width: 100%; padding: 10px; background: #4CAF50; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; transition: background 0.3s; }
        .add-to-cart:hover { background: #45a049; }
    </style>
</head>
<body>
    <div class="product-card">
        <div class="product-image">
            <img src="https://via.placeholder.com/300x200" alt="Product Image">
            <span class="discount-tag">20% OFF</span>
        </div>
        <div class="product-details">
            <h3 class="product-title">Wireless Bluetooth Headphones</h3>
            <p class="product-description">High-quality sound with noise cancellation.</p>
            <div class="price">
                <span class="current-price">$59.99</span>
                <span class="old-price">$74.99</span>
            </div>
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <span>(45 reviews)</span>
            </div>
            <button class="add-to-cart">Add to Cart</button>
        </div>
    </div>
</body>
</html>
EOF

