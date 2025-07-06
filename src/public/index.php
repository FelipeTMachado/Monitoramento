<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        require "../config/database.php";

        $pdo = Database::conexaoMySQL();
        $stmt = $pdo->query("SELECT * FROM monitor");
        $monitors = $stmt->fetchAll();

        echo "TESTE";
        
        echo "<h1>Lista de Monitores</h1>";
        echo "<ul>";
        foreach ($monitors as $monitor) {
            echo "<li>" . htmlspecialchars($monitor['nome']) . "</li>";
        }
        echo "</ul>";
    ?>
</body>
</html>