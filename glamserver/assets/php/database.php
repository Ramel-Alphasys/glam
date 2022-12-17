<?php

/**
 * @ Name: database.php
 * @ Purpose: file contains the main connection to database
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-09-29 22:29:45
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-12-17 08:59:49
 * @ Change Log:
 */
error_reporting(E_ALL | E_STRICT);
date_default_timezone_set('Asia/Manila');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Expose-Headers: Content-Length, X-JSON");
header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: *");

class ServerCon
{

    protected $host;
    protected $port;
    protected $db;
    protected $user;
    protected $pass;

    function __construct($params)
    {
        $this->host = $params[0];
        $this->port = $params[1];
        $this->db = $params[2];
        $this->user = $params[3];
        $this->pass = $params[4];
    }

    public function startDb()
    {
        try {
            $conn = new PDO("mysql:host=" . ($this->host) . ";port=" . ($this->port) . ";dbname=" . ($this->db) . ";", $this->user, $this->pass);
            $conn->exec('set session innodb_strict_mode = on');
            $conn->exec('set session sql_mode = traditional');
            $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            return $conn;
        } catch (PDOException $e) {
            echo "Connection failed: " . $this->htmlize($e->getMessage());
        }
    }

    public function htmlize($val)
    {
        return htmlspecialchars($val, ENT_QUOTES, 'utf-8');
    }

    public function generateRandomString($length = 16)
    {
        $characters = str_split('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$*!-_');
        $randomString = '';
        foreach (array_rand($characters, $length) as $k) $randomString .= $characters[$k];
        return $randomString;
    }
}
// database config here
$databaseUsed = 'glamdb';
$databasePort = 3306;
$serverUsed = 'localhost';
$user = 'root';
$pass = 'admin';
