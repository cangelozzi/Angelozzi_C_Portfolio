<?php
require 'connect.php';
function get_projects($pdo)
{
  $query = "SELECT p.*, c.category_name FROM tbl_projects p INNER JOIN tbl_proj_cat l INNER JOIN tbl_categories c ON p.project_id = l.project_id AND l.category_id = c.category_id;";
  $get_projects = $pdo->query($query);
  $results = array();
  while ($row = $get_projects->fetch(PDO::FETCH_ASSOC)) {
    $results[] = $row;
  }
  return $results;
}
?>