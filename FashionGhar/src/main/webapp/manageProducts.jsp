<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Products - Zefex</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* Global Styles */
:root {
    --black-primary: #000000;
    --black-secondary: #0a0a0a;
    --dark-grey: #121212;
    --medium-grey: #1e1e1e;
    --light-grey: #2a2a2a;
    --accent-grey: #444444;
    --text-white: #ffffff;
    --text-light: #e0e0e0;
    --text-medium: #b0b0b0;
    --text-dark: #808080;
    --success: #2e7d32;
    --warning: #ff9800;
    --danger: #c62828;
    --info: #0288d1;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--black-secondary);
    color: var(--text-light);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

/* Header Styles */
header {
    background-color: var(--black-primary);
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.5);
    position: sticky;
    top: 0;
    z-index: 100;
    border-bottom: 1px solid var(--light-grey);
}

.header-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 0;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo h1 {
    font-size: 24px;
    font-weight: 700;
    color: var(--text-white);
}

.logo span {
    color: var(--accent-grey);
}

/* Product Management Styles */
.product-container {
    flex: 1;
    padding: 40px 0;
}

.product-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.product-title {
    font-size: 32px;
    color: var(--text-white);
    position: relative;
    padding-bottom: 10px;
}

.product-title:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 3px;
    background-color: var(--text-white);
}

.add-product-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background-color: var(--accent-grey);
    color: var(--text-white);
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: background-color 0.3s;
}

.add-product-btn:hover {
    background-color: var(--light-grey);
}

/* Filter Section */
.filter-section {
    background-color: var(--dark-grey);
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 30px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
}

.filter-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.filter-group label {
    font-size: 14px;
    color: var(--text-light);
}

.filter-group select,
.filter-group input {
    padding: 10px;
    background-color: var(--medium-grey);
    border: 1px solid var(--light-grey);
    color: var(--text-white);
    border-radius: 4px;
    font-size: 14px;
}

.filter-group select:focus,
.filter-group input:focus {
    outline: none;
    border-color: var(--accent-grey);
}

/* Products Table */
.products-table-container {
    background-color: var(--dark-grey);
    border-radius: 8px;
    padding: 20px;
    overflow-x: auto;
}

.products-table {
    width: 100%;
    border-collapse: collapse;
}

.products-table th {
    text-align: left;
    padding: 15px;
    border-bottom: 2px solid var(--light-grey);
    color: var(--text-light);
    font-size: 14px;
    font-weight: 500;
}

.products-table td {
    padding: 15px;
    border-bottom: 1px solid var(--light-grey);
    color: var(--text-medium);
    font-size: 14px;
}

.product-image {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 4px;
}

.stock-status {
    display: inline-block;
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 500;
}

.in-stock {
    background-color: rgba(46, 125, 50, 0.1);
    color: var(--success);
}

.low-stock {
    background-color: rgba(255, 152, 0, 0.1);
    color: var(--warning);
}

.out-of-stock {
    background-color: rgba(198, 40, 40, 0.1);
    color: var(--danger);
}

.action-buttons {
    display: flex;
    gap: 8px;
}

.action-btn {
    width: 32px;
    height: 32px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s;
}

.view-btn {
    background-color: rgba(2, 136, 209, 0.1);
    color: var(--info);
}

.view-btn:hover {
    background-color: var(--info);
    color: var(--text-white);
}

.edit-btn {
    background-color: rgba(255, 152, 0, 0.1);
    color: var(--warning);
}

.edit-btn:hover {
    background-color: var(--warning);
    color: var(--text-white);
}

.delete-btn {
    background-color: rgba(198, 40, 40, 0.1);
    color: var(--danger);
}

.delete-btn:hover {
    background-color: var(--danger);
    color: var(--text-white);
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
}

.modal-content {
    background-color: var(--dark-grey);
    margin: 5% auto;
    padding: 30px;
    border-radius: 8px;
    width: 90%;
    max-width: 800px;
    position: relative;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid var(--light-grey);
}

.modal-title {
    font-size: 24px;
    color: var(--text-white);
}

.close-modal {
    background: none;
    border: none;
    color: var(--text-medium);
    font-size: 24px;
    cursor: pointer;
    transition: color 0.3s;
}

.close-modal:hover {
    color: var(--text-white);
}

/* Form Styles */
.form-row {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: var(--text-light);
    font-size: 14px;
    font-weight: 500;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 12px;
    background-color: var(--medium-grey);
    border: 1px solid var(--light-grey);
    color: var(--text-white);
    border-radius: 4px;
    font-size: 14px;
}

.form-group textarea {
    min-height: 100px;
    resize: vertical;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: var(--accent-grey);
}

.image-preview {
    width: 100%;
    height: 200px;
    background-color: var(--medium-grey);
    border: 2px dashed var(--light-grey);
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
    cursor: pointer;
}

.image-preview i {
    font-size: 40px;
    color: var(--text-dark);
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    gap: 15px;
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid var(--light-grey);
}

.modal-btn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s;
}

.save-btn {
    background-color: var(--accent-grey);
    color: var(--text-white);
}

.save-btn:hover {
    background-color: var(--light-grey);
}

.cancel-btn {
    background-color: var(--medium-grey);
    color: var(--text-light);
}

.cancel-btn:hover {
    background-color: var(--light-grey);
}

