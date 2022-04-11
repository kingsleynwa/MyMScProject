<?php
include_once('../includes/connection.php');
session_start();
$email = "";
    $message = "";
    $emailErr = "";
    $token = "0123456789qwertyuiopasdfghjklzxcvbnm";
    $token_shuffle = str_shuffle($token);

if(isset($_POST['reset'])){
    $email = mysqli_real_escape_string($db, $_POST['email']);
    $password = substr($token_shuffle, 0, 10);
    $new_password = md5($password);


    if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $emailErr = "<div class='danger wow fadeInDown' data-wow-duration='1s'>E-mail is invalid</div>";
    }

    $select = mysqli_query($db, "SELECT * FROM admin_users WHERE email = '$email'");
    $num = mysqli_num_rows($select);

    if($num == 1 && !$emailErr){

    /* This is for the guest  email content */
    $subject = "New Password";
    $email_message = "Your new password is " . $password . ". Remember to change it after logging in!";
    $from = 'Emeals Website';
    $sender = "From:phpwebtestmail@gmail.com";
    $to = $email;
    $sub = 'Password Reset Message From Emeals';
    $headers = $from . "\r\n";
    $headers .= $to . "\r\n";
    $headers .= $sub . "\r\n";
    $body = "From: $from\nSubject: $subject\nHeading: $sub\nMessage: $email_message";
    $mail = mail($to, $headers, $body, $sender); // sending the email

    if($mail){
        mysqli_query($db, "UPDATE guest_table SET password = '$new_password' WHERE email = '$email'");
        $message = "<div class='success wow fadeInDown' data-wow-duration='1s'>Password reset successful, visit your email for new password!</div>";
    }else{
        $message = "<div class='danger wow fadeInDown' data-wow-duration='1s'>Failed, Check Connection!</div>";    
        }
    }elseif($num != 1 && !$emailErr){
        $message = "<div class='danger wow fadeInDown' data-wow-duration='1s'>Email doesn't exist!</div>";
        }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>E-Meals</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome/css/brands.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome/css/brands.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome/css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="assets/css/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../assets/css/js/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../assets/css/js/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="../assets/css/js/slick.css" type="text/css">
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
</head>
    
<body>
    
    <div class="admin-login-container">
        <div class="login-form wow bounce">
            <div class="login-image">
                <div class="overlay">
                    <div class="header wow fadeIn" data-wow-delay='1s'><span class="fas fa-hamburger"></span> EMEALS ADMIN</div>
                </div>
            </div>
            <!-- <div>Successful!</div> -->
            <?php
                if(!empty($emailErr)){echo $emailErr; }
                if(!empty($message)){echo $message; }
            ?>
            <div class="login-welcome wow fadeInLeft" data-wow-delay='1s'>Fill up to reset password</div>
            <form method="post" action="" class="form-container">
                <div class="form-group wow fadeIn" data-wow-delay='1s'>
                    <input type="email" name="email" placeholder="Email" required> <span class="fas fa-envelope"></span>
                    <label class="label">Email</label>
                </div>
                <div class="form-group">
                    <button type="submit" name="reset">RESET</button>
                    <a href="home.php">&larr; Back to Login</a>
                </div>
            </form>
        </div>
    </div>
    
</body>

<script src="../assets/js/libraries/slick.js"></script>
<script src="../assets/js/libraries/jquery.magnific-popup.js"></script>
<script src="../assets/js/libraries/jquery.magnific-popup.min.js"></script>
<script src="../assets/js/libraries/wow.min.js"></script>
<script type="text/javascript" src="../assets/js/style.js"></script>
<script>
new WOW().init();
</script>
</html>