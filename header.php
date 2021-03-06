<?php
include 'config/connect.php';
include 'config/funtion.php';
//include 'auth.php';
// session_start();
//   session_destroy();
ob_start();
// print_r($_SESSION);
?>
<?php
//$slider =  execute("SELECT * FROM  image WHERE type = 0 and status = 0 ORDER BY ordering limit 0,5")->fetch_all(MYSQLI_ASSOC);
$banner =  execute("SELECT * FROM  image WHERE type = 1 and status = 0 ORDER BY ordering")->fetch_all(MYSQLI_ASSOC);
$payment =  execute("SELECT * FROM  image WHERE type = 3 and status = 0 ORDER BY ordering DESC limit 0,5")->fetch_all(MYSQLI_ASSOC);
?>
<!doctype html>
<html class="no-js" lang="en">
<style>
    .loginmodal-container {
        padding: 30px;
        max-width: 350px;
        width: 100% !important;
        background-color: #F7F7F7;
        margin: 0 auto;
        border-radius: 2px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        overflow: hidden;
        font-family: roboto;
    }

    .loginmodal-container h1 {
        text-align: center;
        font-size: 1.8em;
        font-family: roboto;
    }

    .loginmodal-container input[type=submit] {
        width: 100%;
        display: block;
        margin-bottom: 10px;
        position: relative;
    }

    .loginmodal-container input[type=text],
    input[type=password] {
        height: 44px;
        font-size: 16px;
        width: 100%;
        margin-bottom: 10px;
        -webkit-appearance: none;
        background: #fff;
        border: 1px solid #d9d9d9;
        border-top: 1px solid #c0c0c0;
        /* border-radius: 2px; */
        padding: 0 8px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    .loginmodal-container input[type=text]:hover,
    input[type=password]:hover {
        border: 1px solid #b9b9b9;
        border-top: 1px solid #a0a0a0;
        -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    .loginmodal {
        text-align: center;
        font-size: 14px;
        font-family: 'Arial', sans-serif;
        font-weight: 700;
        height: 36px;
        padding: 0 8px;
        /* border-radius: 3px; */
        /* -webkit-user-select: none;
  user-select: none; */
    }

    .loginmodal-submit {
        /* border: 1px solid #3079ed; */
        border: 0px;
        color: #fff;
        text-shadow: 0 1px rgba(0, 0, 0, 0.1);
        background-color: #4d90fe;
        padding: 17px 0px;
        font-family: roboto;
        font-size: 14px;
        /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
    }

    .loginmodal-submit:hover {
        /* border: 1px solid #2f5bb7; */
        border: 0px;
        text-shadow: 0 1px rgba(0, 0, 0, 0.3);
        background-color: #357ae8;
        /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
    }

    .loginmodal-container a {
        text-decoration: none;
        color: #666;
        font-weight: 400;
        text-align: center;
        display: inline-block;
        opacity: 0.6;
        transition: opacity ease 0.5s;
    }

    .login-help {
        font-size: 12px;
    }

    .login-btn {
        text-align: center;
        margin-top: 50px;
    }

    .button {
        line-height: 55px;
        padding: 0 30px;
        background: #004a80;
        color: #fff;
        display: inline-block;
        font-family: roboto;
        text-decoration: none;
        font-size: 18px;
    }

    .button:hover,
    .button:visited {
        background: #006cba;
        color: #fff;
    }
</style>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BookStore</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="public/img/favicon.png">

    <!-- all css here -->
    <!-- bootstrap v3.3.6 css -->
    <link rel="stylesheet" href="public/css/bootstrap.min.css">

    <!-- meanmenu css -->
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="public/css/owl.carousel.css">
    <!-- font-awesome css -->
    <!-- <link rel="stylesheet" href="public/css/font-awesome1.min.css"> -->
    <link rel="stylesheet" href="public/css/font-awesome.min.css">
    <!-- flexslider.css-->
    <!-- style css -->
    <link rel="stylesheet" href="public/style.css">
    <link href="admin/public/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="admin/public/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body class="home-4">
    <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->

    <!-- Add your site or application content here -->
    <!-- header-area-start -->
    <header>
        <!-- header-top-area-start -->

        <!-- header-top-area-end -->
        <!-- header-mid-area-start -->
        <div class="header-mid-area ptb-40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                        <div class="logo-area">
                            <a href="index.php"><img src="public/img/logo/logo.jpg" alt="logo" style=" margin: -25px; padding-top:5px; width:60%" /></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12">
                        <div class="header-search">
                            <form action="category.php" id="search_form">
                                <input type="text" placeholder="Nh???p t??? kh??a t??m ki???m. . ." name="search" />
                                <a href="javascript:{}" onclick="document.getElementById('search_form').submit();"><i class="fa fa-search"></i><input type="hidden"></a>
                            </form>
                        </div>
                    </div>



                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">

                        <div class="account-area ">
                            <!-- text-right -->
                            <ul>
                                <li>
                                    <p style="color:#4a4948; font-size: 18px; margin:10px;">
                                        <?php
                                        if (isset($_SESSION['customer'])) {
                                            echo "Xin ch??o " . $_SESSION['customer']['name'];
                                        ?>!</p>
                                </li>
                                <!--L???y cookie ????? hi???n th??? th??ng tin user-->

                                <li>
                                    <?php
                                            if (isset($_SESSION['customer']) && isset($_SESSION['customer']['type']) == 1) {
                                    ?>
                                        <a href="auth_edituser.php"><i class="fa fa-user" style="font-size: 25px"></i> T??i Kho???n</a>
                                        <a href="admin/login.php" target="_blank"><i class="fa fa-user-secret" style="font-size: 25px"></i> Admin</a>
                                    <?php } else if (isset($_SESSION['customer']) && isset($_SESSION['customer']['type']) == 0) { ?>
                                        <a href="auth_edituser.php"><i class="fa fa-user" style="font-size: 25px;color: #444444"></i> T??i Kho???n</a>
                                    <?php } ?>

                                </li>
                                <li><a class="btn btn-primary" style="color:#4a4948; border-radius: 10px; font-size:18px; margin-left: 7px" href="logout.php" role="button">????ng xu???t</a></li>
                            <?php } else {
                                            echo "????ng Nh???p Ngay"; ?>
                                </p>
                                </li>
                                <!--L???y cookie ????? hi???n th??? th??ng tin user-->
                                <li>
                                    <a class="btn btn-primary" style="color:white; border-radius: 10px; font-size:18px; margin-left: 7px" href="login.php" role="button">????ng nh???p</a>
                                    <a class="btn btn-primary" style="color:white; border-radius: 10px; font-size:18px; margin-left: 7px" href="register.php" role="button">????ng K??</a>
                                </li>

                            <?php } ?>
                            </ul>
                        </div>
                    </div>

                    <div class="my-cart" id="cart-top">
                        <ul>
                            <li><a href="cart.php" id="cart"><i class="fa fa-shopping-cart"></i>Gi??? h??ng</a>
                                <span><?php echo isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0; ?></span>
                                <div class="mini-cart-sub">
                                    <div class="cart-product">
                                        <?php if (isset($_SESSION['cart'])) { ?>
                                            <?php foreach ($_SESSION['cart'] as $key => $value) { ?>
                                                <div class="single-cart">
                                                    <div class="cart-img">
                                                        <a href="#"><img src="admin/public/image/product/<?php echo $value['image'] ?>" alt="book" /></a>
                                                    </div>
                                                    <div class="cart-info">
                                                        <h5><a href="#"><?php echo $value['name'] ?></a></h5>
                                                        <p><?php echo $value['quantity'] ?> x <span class="price"><?php echo $value['price'] ?></span></p>
                                                    </div>
                                                    <div class="cart-icon">
                                                        <a href="xuli-cart.php?action=remove&id=<?php echo $value['id']; ?>"><i class="fa fa-remove"></i></a>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                    </div>
                                    <div class="cart-totals">
                                        <h5>Total <span class="price"><?php echo isset($_SESSION['total_cart']) ? $_SESSION['total_cart'] : 0 ?></span></h5>
                                    </div>
                                    <div class="cart-bottom">
                                        <a class="view-cart" href="cart.php">Xem gi??? h??ng</a>
                                        <a href="checkout.php">Thanh to??n</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- header-mid-area-end -->
        <!-- main-menu-area-start -->
        <div class="main-menu-area hidden-sm hidden-xs" id="header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="menu-area">
                            <nav>
                                <ul>
                                    <li class="active"><a href="index.php">Trang ch???</a></li>
                                    <li><a href="category.php">Danh m???c<i class="fa fa-angle-down"></i></a>
                                        <div class="mega-menu">
                                            <?php
                                            $category = execute("SELECT * FROM category WHERE parent_id = 0");
                                            foreach ($category as $key => $value) {
                                                $parent = $value['id'];
                                                $sub = execute("SELECT * FROM category WHERE parent_id = $parent");
                                            ?>
                                                <span>
                                                    <a href="category.php?cate_id=<?php echo $value['id']; ?>" class="title"><?php echo $value['name']; ?></a>
                                                    <?php foreach ($sub as $k => $val) { ?>
                                                        <a href="category.php?cate_id=<?php echo $val['id']; ?>"><?php echo $val['name']; ?></a>
                                                    <?php } ?>
                                                </span>
                                            <?php } ?>
                                        </div>
                                    </li>
                                    <li><a href="404.php">Tin t???c</a></li>
                                    <li><a href="about.php">Gi???i thi???u</a></li>
                                    <li><a href="contact.php">Li??n h???</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="loginmodal-container">
                    <h1>Login to Your Account</h1><br>
                    <form>
                        <input type="text" name="user" placeholder="Username">
                        <input type="password" name="pass" placeholder="Password">
                        <input type="submit" name="login" class="login loginmodal-submit" value="Login">
                    </form>

                    <div class="login-help">
                        <a href="#">Register</a> - <a href="#">Forgot Password</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- main-menu-area-end -->
    </header>