<?php
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Faculty Feed Back';
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_headers/facultyHeader.php');
include($_SERVER['DOCUMENT_ROOT'].'/_templates/_nav/facultyNav.php');
require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/drop_do.php');
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
										<option value="0" selected>Select Survey</option>
					
									</select>
								</td>
								<td><select>
										<option value="0" selected>Select Question</option>
									<?php 
						$dropdo = new DROP_DO();
						$rows=$dropdo->surveyQuestions();	// Populate selection from general survey data
						foreach($rows AS $q){
							echo ' <option value="'.$q['QuestionID'].'">'.$q['QuestionTxt'].'</option>';
						}
					?>
									
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
