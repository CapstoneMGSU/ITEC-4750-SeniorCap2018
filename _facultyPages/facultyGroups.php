<?php
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Faculty Groups';
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_headers/facultyHeader.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/facultyNav.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/class_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/stu_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/group_assign_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_models/group_assign_model.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/drop_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/class_assign_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/report_do.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_models/class_assign_model.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/getIDs.php');
// ++++ Change: Added Page Identifier 10/10 KM ++++
$P='facultyGroups';
?>



<div class="wrapper">
<main>	
	<div class="container-fluid" style="padding: 20px 0px 15px 0px;">
				<div>
					<h2>Groups</h2>
					<div>
						<?php	
							
							//calls class data object and loads table data by LoginID
							if(!isset($LoginID) || empty($LoginID)){ echo '<div class="error">ID Not Found</div>'; }
							if(!empty($LoginID)){
								$classdo = new Class_DO();
								$rows=$classdo->loadByLoginID($LoginID);
								// ++++ Change: Added if statement to hide table if empty 9/24 KM ++++
								if(empty($rows)){echo '<div> No currently enrolled in classes.</div>';}
								if(!empty($rows)){
									?>		
									<div class="row">
									<div class="col-md-10 col-centered table-responsive">
										<table class="table-responsive">
										<thead>
										<tr>
											<th class="col-sm-2">Class ID</th>
											<th class="col-sm-2">Class Number</th>
											<th class="col-sm-3">Class Name</th>
											<th class="col-sm-2">Group</th>
											<th class="col-sm-1">Semester</th>
											<th class="col-sm-3">Class Expire Date</th>
											<th class="col-sm-1"></th>
										</tr>
										</thead>

										<?php

										//builds table with class data	
										foreach ($rows as $value){
											echo '<tr>';
												echo '<td class="col-sm-2"><a href="class_page.php?cid='.$value['ClassID'].'">';
												echo 	$value['ClassID'].'</a></td>'; // links back to class_page.php
												echo '<td class="col-sm-2">'.$value['ClassNO'].'</td>';
												echo '<td class="col-sm-3"><a href="class_page.php?cid='.$value['ClassID'].'">'.$value['ClassName'].'</td>';
												echo '<td class="col-sm-2">'.$value['GroupName'].'</td>';
												echo '<td class="col-sm-1">'.$value['SemesterName'].' '.$value['Year'].'</td>';
												echo '<td class="col-sm-2">'.$value['ExpDate'].'</td>';
												echo '<td class="col-sm-1">';
												echo 	'<img class ="small_icon" src="../_images/person_delete.png" alt="Delete">';
												echo 	'</a></td>'; // delete class assignment
											echo '</tr>';	
										}
										?>
									</table>
								<?php }
								}?>
					</div>
					<br/>
					<div class="clear"></div>
				</div>
			</div>
	</div>
</div>
	</main>
	</div>
		<br>
<?php include($_SERVER['DOCUMENT_ROOT'].'/_templates/_footers/footer.php');?>
	</body>
</html>
