<?php
 
require_once 'include/db_functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
 
if (isset($_POST['name']) && isset($_POST['number']) && isset($_POST['province']) && isset($_POST['district']) && isset($_POST['email']) && isset($_POST['password'])) {
 
    // receiving the post params
    $name = $_POST['name'];
    $number = $_POST['number'];
    $province = $_POST['province'];
    $district = $_POST['district'];
    $email = $_POST['email'];
    $password = $_POST['password'];
 
    // check if user is already existed with the same email
    if ($db->isUserExisted($email)) {
        // user already existed
        $response["error"] = TRUE;
        $response["error_msg"] = "Bu mail adresi zaten kayıtlı " . $email;
        echo json_encode($response);
    } else {
        // create a new user
        $user = $db->storeUser($name,$number,$province,$district, $email, $password);
        if ($user) {
            // user stored successfully
            $response["error"] = FALSE;
            $response["uid"] = $user["unique_id"];
            $response["user"]["name"] = $user["name"];
            $response["user"]["number"] = $user["number"];
            $response["user"]["province"] = $user["province"];
            $response["user"]["district"] = $user["district"];
            $response["user"]["email"] = $user["email"];
            $response["user"]["created_at"] = $user["created_at"];
            $response["user"]["updated_at"] = $user["updated_at"];
            echo json_encode($response);
        } else {
            // user failed to store
            $response["error"] = TRUE;
            $response["error_msg"] = "Kayıt sırasında bilinmeyen hata!";
            echo json_encode($response);
        }
    }
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Gerekli parametreler (isim, numara, il, ilçe, mail veya şifre) eksik!";
    echo json_encode($response);
}
?>