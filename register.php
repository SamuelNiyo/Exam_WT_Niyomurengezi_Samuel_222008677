<?php
//call the file that contain database connection
include"dbconnection.php";
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id=$_POST['user_id'];
    $username=$_POST['username'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    $user_type=$_POST['user_type'];
    $registration_date=$_POST['registration_date'];
    $gender=$_POST['gender'];
    $password=password_hash($_POST['password'], PASSWORD_DEFAULT);
    $sql="INSERT INTO users(user_id, username, email, password, user_type, registration_date, gender) VALUES('$user_id','$username','$email','$password','$user_type','$registration_date','$gender')";
    $result=$connection->query($sql);
    if (!$result) {
        echo "Error: ".$sql."<br>" .$connection->error;
    }
    else{
        echo "Data Inserted Successfully";
        header("location:login.html");
        exit();
    }
    
}

?>