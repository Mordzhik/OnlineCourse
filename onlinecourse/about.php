
<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
    {   
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );
if(isset($_POST['submit']))
{
$sql=mysqli_query($con,"SELECT * FROM  students where pincode='".trim($_POST['pincode'])."' && StudentRegno='".$_SESSION['login']."'");
$num=mysqli_fetch_array($sql);
if($num>0)
{
$_SESSION['pcode']=$_POST['pincode'];
header("location:enroll.php");
}
else
{
$_SESSION['msg']="Error :Wrong Pincode. Please Enter a Valid Pincode !!";
}
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>О нас</title>
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
                        <h1 class="page-head-line">AVEN SYSTEMS </h1>
                    </div>
                </div>
           <H1> Собственное производство вентиляционных решеток типа </h1> РАГ РАР РВ РВр <BR> Продажа и монтаж вентиляционного оборудования <BR> Приточные камеры центральные каркасно-панельные<BR> ПКЦКП<BR> Вентиляторы общеобменные ВЦ 4-75/ ВЦ 14-46/ ВО 12-303/ ВО 25-188/ ВКР/ KV<BR> Вентиляторы дымоудаления ВКРН ДУ/ ВО 21-210ДУ/ ВР 80-70ДУ/ ВР 280-46ДУ <BR>Вентиляторы канальные - прямоугольные КЕ (КТ) / круглые К Клапаны противопожарные ОГ и ДУ<BR> Решетки ветиляционные РАГ / РАР / ДАР <BR>Диффузоры потолочные SAD / RAD<BR> Унифицированные воздухозаборные клапаны<BR> УВК Воздушные заслонки КВК Клапаны воздушные (утепленные) КВУ Клапаны обратные КО / КОп / АЗЕ Шумоглушители трубчатые / пластинчатые Пожарные шкафы
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
