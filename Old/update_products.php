<?php
include 'db.php';

$manufacturers = isset($_POST['value']) ? $_POST['value'] : [];

$sql = "SELECT * FROM products WHERE type = 'Видеокарта'";
if (!empty($manufacturers)) {
    $manufacturers_str = implode("','", $manufacturers);
    $sql .= " AND manufacturer IN ('$manufacturers_str')";
}

$result = pg_query($conn, $sql);

while ($row = pg_fetch_assoc($result)) {
    echo "<div>" . $row['name'] . "</div>";
}
?>