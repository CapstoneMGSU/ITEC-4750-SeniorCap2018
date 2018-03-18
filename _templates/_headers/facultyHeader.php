<?php
if(!isset($_SESSION['LoginID'])){include($_SERVER['DOCUMENT_ROOT'].'/_php/session.php');}
include($_SERVER['DOCUMENT_ROOT'].'/_php/config.php');

//redirect to student dashboard
if(isset($_SESSION['Role'])){
	if($Role!= 'Faculty'){
		if($Role='Student'){ header('Location: '.$server.'/_studentPages/studentDashboard.php');}
		else{
			$_SESSION['ErrorBlock'] = "Please Login.";
			header('Location: '.$server.'/login.php');
		}
	}
}
else{ echo "Role not defined.";}
?>

<!DOCTYPE html>
<html lang="en">
<head><!-- Builds basis of site. Sets style1 as the CSS for this page. -->
	<meta charset="utf-8">
	<title>Knightly Knowledge <?php if(isset($title)){echo " - ".$title ;}?></title>
	<?php echo '<link rel="stylesheet" href="'.$server.'/_css/bootstrap.min.css" />';?>
	<?php echo '<link rel="stylesheet" href="'.$server.'/_css/style1.css" />';?>
	<?php echo '<script src="'.$server.'/_js/dashboard.js" type ="text/javascript"></script>';?>
</head>
<body>
	<header>
		<a href="facultyDashboard.php">
			<?php echo '<img class="logo" src="'.$server.'/_images/knight.jpg" alt="Knight" />'; ?>
		</a>
	</header>

	<div id="purpleBar">
		<span class="lead">Knightly Knowledge <?php if(isset($title)){echo " - ".$title;}?></span>
	</div>
<?php ?>
