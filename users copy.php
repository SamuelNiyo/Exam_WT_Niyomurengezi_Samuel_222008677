<?php 
include "dbconnection.php";
include "menu.php";
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/styleee.css" title="style1" media="screen,tv,print,handheld"/>
    <title>Task Rabbit-like Platform</title>
    <script>
        function confirmInsert(){
            return confirm('Do you want to insert this record?');
        }
    </script>
    <style>
        body {
            background-image: url('./images/kk.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
<center>
    <h2>TASK RABBIT-LIKE PLATFORM</h2>
    <section class="forms">
        <form action="users1.php" method="POST" class="sp" onsubmit="return confirmInsert();">
            <h3 style="color:green;">USERS FORM</h3>
            <label>User Id</label>
            <input type="text" name="user_id" required class="input"><br> 
            <label>Username</label>
            <input type="text" name="username" class="input" required><br> 
            <label>Email</label>
            <input type="text" name="email" required class="input"><br> 
            <label>Password</label>
            <input type="text" name="password" required class="input"><br>
            <label>User Type</label>
            <input type="text" name="user_type" class="input" required><br>  
            <label>User Type</label>
            <select name="user_type" class="input">
                <option value="service_provider">Service Provider</option>
                <option value="client">Client</option>
            </select><br><br>
            <input type="reset" name="reset" value="CANCEL" class="cn">
        </form>
    </section>
</center>
<br><br><br><br><br><br><br><br><br><br>
<footer>
    <p>Designed by Samuel-Niyomurengezi &copy; YEAR TWO BIT GROUP A &reg; 2024</p>
</footer>
</body>
</html>
