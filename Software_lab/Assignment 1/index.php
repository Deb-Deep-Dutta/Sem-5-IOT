<!DOCTYPE html>
<html>
<head>
    <title>Simple PHP Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Welcome to the Simple PHP Page</h1>

    <?php
    // Database connection
    $mysqli = new mysqli("localhost", "root", "", "sample_db");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Query to fetch data
    $sql = "SELECT * FROM users";
    $result = $mysqli->query($sql);

    if ($result->num_rows > 0) {
        echo "<table>";
        echo "<tr><th>ID</th><th>Username</th><th>Email</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["ID"] . "</td><td>" . $row["username"] . "</td><td>" . $row["email"] . "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "No data found.";
    }

    // Close connection
    $mysqli->close();
    ?>

</body>
</html>
