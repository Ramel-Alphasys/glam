<?php

require 'database.php';
// set here connection to database
$conToServer = new ServerCon([$serverUsed, $databasePort, $databaseUsed, $user, $pass]);
require 'ssp.class.php';

try {
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * Easy set variables
     */

    // DB table to use
    $table = 'g_category';

    // Table's primary key
    $primaryKey = 'gcatId';

    // Array of database columns which should be read and sent back to DataTables.
    // The `db` parameter represents the column name in the database, while the `dt`
    // parameter represents the DataTables column identifier. In this case object
    // parameter names
    $columns = array(
        array('db' => 'gcatId', 'dt' => 'gcatId'),
        array('db' => 'gcat_name', 'dt' => 'gcat_name')
    );

    // SQL server connection information
    $sql_details = array(
        'user' => $user,
        'pass' => $pass,
        'db'   => $databaseUsed,
        'host' => $serverUsed
    );


    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * If you just want to use the basic configuration for DataTables with PHP
     * server-side, there is no need to edit below this line.
     */

    echo json_encode(
        SSP::simple($_GET, $sql_details, $table, $primaryKey, $columns)
    );
} catch (PDOException $e) {
    echo json_encode([['MESSAGE' => "Connection failed: " . $conToServer->htmlize($e->getMessage())]]);
}
