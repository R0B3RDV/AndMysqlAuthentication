<?php
require_once 'include/db_functions.php';
$db = new DB_Functions();

//We will upload files to this folder
//So one thing don't forget, also create a folder named uploads inside your project folder i.e. MyApi folder
define('UPLOAD_PATH', 'assets/images/');

// json response array
$response = array("error" => FALSE);

//image control
if(isset($_FILES['pic']['name']) && isset($_POST['email'])){
    $image = $_FILES['pic']['name'];
    $email =$_POST['email'];
    //uploading file and storing it to database as well 
        move_uploaded_file($_FILES['pic']['tmp_name'], UPLOAD_PATH . $image);
        $upload = $db->ImageUpload($image,$email);
        if($upload){
            $response['error'] = FALSE;
            $response['message'] = 'Image uploaded successfully';
        }else{
            echo $upload;
        }
    
}else{
    $response['error'] = TRUE;
    $response['message'] = "Required params not available";
}

//displaying the response in json 
header('Content-Type: application/json');
echo json_encode($response);
?>