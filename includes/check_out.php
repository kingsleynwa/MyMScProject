<?php

$order_id = "";
$fname = "";
$lname = "";
$address = "";
$state = "";
$email = "";
$phone = "";
$order_notes = "None";
$food_id = "";
$username = "";
$price = "";
$quantity = "";
$rand = "0123456789";
$rand_shuffle = str_shuffle($rand);
$time = 4;
$trend = 0;

if(isset($_POST['checkout'])){
    $fname = mysqli_real_escape_string($db, $_POST['fname']);
    $lname = mysqli_real_escape_string($db, $_POST['lname']);
    $email = mysqli_real_escape_string($db, $_POST['email']);
    $phone = mysqli_real_escape_string($db, $_POST['phone']);
    $address = mysqli_real_escape_string($db, $_POST['address']);
    $state = mysqli_real_escape_string($db, $_POST['state']);
    $order_notes = mysqli_real_escape_string($db, $_POST['order_notes']);
    $status = "pending";
    $order_id = substr($rand_shuffle, 0, 6);
    $u_email = $_SESSION['email'];
    $run = mysqli_query($db, "SELECT * FROM guest_table WHERE email='$u_email'");
    $ran = mysqli_fetch_assoc($run);
    $username = $ran['username'];
    
    if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $emailErr = '<div class="danger">Please enter a valid mail!</div>';
    }
    
    
    if(!$emailErr){
    mysqli_query($db, "INSERT INTO order_table(order_id, fname, lname, email, phone, address, state, status, username, special_notes)VALUES('$order_id', '$fname', '$lname', '$email', '$phone', '$address', '$state', '$status', '$username', '$order_notes')");

    $decision = mysqli_query($db, "SELECT * from order_table WHERE status = 0");
    $num = mysqli_num_rows($decision);
    
        
    if(!empty($_SESSION['cart'])){
        foreach($_SESSION['cart'] as $keys => $value){
            $id = $value['id'];
            $price = $value['price'];
            $quantity = $value['quantity'];
            $spice_level = $value['spice_level'];    
    
    $get = mysqli_query($db, "SELECT * FROM trending WHERE id = '$id'");
    $gotten = mysqli_fetch_array($get);
    
    foreach($get as $gotten){
    $trend = $quantity + $gotten['trend'];
    }    
            
            
    $subject = "Message from Emeals";
    $email_message = "One new order, your order id is " . $order_id;
    $from = 'Emeals Website';
    $sender = "From:phpwebtestmail@gmail.com";
    $to = $email;
    $sub = 'New order notification';
    $headers = $from . "\r\n";
    $headers .= $to . "\r\n";
    $headers .= $sub . "\r\n";
    $body = "From: $from\nSubject: $subject\nHeading: $sub\nMessage: $email_message";
    $mail = mail($to, $headers, $body, $sender); // sending the email        
            
            
    /* This is for the guest  email content */
    $owner_subject = "New Order Notification";
    $owner_email_message = "One new order, visit your admin dashboard to view order details!";
    $owner_from = 'Emeals Website';
    $owner_sender = "From:phpwebtestmail@gmail.com";
    $owner_to = "phpwebtestmail@gmail.com";
    $owner_sub = 'Order Notification from Emeals Website';
    $owner_headers = $from . "\r\n";
    $owner_headers .= $to . "\r\n";
    $owner_headers .= $sub . "\r\n";
    $owner_body = "From: $owner_from\nSubject: $owner_subject\nHeading: $owner_sub\nMessage: $owner_email_message";
    $owner_mail = mail($owner_to, $owner_headers, $owner_body, $owner_sender); // sending the email        
    
            
    
    mysqli_query($db, "UPDATE trending SET trend = '$trend' WHERE id = '$id'");
    
            
    mysqli_query($db, "INSERT INTO orders(order_id, food_id, price, quantity, spice)VALUES('$order_id', '$id', '$price', '$quantity', '$spice_level')");
    
    $_SESSION['order_success'] = '<div class="success">Your order has been received! Delivery Time: ' . $time * $num . 'mins</div>';
    unset($_SESSION['cart']);
    header('location:cart.php');
            }
        }
    }else{
        $message = "";
    }
}
?>