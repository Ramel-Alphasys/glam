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
    $table = 'gv_transactions';

    // Table's primary key
    $primaryKey = 'transac_Id';

    // Array of database columns which should be read and sent back to DataTables.
    // The `db` parameter represents the column name in the database, while the `dt`
    // parameter represents the DataTables column identifier. In this case object
    // parameter names
    $columns = array(
        array('db' => 'transac_Id', 'dt' => 'transac_Id'),
        array('db' => 'full_name', 'dt' => 'full_name'),
        array('db' => 'product_name', 'dt' => 'product_name'),
        array('db' => 'product_type', 'dt' => 'product_type'),
        array(
            'db'        => 'product_price',
            'dt'        => 'product_price',
            'formatter' => function ($d, $row) {
                return '₱ ' . number_format($d, 2, '.', '');
            }
        ),
        array(
            'db'        => 'payment',
            'dt'        => 'payment',
            'formatter' => function ($d, $row) {
                return '₱ ' . number_format($d, 2, '.', '');
            }
        ),
        array('db' => 'method', 'dt' => 'method'),
        array(
            'db'        => 'balance',
            'dt'        => 'balance',
            'formatter' => function ($d, $row) {
                return '₱ ' . number_format($d, 2, '.', '');
            }
        ),
        array('db' => 'transaction_date', 'dt' => 'transaction_date'),
        array('db' => 'status', 'dt' => 'status')
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
