<?php
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Faculty Reports';
include($_SERVER['DOCUMENT_ROOT'].'/_php/config.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_headers/facultyHeader.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/facultyNav.php');
// ++++ Change: Added Page Identifier 10/10 KM ++++
$P='reports';
//require'_php/config.php';
$sql = mysqli_query($con, "SELECT FName FROM login WHERE Role = 'Student' ORDER BY FName ASC");
?>

		<div class="container>
			<div class="wrapper">
				<h1>Reports Example</h1>				
			</div>
			<div class="data">
				<select class="form-dropdown" style="width:150px" id="student" name="student">
					<option>Select a 
					<?php
					$menu=" ";
					while ($row = mysqli_fetch_array($sql)){ 
					$menu.="<option>".$row[FName]."</option>";
					}
					echo $menu;
					?>
				</select>
		</div>