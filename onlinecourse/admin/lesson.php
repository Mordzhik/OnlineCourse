
 <?php 
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['alogin'])==0)
  { 
header('location:index.php');
}
else{

// For adding post  
if(isset($_POST['submit']))
{
$posttitle=$_POST['posttitle'];
$arr = explode(" ",$posttitle);
$url=implode("-",$arr);
$pfile=$_FILES["postfile"]["name"];
// get the image extension
$extension = substr($pfile,strlen($pfile)-4,strlen($pfile));
// allowed extensions
$allowed_extensions = array(".jpg",".jpeg",".png",".gif",".odt",".pdf","docx","doc",".mp4");
// Validation for allowed extensions .in_array() function searches an array for a specific value.
if(!in_array($extension,$allowed_extensions))
{
echo "<script>alert('Invalid format. Only mp4  format allowed');</script>";
}
else
{
//rename the image file
$pnewfile=md5($pfile).$extension;
// Code for move image into directory
move_uploaded_file($_FILES["postfile"]["tmp_name"],"postimages/".$pnewfile);


$ret=mysqli_query($con,"insert into video(PostTitle,PostUrl,PostFile) values('$posttitle','$url','$pnewfile')");
if($ret)
{
$_SESSION['msg']="Course Created Successfully !!";
}
else
{
  $_SESSION['msg']="Error : Course not created";
}
}
}
if(isset($_GET['del']))
      {
              mysqli_query($con,"delete from video where id = '".$_GET['id']."'");
                  $_SESSION['delmsg']="Course deleted !!";
      }

?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin | Добавить урок</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Уроки  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           Уроки
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>

  



                        <div class="panel-body">
                       
   <div class="form-group">
    <label for="coursecode">Название  урока  </label>
	
	<form action="#file"   method="post" enctype="multipart/form-data">
 <div class="form-group m-b-20">
<label for="exampleInputEmail1"></label>
<input type="text" class="form-control" id="posttitle" name="posttitle" placeholder="Enter title" required>
</div>



<div class="row">
<div class="col-sm-12">
 <div class="card-box">
<h4 class="m-b-30 m-t-0 header-title"><b>Загрузите файл урока</b></h4>
<input type="file" class="form-control" id="postfile" name="postfile"  required>
</div>
</div>
</div>


<BR>
<button type="submit" name="submit" class="btn btn-success waves-effect waves-light" value="Upload">Добавить </button>

                                        </form>
  
	
  </div>




                            </div>
                            </div>
                    </div>
                  
                </div>
                <font color="red" align="center"><?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?></font>
                <div class="col-md-12">
                    <!--    Bordered Table  -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Управлять уроком 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Видео урок</th>
                                            <th>Название урока</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
<?php
$sql=mysqli_query($con,"select * from video");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{
?>


                                        <tr>
                                            
                                            <td><?php echo htmlentities($row['id']);?></td>
                                            <td><?php echo htmlentities($row['PostFile']);?></td>
                                            <td><?php echo htmlentities($row['PostTitle']);?></td>
                                            
                                            <td>
                                                                               
  <a href="lesson.php?id=<?php echo $row['id']?>&del=delete" onClick="return confirm('Are you sure you want to delete?')">
                                            <button class="btn btn-danger">Удалить</button>
</a>
                                            </td>
                                        </tr>
<?php 
$cnt++;
} ?>

                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                     <!--  End  Bordered Table  -->
                </div>
            </div>





        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
<?php } ?>