/* Footer */
footer {
    background-color: var(--black-primary);
    padding: 20px 0;
    margin-top: auto;
}

.footer-content {
    text-align: center;
    color: var(--text-medium);
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-row {
        grid-template-columns: 1fr;
    }
    
    .filter-section {
        grid-template-columns: 1fr;
    }
    
    .product-header {
        flex-direction: column;
        gap: 15px;
        align-items: flex-start;
    }
}
</style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-top">
                <div class="logo">
                    <h1>ZE<span>FEX</span></h1>
                </div>
                <div class="user-info">
                    <span>Welcome, Admin</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Product Management Content -->
    <section class="product-container">
        <div class="container">
            <div class="product-header">
                <h1 class="product-title">Manage Products</h1>
                <button class="add-product-btn" onclick="openAddModal()">
                    <i class="fas fa-plus"></i> Add New Product
                </button>
            </div>

            <!-- Filter Section -->
            <div class="filter-section">
                <div class="filter-group">
                    <label for="category">Category</label>
                    <select id="category" name="category">
                        <option value="">All Categories</option>
                        <option value="men">Men's Clothing</option>
                        <option value="women">Women's Clothing</option>
                        <option value="unisex">Unisex</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="status">Status</label>
                    <select id="status" name="status">
                        <option value="">All Status</option>
                        <option value="in-stock">In Stock</option>
                        <option value="low-stock">Low Stock</option>
                        <option value="out-of-stock">Out of Stock</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="sort">Sort By</label>
                    <select id="sort" name="sort">
                        <option value="newest">Newest First</option>
                        <option value="oldest">Oldest First</option>
                        <option value="price-high">Price: High to Low</option>
                        <option value="price-low">Price: Low to High</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label for="search">Search</label>
                    <input type="text" id="search" name="search" placeholder="Search products...">
                </div>
            </div>

            <!-- Products Table -->
            <div class="products-table-container">
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample product rows - In a real application, these would be generated dynamically -->
                        <tr>
                            <td><img src="images/products/tshirt1.jpg" alt="Premium Cotton Shirt" class="product-image"></td>
                            <td>Premium Cotton Shirt</td>
                            <td>Men's Shirts</td>
                            <td>₹1,499</td>
                            <td>45</td>
                            <td><span class="stock-status in-stock">In Stock</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="action-btn view-btn" onclick="viewProduct(1)"><i class="fas fa-eye"></i></button>
                                    <button class="action-btn edit-btn" onclick="editProduct(1)"><i class="fas fa-edit"></i></button>
                                    <button class="action-btn delete-btn" onclick="deleteProduct(1)"><i class="fas fa-trash-alt"></i></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Add more product rows as needed -->
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Add Product Modal -->
    <div id="addProductModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Add New Product</h2>
                <button class="close-modal" onclick="closeModal('addProductModal')">&times;</button>
            </div>
            <form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group">
                        <label for="product_name">Product Name*</label>
                        <input type="text" id="product_name" name="product_name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cloth_category">Cloth Category*</label>
                        <select id="cloth_category" name="cloth_category" required>
                            <option value="">Select Category</option>
                            <option value="MEN">Men</option>
                            <option value="WOMEN">Women</option>
                            <option value="UNISEX">Unisex</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="product_category_id">Product Category ID*</label>
                        <select id="product_category_id" name="product_category_id" required>
                            <option value="">Select Product Category</option>
                            <option value="1">T-Shirts</option>
                            <option value="2">Shirts</option>
                            <option value="3">Pants</option>
                            <option value="4">Dresses</option>
                            <option value="5">Accessories</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="brand">Brand*</label>
                        <input type="text" id="brand" name="brand" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="price">Price*</label>
                        <input type="number" id="price" name="price" step="0.01" min="0" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="stock">Stock*</label>
                        <input type="number" id="stock" name="stock" min="0" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="ratings">Ratings*</label>
                        <input type="number" id="ratings" name="ratings" min="0" max="5" step="0.1" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="product_image">Product Image*</label>
                        <input type="file" id="product_image" name="product_image" accept="image/*" required onchange="previewImage(this, 'imagePreview')">
                        <div class="image-preview" id="imagePreview">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="product_description">Product Description*</label>
                    <textarea id="product_description" name="product_description" required></textarea>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="modal-btn cancel-btn" onclick="closeModal('addProductModal')">Cancel</button>
                    <button type="submit" class="modal-btn save-btn">Add Product</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <p>&copy; 2025 ZEFEX. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Modal Functions
        function openAddModal() {
            document.getElementById('addProductModal').style.display = 'block';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Image Preview Function
        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);
            const file = input.files[0];
            
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.innerHTML = `<img src="${e.target.result}" style="max-width: 100%; max-height: 100%; object-fit: contain;">`;
                }
                reader.readAsDataURL(file);
            } else {
                preview.innerHTML = '<i class="fas fa-cloud-upload-alt"></i>';
            }
        }

        // Product Management Functions
        function viewProduct(id) {
            // Implement view product functionality
            console.log('View product:', id);
        }

        function editProduct(id) {
            // Implement edit product functionality
            console.log('Edit product:', id);
        }

        function deleteProduct(id) {
            if (confirm('Are you sure you want to delete this product?')) {
                // Implement delete product functionality
                console.log('Delete product:', id);
            }
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }
    </script>
</body>
</html>