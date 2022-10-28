<?php
require 'database.php';
// set here connection to database
$conToServer = new ServerCon(['localhost', 3306, 'glamdb', 'root', 'admin']);
require 'ssp.class.php';

try {
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * Easy set variables
     */

    // DB table to use
    $table = 'g_product';

    // Table's primary key
    $primaryKey = 'gpId';

    // Array of database columns which should be read and sent back to DataTables.
    // The `db` parameter represents the column name in the database, while the `dt`
    // parameter represents the DataTables column identifier. In this case object
    // parameter names
    $columns = array(
        array('db' => 'gpId', 'dt' => 'gpId'),
        array(
            'db'        => 'gp_product_img',
            'dt'        => 'gp_product_img',
            'formatter' => function ($d, $row) {
                return '<img src="/glam/glamserver/assets/contents/' . $d . '" />';
            }
        ),
        array('db' => 'gp_name', 'dt' => 'gp_name'),
        array('db' => 'gp_description',  'dt' => 'gp_description'),
        array('db' => 'gp_type',   'dt' => 'gp_type'),
        array(
            'db'        => 'gp_availability',
            'dt'        => 'gp_availability',
            'formatter' => function ($d, $row) {
                if ($d == 1) {
                    return 'Available';
                } else if ($d == 0) {
                    return 'Not Available';
                }
            }
        ),
        array(
            'db'        => 'gp_price',
            'dt'        => 'gp_price',
            'formatter' => function ($d, $row) {
                return '₱ ' . number_format($d, 2, '.', '');
            }
        )
    );

    // SQL server connection information
    $sql_details = array(
        'user' => 'root',
        'pass' => 'admin',
        'db'   => 'glamdb',
        'host' => 'localhost'
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
