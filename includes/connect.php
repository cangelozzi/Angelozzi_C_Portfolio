<?php

// CREATE A CONNECTION using Class and method
class Database
{
    // Note: specify your own database credentials
  private $host = "localhost";
  private $db_name = "db_portfolio";
  private $username = "root";
  private $password = "root";
  public $conn;
    // get the database connection
  public function getConnection()
  {
    $this->conn = null;
    try {
      $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
      $this->conn->exec("set names utf8");
    } catch (PDOException $exception) {
      echo "Connection error: " . $exception->getMessage();
      exit();
    }
    return $this->conn;
  }
}
?>