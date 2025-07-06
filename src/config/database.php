<?php 

class Database {
    private static $pdo;
    private static $mongoClient;

    public static function conexaoMySQL(): PDO {
        if (self::$pdo === null) {
            $local   = $_ENV["MYSQL_HOST"];
            $banco   = $_ENV["MYSQL_DATABASE"];
            $usuario = $_ENV["MYSQL_USER"];
            $senha   = $_ENV["MYSQL_PASSWORD"];

            $urlConexao = "mysql:host=$local;dbname=$banco;charset=utf8mb4";

            $options = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ];

            try {
                self::$pdo = new PDO($urlConexao, $usuario, $senha, $options);

            } catch (\PDOException $e) {
                throw new \PDOException($e->getMessage(), (int)$e->getCode());
            }
        }

        return self::$pdo;
    }


    public static function conexaoMongoDB(): MongoDB {
        if (self::$mongoClient === null) {
            $local = $_ENV['MONGODB_HOST'];
            $usuario = $_ENV['MONGODB_INITDB_ROOT_USERNAME'];
            $senha = $_ENV['MONGODB_INITDB_ROOT_PASSWORD'];
            
            $uri = "mongodb://{$usuario}:{$senha}@{$local}:27017";

            try {
                self::$mongoClient = new MongoDB($uri);
            } catch (\Exception $e) {
                // Logar o erro
                throw new \Exception($e->getMessage());
            }
        }
        
        return self::$mongoClient;
    }
}
