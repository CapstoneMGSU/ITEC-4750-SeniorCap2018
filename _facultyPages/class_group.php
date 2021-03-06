<?php
// ++++ Change: Adjusted indentation 9/7 KM ++++
/* --
--- -- --- WORK FLAG
--- This page still needs work. -- 9/8 KM
--- Currently displays the students assigned to a group.
--- Mostly to check link from class_page.php (Further Development Soon)
-- */
// ++++ Change: Added Link to Survey Report 11/4 KM ++++
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Groups';
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_headers/facultyHeader.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/facultyNav.php');
include($_SERVER['DOCUMENT_ROOT'].'/_php/config.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/group_assign_do.php');
// ++++ Change: Added Page Identifier 10/10 KM ++++	
$P='class_group';
?>	
<!-- Main Content Section-->
<div class="wrapper">
	<main>
		<?php	
		if(isset($_GET['gid']))
			{
				$GroupID = $_GET['gid'];
			
			if(isset($_GET['gname'])){
				$GroupName = $_GET['gname'];
			}
			else {$GroupName = 'Group '.$GroupID;}
		}
			$gado=new GA_DO(); 
			$rows=$gado->listGroupStuds($GroupID);
			echo '<h1>'.$GroupName.'</h1>';
			echo '<table>';
			echo '<th>Name</th>';
			echo '<th>Email</th>';
			echo '<th>ClassName</th>';
			echo '<th>Survey Report</th>';
				foreach ($rows as $value){
					echo '<tr>';
						// ++++ change: took out id linked student mgmt stub to Name ++++ -->
						echo '<td>' . '<a href="stud_mgmt_pg.php?stid='.$value['LoginID']. '">' .$value['FName'] . " " . $value['LName'] . '</a></td>';
						// ++++ change: added mail to email link ++++ -->
						echo '<td>' . '<a href="mailto:' . $value['Email'].'">' . $value['Email'] . '</a></td>';
						// ++++ change: added group linked to class_group stub ++++ -->
						echo '<td>' . '<a href="class_page.php?cid=' . $value['ClassID'] . '">' . $value['ClassNO']. ' ' . $value['ClassName'].'</a></td>';
						// ++++ Change: added view survey to class_group page 11/4 KM ++++
						echo '<td>' . '<a href="indiv_survey_report.php?stid=' . $value['LoginID'].'&gid='.$GroupID. '">View Survey Report</a></td>';
					echo "</tr>";
				}
			echo '</table>';
		?>
	</main>
</div><!-- End Wrapper -->	
<?php include($_SERVER['DOCUMENT_ROOT'].'/_templates/_footers/facfooter.php');?>
</body>
</html>