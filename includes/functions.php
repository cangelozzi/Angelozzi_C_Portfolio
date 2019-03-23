<?php
require 'connect.php';

// get all projects and category with INNER JOIN via the linking table
function get_projects($pdo)
{
    // create a query
    $query = "SELECT p.*, c.category_name FROM tbl_projects p INNER JOIN tbl_proj_cat l INNER JOIN tbl_categories c ON p.project_id = l.project_id AND l.category_id = c.category_id;";

    // pass query to connection
    $get_projects = $pdo->prepare($query);
    $get_projects->execute();

    // add fetched result to array
    $results = array();
    while ($row = $get_projects->fetch(PDO::FETCH_ASSOC)) {
        $results[] = $row;
    }
    return $results;
}
