<?php

/**
 * @ Name: CRUD.php
 * @ Purpose:
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-10-28 19:32:37
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-11-01 21:24:30
 * @ Change Log:
 */
class serverManipulation
{
    public function sm_ur_server($params)
    {
        try {

            $query = "UPDATE ${params['table']} SET ${params['fields']} ";

            if (array_key_exists("filter", $params)) {
                $query .= "WHERE ${params['filter']}";
            }

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed in sm_ur_server: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }

    public function sm_cr_server($params)
    {
        try {

            $query = "INSERT INTO ${params['table']} VALUES(${params['fields']})";

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed in sm_cr_server: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }

    public function sm_dr_server($params)
    {
        try {

            $query = "DELETE FROM ${params['table']} WHERE ${params['filter']}";

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }

    public function sm_vr_server($params)
    {
        try {

            $query = "SELECT ${params['fields']} FROM ${params['table']} ";

            if (array_key_exists("filter", $params)) {
                $query .= "${params['filter']}";
            }

            $data = $params['dbcon']->startDb()->prepare($query);
            $data->execute();
            $checker = $data->fetchAll();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }

    public function sm_mailing($params)
    {
        try {

            mail($params['to'], $params['subject'], $params['message'], $params['headers']);

            return ['STATUS' => "Mail Sent. Please check your email."];
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }
}