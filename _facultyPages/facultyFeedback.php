<?php
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Faculty Feed Back';
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_headers/facultyHeader.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/facultyNav.php');
// ++++ Change: Added Page Identifier 10/10 KM ++++
$P='facultyCourses';
?>

<html>
<body>
<div class="wrapperFeedback">
<main>	
	<div class="feedback_table">
				<div class="col-md-7 col-centered formatContainer">
					<br>
					<h4 class="center"><b>Survey Feedback</b></h4>
						<table class="feeback_table">
							<tr><th>Survey</th><th>Question</th><th>Total Replies</th></tr>
							<tr>
								<td><select>
										<option></option>
									</select>
								</td>
								<td><select>
										<option></option>
									</select>
								</td>
								<td>"replies info here"</td>
							</tr>
						</table>
					<br>
				</div>
	</div>
</div>
		<br>
</main>
<?php include($_SERVER['DOCUMENT_ROOT'].'/_templates/_footers/footer.php');?>
	</body>
</html>
