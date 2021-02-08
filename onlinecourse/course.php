<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
    {   
header('location:index.php');
}
else{



?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>История регистрации</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['login']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Уроки </h1>
                    </div>
                </div>
                <div class="row" >
           
                
                    
                <div class="col-md-12">
                    <!--    Bordered Table  -->
                    <div class="panel panel-default">
					 <div class="form-group">
					<?php 
$user = "root"; 
$password = ""; 
$host = "localhost"; 
$dbase = "onlinecourse"; 
$table = "video"; 
 
// Connection to DBase 
mysql_connect($host,$user,$password); 
@mysql_select_db($dbase) or die("Unable to select database");

$result= mysql_query( "select video.id as pid,video.PostTitle as posttitle,video.PostFile as postfile,video.PostUrl as url from video " ) 
or die("SELECT Error: ".mysql_error()); 


print "<table border=1>\n"; 
while ($row = mysql_fetch_array($result)){ 
$videos_field= $row['postfile'];
$video_show= "admin/postimages/$videos_field";
$descriptionvalue=$row['posttitle'];

print "<tr>\n"; 
print "\t<td>\n"; 
echo "<font face=arial size=4/>$descriptionvalue</font>";
print "</td>\n";
print "\t<td>\n"; 
echo "<div align=center><video width='360' controls><source src='$video_show' >Your browser does
not support the video tag.</video></div>";
print "</td>\n";
print "</tr>\n"; 
} 
print "</table>\n";  

?> 
                     
                    </div>
                     <!--  End  Bordered Table  -->
                </div>
            

	
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
