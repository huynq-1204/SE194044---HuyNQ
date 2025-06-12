<%-- 
    Document   : productForm
    Created on : Jun 6, 2025, 7:35:10 AM
    Author     : PC
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO"%>
<%@page import="model.ProductDTO"%>
<%@page import="utils.AuthUtils"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Form</title>
        <style>
            /* Reset and base styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                padding: 20px;
                line-height: 1.6;
            }

            /* Container styles */
            .container {
                max-width: 600px;
                margin: 0 auto;
                background: white;
                border-radius: 15px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            /* Header styles */
            h1 {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                text-align: center;
                padding: 30px 20px;
                margin: 0;
                font-size: 28px;
                font-weight: 300;
                letter-spacing: 1px;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            /* Form container */
            form {
                padding: 30px;
            }

            /* Form group styles */
            form > div {
                margin-bottom: 25px;
                position: relative;
            }

            /* Label styles */
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #333;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            /* Required field indicator */
            label::after {
                content: "";
            }

            label[for="id"]::after,
            label[for="name"]::after,
            label[for="price"]::after {
                content: " *";
                color: #e74c3c;
                font-weight: bold;
            }

            /* Input styles */
            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 12px 15px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 16px;
                transition: all 0.3s ease;
                background-color: #fafafa;
            }

            input[type="text"]:focus,
            input[type="number"]:focus,
            textarea:focus {
                outline: none;
                border-color: #667eea;
                background-color: white;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                transform: translateY(-2px);
            }

            /* Textarea specific styles */
            textarea {
                height: 100px;
                resize: vertical;
                font-family: inherit;
            }

            /* Checkbox container */
            .checkbox-container {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-top: 10px;
            }

            /* Checkbox styles */
            input[type="checkbox"] {
                width: 20px;
                height: 20px;
                accent-color: #667eea;
                cursor: pointer;
            }

            input[type="checkbox"] + label {
                margin: 0;
                cursor: pointer;
                font-weight: normal;
                text-transform: none;
                letter-spacing: normal;
                color: #555;
            }

            /* Button container */
            form > div:last-child {
                display: flex;
                gap: 15px;
                justify-content: center;
                margin-top: 40px;
                margin-bottom: 0;
            }

            /* Button styles */
            input[type="submit"],
            input[type="reset"] {
                padding: 12px 30px;
                border: none;
                border-radius: 25px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            input[type="submit"] {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            }

            input[type="submit"]:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            }

            input[type="reset"] {
                background: linear-gradient(135deg, #95a5a6 0%, #7f8c8d 100%);
                color: white;
                box-shadow: 0 4px 15px rgba(149, 165, 166, 0.3);
            }

            input[type="reset"]:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(149, 165, 166, 0.4);
            }

            /* Message styles */
            .message-container {
                padding: 20px 30px;
                border-top: 1px solid #eee;
                background-color: #f8f9fa;
            }

            .error-message {
                color: #e74c3c;
                background-color: #fdf2f2;
                padding: 12px 15px;
                border-left: 4px solid #e74c3c;
                border-radius: 4px;
                margin-bottom: 10px;
                font-weight: 500;
            }

            .success-message {
                color: #27ae60;
                background-color: #f2fdf2;
                padding: 12px 15px;
                border-left: 4px solid #27ae60;
                border-radius: 4px;
                margin-bottom: 10px;
                font-weight: 500;
            }

            /* Access denied styles */
            .access-denied {
                text-align: center;
                padding: 60px 30px;
                color: #e74c3c;
                font-size: 18px;
                font-weight: 500;
                background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
                color: white;
                border-radius: 15px;
                margin: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            }

            /* Responsive design */
            @media (max-width: 768px) {
                body {
                    padding: 10px;
                }

                .container {
                    margin: 0;
                    border-radius: 10px;
                }

                h1 {
                    font-size: 24px;
                    padding: 20px;
                }

                form {
                    padding: 20px;
                }

                form > div:last-child {
                    flex-direction: column;
                    align-items: center;
                }

                input[type="submit"],
                input[type="reset"] {
                    width: 100%;
                    max-width: 200px;
                }
            }

            /* Animation for form load */
            .container {
                animation: slideIn 0.5s ease-out;
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Hover effects for form fields */
            input[type="text"]:hover,
            input[type="number"]:hover,
            textarea:hover {
                border-color: #bbb;
                background-color: white;
            }

            /* Placeholder styles */
            input::placeholder,
            textarea::placeholder {
                color: #999;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <%
            if(AuthUtils.isAdmin(request)){
                ProductDTO product = (ProductDTO) request.getAttribute("product");
                String checkError = (String) request.getAttribute("checkError");
                String message = (String) request.getAttribute("message");
        %>
        <div class="container">
            <h1>Product Form</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="addProduct"/>

                <div>
                    <label for="id">ID</label> 
                    <input type="text" name="id" id="id" required
                           value="<%=product!=null?product.getId():""%>" />
                    <span style="color:red"><%=request.getAttribute("idError")!=null?request.getAttribute("idError"):""%></span>
                </div>

                <div>
                    <label for="name">Name</label> 
                    <input type="text" name="name" id="name" required
                           value="<%=product!=null?product.getName():""%>"/>
                    <span style="color:red"><%=request.getAttribute("nameError")!=null?request.getAttribute("nameError"):""%></span>
                </div>

                <div>
                    <label for="image">Image</label> 
                    <input type="text" name="image" id="image"
                           value="<%=product!=null?product.getImage():""%>"/>
                </div>

                <div>
                    <label for="description">Description</label> 
                    <textarea name="description" id="description"><%=product!=null?product.getDescription():""%></textarea>
                </div>

                <div>
                    <label for="price">Price</label> 
                    <input type="number" name="price" id="price" min="0" step="0.01" required
                           value="<%=product!=null?product.getPrice():""%>" />
                    <span style="color:red"><%=request.getAttribute("priceError")!=null?request.getAttribute("priceError"):""%></span>
                </div>

                <div>
                    <label for="size">Size</label> 
                    <input type="text" name="size" id="size"
                           value="<%=product!=null?product.getSize():""%>"/>
                </div>

                <div>
                    <label for="status">Status (Active Product)</label> 
                    <input type="checkbox" name="status" id="status" value="true"
                           <%=product!=null && product.isStatus() ? "checked" : "" %> />
                </div>

                <div>
                    <input type="submit" value="Add Product"/>
                    <input type="reset" value="Reset"/>
                </div>

                <div style="color:red">
                    <%=request.getAttribute("createError")!=null?request.getAttribute("createError"):""%>
                </div>
                <div style="color:green">
                    <%=request.getAttribute("message")!=null?request.getAttribute("message"):""%>
                </div>
            </form>
        </div>
        <%
        } else {
        %>
        <div class="access-denied">
            <%=AuthUtils.getAccessDeniedMessage(" product-form page ")%>
        </div>
        <%
        }
        %>
    </body>
</html>