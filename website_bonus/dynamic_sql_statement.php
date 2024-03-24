<?php
  // Connect to the PostgreSQL database
  $db = new PDO("pgsql:host=localhost;dbname=Warehouse", "postgres", "2424");

  // Get the SQL statement from the text input field
  $sql_statement = $_POST["sql_statement"];

  // Execute the SQL statement
  $results = $db->query($sql_statement);

  // Display the output of the SQL statement in a table
  echo "<table>";
  foreach ($results as $row) {
    echo "<tr>";
    foreach($row as $key => $value) {
      echo "<td>" . $key . "</td><td>" . $value . "</td>";
    }
    echo "</tr>";
  }
  echo "</table>";
?>
