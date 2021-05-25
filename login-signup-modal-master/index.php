<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" type="text/css" />

  <link rel="stylesheet" href="css/reset.css" />
  <!-- CSS reset -->
  <link rel="stylesheet" href="css/style.css" />
  <!-- Resource style -->
  <link rel="stylesheet" href="css/demo.css" />
  <!-- Demo style -->
  <?php
  @ob_start();

  session_start();
  ?>
  <title>Log In &amp; Sign Up Form</title>
</head>

<body>

  <?php require('connect.php');
  ?>
  <header class="cd-main-header">
    <div class="cd-main-header__logo">
      <a href="#0"><img src="img/cd-logo.svg" alt="Logo" /></a>
    </div>

    <nav class="cd-main-nav js-main-nav">
      <ul class="cd-main-nav__list js-signin-modal-trigger">
        <!-- inser more links here -->
        <li>
          <a class="cd-main-nav__item cd-main-nav__item--signin" href="#0" data-signin="login">Sign in</a>
        </li>
        <li>
          <a class="cd-main-nav__item cd-main-nav__item--signup" href="#0" data-signin="signup">Sign up</a>
        </li>
      </ul>
    </nav>
  </header>
  <?php if (isset($_POST['submit'])) {
    $username = stripslashes($_REQUEST['signin-email']); // để bỏ dấu /
    echo $username;
    $username = mysqli_real_escape_string($conn, $username); // php chuyển xuống cho mysql xử lí
    $password = stripslashes($_REQUEST['signin-password']);
    echo $password;
    $password = mysqli_real_escape_string($conn, $password);
    $query = "SELECT * FROM `account` WHERE (phone='$username' or email='$username') and password='$password'";
    $result = mysqli_query($conn, $query); //or die(mysql_error());
    $rows = mysqli_num_rows($result);
    if ($rows == 1) {
      $row = $result->fetch_assoc();
      $customer = [
        'id' => $row['id'],
        'name' => $row['name'],
        'birthday' => $row['birthday'],
        'phone' => $row['phone'],
        'email' => $row['email'],
        'address' => $row['address'],
        'type' => $row['type'],
      ];
      $_SESSION['customer'] = $customer;
      if (isset($_SESSION['cart'])) {
        header("Location: cart.php");
      } else {
        header("Location: index.php");
      }
    } else {
      echo "<div class='form'><h3>Tên đăng nhập hoặc mật khẩu không đúng!</h3></br><a href='login.php'>Đăng nhập lại</a></div>";
    }
  } else { ?>
    <div class="cd-signin-modal js-signin-modal">
      <!-- this is the entire modal form, including the background -->
      <div class="cd-signin-modal__container">
        <!-- this is the container wrapper -->
        <ul class="
            cd-signin-modal__switcher
            js-signin-modal-switcher js-signin-modal-trigger
          ">
          <li>
            <a href="#0" data-signin="login" data-type="login">Sign in</a>
          </li>
          <li>
            <a href="#0" data-signin="signup" data-type="signup">New account</a>
          </li>
        </ul>


        <!-- cd-signin-modal__block -->

        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup">
          <!-- sign up form -->
          <form class="cd-signin-modal__form">
            <p class="cd-signin-modal__fieldset">
              <label class="
                  cd-signin-modal__label
                  cd-signin-modal__label--username
                  cd-signin-modal__label--image-replace
                " for="signup-username">Tên</label>
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                  cd-signin-modal__input--has-border
                " id="signup-username" type="text" placeholder="Tên Hiển Thị" />
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="
                  cd-signin-modal__label
                  cd-signin-modal__label--email
                  cd-signin-modal__label--image-replace
                " for="signup-email">E-mail</label>
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                  cd-signin-modal__input--has-border
                " id="signup-email" type="email" placeholder="E-mail" />
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="
                  cd-signin-modal__label
                  cd-signin-modal__label--password
                  cd-signin-modal__label--image-replace
                " for="signup-password">Mật Khẩu</label>
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                  cd-signin-modal__input--has-border
                " id="signup-password" type="text" placeholder="Mật Khẩu" />
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                " type="submit" value="Create account" />
            </p>
          </form>
        </div>
        <!-- cd-signin-modal__block -->

        <div class="cd-signin-modal__block js-signin-modal-block" data-type="reset">
          <!-- reset password form -->
          <p class="cd-signin-modal__message">
            Lost your password? Please enter your email address. You will
            receive a link to create a new password.
          </p>

          <form class="cd-signin-modal__form">
            <p class="cd-signin-modal__fieldset">
              <label class="
                  cd-signin-modal__label
                  cd-signin-modal__label--email
                  cd-signin-modal__label--image-replace
                " for="reset-email">E-mail</label>
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                  cd-signin-modal__input--has-border
                " id="reset-email" type="email" placeholder="E-mail" />
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <input class="
                  cd-signin-modal__input
                  cd-signin-modal__input--full-width
                  cd-signin-modal__input--has-padding
                " type="submit" value="Reset password" />
            </p>
          </form>

          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger">
            <a href="#0" data-signin="login">Back to log-in</a>
          </p>
        </div>
        <!-- cd-signin-modal__block -->
        <a href="#0" class="cd-signin-modal__close js-close">Close</a>
      </div>
      <!-- cd-signin-modal__container -->
    </div>


  <?php }
  ob_flush(); ?>

  <!-- cd-signin-modal -->
  <script src="js/placeholders.min.js"></script>
  <!-- polyfill for the HTML5 placeholder attribute -->
  <script src="js/main.js"></script>
  <!-- Resource JavaScript -->
</body>

</html>