<?php
  require 'functions.php';
    // create new database conn initiation
  $database = new Database();

  // connect via PDO
  $conn = $database->getConnection();

  // get data using query in get_projects function
  $data = get_projects($conn);
  
  echo json_encode($data);
?>