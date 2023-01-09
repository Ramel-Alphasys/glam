<?php
/**
 * @ Name: CRUD.php
 * @ Purpose:
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-10-28 19:32:37
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2023-01-09 10:40:33
 * @ Change Log:
 */
class serverManipulation
{
    /*****************************
     * METHOD TO UPDATE DATABASE *
     *          RECORD           *
     *****************************/
    public function sm_ur_server($params)
    {
        try {

            $query = "UPDATE {$params['table']} SET {$params['fields']} WHERE {$params['filter']}";

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed in sm_ur_server: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }
    /***************************
     * METHOD TO CREATE RECORD *
     *       IN DATABASE       *
     ***************************/
    public function sm_cr_server($params)
    {
        try {

            $query = "INSERT INTO {$params['table']} VALUES({$params['fields']})";

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed in sm_cr_server: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }
    /***************************
     * METHOD TO DELETE RECORD *
     *       IN DATABASE       *
     ***************************/
    public function sm_dr_server($params)
    {
        try {

            $query = "DELETE FROM {$params['table']} WHERE {$params['filter']}";

            $checker = $params['dbcon']->startDb()->prepare($query)->execute();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }
    /**************************
     * METHOD TO FETCH RECORD *
     *      IN DATABASE       *
     **************************/
    public function sm_vr_server($params)
    {
        try {

            $query = "SELECT {$params['fields']} FROM {$params['table']} ";

            if (array_key_exists("filter", $params)) {
                $query .= "{$params['filter']}";
            }

            $data = $params['dbcon']->startDb()->prepare($query);
            $data->execute();
            $checker = $data->fetchAll();

            return (!empty($checker)) ? $checker : null;
        } catch (PDOException $e) {
            echo json_encode([['MESSAGE' => "Connection failed: " . $params['dbcon']->htmlize($e->getMessage())]]);
        }
    }
    /****************************
     * METHOD FOR SENDING EMAIL *
     ****************************/
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