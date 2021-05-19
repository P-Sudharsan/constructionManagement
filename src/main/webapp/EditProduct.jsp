<%@page import="com.cems.dao.InventDAO"%>
<%@page import="com.cems.dao.connection"%>
<%@page import="com.cems.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
int product_id = Integer.parseInt(request.getParameter("product_id"));
    InventDAO proda = new InventDAO(connection.getConnection());
    Product pro = proda.getSingleProduct(product_id);
    request.setAttribute("edit_products", pro);
%>
<!DOCTYPE html>
<html>
    <head>
         <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>Edit Product Data</title>
        <style>
            .inner{
                position: relative;
                margin: 0 auto;
                width: 650px;
                display: block;
                padding: 50px 0;
            }
            h3{
                text-align: center;
                border-bottom: 2px solid midnightblue;
                margin-bottom: 20px;
            }
            nav li a{
                font-size: 25px;
                font-weight: 500;
            }
            a{
                color: #fff;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
       <div  class="container-fluid">
            <nav class="navbar navbar-light">
                <a class="navbar-brand">Products Edit</a>
                <ul class="navbar-nav ml-auto mt-3 mx-5">
<li class="nav-item">
                            <a class="nav-link active" href="invent.jsp">Home</a>
                        </li>
</ul>
</nav>
        </div>
<div class="inner">
            <div class=" container">
                <div class="row">
                    <div class="col-12">
                        <h3>
Edit Product Details</h3>
<form action="EditProduct" method="post">
                            <div class="form-group">
                                <label>Product ID</label>
                                <input class="form-control" name="product_id" value="${edit_products.product_id }" required>
                            </div>
<div class="form-group">
                                <label>Product Name</label>
                                <input class="form-control" name="pname" value="${edit_products.pname }" required>
                            </div>
<div class="form-group">
                                <label>Quantity</label>
                                <input class="form-control" name="quantity" value="${edit_products.quantity}" required>
                            </div>
<div class="form-group">
                                <label>Price Per Hour</label>
                                <input class="form-control" name="priceperhr" value="${edit_products.priceperhr}" required>
                             </div>                        
                          <div style="color: #FF0000;">${errorMessage}</div><br>
<button type="submit" class="btn btn-primary">Submit</button>
                            <button  class="btn btn-primary"><a href="invent.jsp">Cancel</a></button>
                        </form>
</div>
</div>
</div>
</div>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        
    </body>
</html>

