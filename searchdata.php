<?php
include('dbconnection.php');
// Check if the 'query' GET parameter is set
if (isset($_GET['query'])) {
     
    // Sanitize input to prevent SQL injection
    $searchTerm = $connection->real_escape_string($_GET['query']);

    // Perform the search query for Site
    $sql = "SELECT * FROM users WHERE user_id LIKE '%$searchTerm%'";
    $result_users = $connection->query($sql);

    // Perform the search query for tasks
    $sql = "SELECT * FROM tasks WHERE task_id LIKE '%$searchTerm%'";
    $result_tasks = $connection->query($sql);

    // Perform the search query for service_providers
    $sql = "SELECT * FROM service_providers WHERE serviceprovider_id LIKE '%$searchTerm%'";
    $result_service_providers = $connection->query($sql);

    // Perform the search query for role
    $sql = "SELECT * FROM role WHERE role_id LIKE '%$searchTerm%'";
    $result_role = $connection->query($sql);

    // Perform the search query for reviews
    $sql = "SELECT * FROM reviews WHERE review_id LIKE '%$searchTerm%'";
    $result_reviews = $connection->query($sql);

    // Perform the search query for payment
    $sql = "SELECT * FROM payments WHERE payment_id LIKE '%$searchTerm%'";
    $result_payment = $connection->query($sql);

    // Perform the search query for tasks_availability
    $sql = "SELECT * FROM message WHERE message_id LIKE '%$searchTerm%'";
    $result_tasks_availability = $connection->query($sql);

    // Perform the search query for categories
    $sql = "SELECT * FROM categories WHERE category_id LIKE '%$searchTerm%'";
    $result_categories = $connection->query($sql);

    // Perform the search query for bookings
    $sql = "SELECT * FROM bookings WHERE booking_id LIKE '%$searchTerm%'";
    $result_bookings = $connection->query($sql);

    // Perform the search query for address
    $sql = "SELECT * FROM address WHERE address_id LIKE '%$searchTerm%'";
    $result_address = $connection->query($sql);


    // Output search results
    echo "<h2><u>Search Results:</u></h2>";
    echo "<h3>user:</h3>";
    if ($result_users->num_rows > 0) {
        while ($row = $result_users->fetch_assoc()) {
            echo "<p>" . $row['user_id'] . "</p>";
        }
    } else {
        echo "<p>No user found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Task:</h3>";
    if ($result_tasks->num_rows > 0) {
        while ($row = $result_tasks->fetch_assoc()) {
            echo "<p>" . $row['task_id'] . "</p>";
        }
    } else {
        echo "<p>No tasks found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Service Provider:</h3>";
    if ($result_service_providers->num_rows > 0) {
        while ($row = $result_service_providers->fetch_assoc()) {
            echo "<p>" . $row['serviceprovider_id'] . "</p>";
        }
    } else {
        echo "<p>No service provider found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Role:</h3>";
    if ($result_role->num_rows > 0) {
        while ($row = $result_role->fetch_assoc()) {
            echo "<p>" . $row['role_id'] . "</p>";
        }
    } else {
        echo "<p>No role found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Review:</h3>";
    if ($result_reviews->num_rows > 0) {
        while ($row = $result_reviews->fetch_assoc()) {
            echo "<p>" . $row['review_id'] . "</p>";
        }
    } else {
        echo "<p>No review found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Payment:</h3>";
    if ($result_payment->num_rows > 0) {
        while ($row = $result_payment->fetch_assoc()) {
            echo "<p>" . $row['payment_id'] . "</p>";
        }
    } else {
        echo "<p>No payment found matching the search term: " . $searchTerm . "</p>";
    }


    echo "<h3>Message:</h3>";
    if ($result_tasks_availability->num_rows > 0) {
        while ($row = $result_tasks->fetch_assoc()) {
            echo "<p>" . $row['message_id'] . "</p>";
        }
    } else {
        echo "<p>No message found matching the search term: " . $searchTerm . "</p>";
    }

     echo "<h3>Category:</h3>";
    if ($result_categories->num_rows > 0) {
        while ($row = $result_categories->fetch_assoc()) {
            echo "<p>" . $row['category_id'] . "</p>";
        }
    } else {
        echo "<p>No categories found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Booking:</h3>";
    if ($result_bookings->num_rows > 0) {
        while ($row = $result_bookings->fetch_assoc()) {
            echo "<p>" . $row['booking_id'] . "</p>";
        }
    } else {
        echo "<p>No bookings found matching the search term: " . $searchTerm . "</p>";
    }

    echo "<h3>Addres:</h3>";
    if ($result_address->num_rows > 0) {
        while ($row = $result_address->fetch_assoc()) {
            echo "<p>" . $row['address_id'] . "</p>";
        }
    } else {
        echo "<p>No address found matching the search term: " . $searchTerm . "</p>";
    }

    $connection->close();
} else {
    echo "No search term was provided.";
}
?>