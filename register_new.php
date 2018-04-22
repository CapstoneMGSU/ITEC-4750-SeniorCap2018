<?php
// ++++ Change: Added Title 10/25 KM ++++
$title = 'Student Settings';
 include($_SERVER['DOCUMENT_ROOT'].'/_php/config.php');
 include($_SERVER['DOCUMENT_ROOT'].'/_templates/mainHeader.php');
 require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/stu_do.php');
 require($_SERVER['DOCUMENT_ROOT'].'/_php/_objects/profile_do2.php');
 require($_SERVER['DOCUMENT_ROOT'].'/_php/_models/profile_model.php');
 $P='studentSettings';
  // ++++ Change: Check for login on student Settings 11/18 KM Page ++++

	 ?>

			<div class="row">
			<div class="col-md-5">
				<!-- ++++ Change: Created Reusable Module to add profiles 9/30 KM ++++ -->
				<form name ="create-profile" id="loginForm" method = "POST" class="form-horizontal">
				<fieldset><legend><b>Register</b></legend>
					<div class="form-group">
						<label class="control-label col-sm-4" for="FName">First Name:</label>
						<div class="col-sm-7">
						<input type="text" name="FName" id="FName" class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="LName">Last Name:</label>
						<div class="col-sm-7">
						<input type="text" name="LName" id="LName" class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="Email">Email:</label>
						<div class="col-sm-7">
						<input type="text" name="Email" id="Email" class="form-control" required>
						</div>
					</div>
					<?php
					
					?>
						<div class="form-group">
							<label class="control-label col-sm-4" for="Password">Password:</label>
							<div class="col-sm-7">
							<input type="text" name="Password" id="Password" class="form-control" required>
							</div>
						</div>
					
					<div class="form-group">
						<label class="control-label col-sm-4" for="Role">Role:</label>
						<div class="col-sm-7">
						<select  name="Role" id="Role" class="form-control" required>
							<option value="none" selected>Select Role</option>
							<option value="Faculty">Faculty</option>
							<option value="Student">Student</option>
						</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-9">
							<input type="submit" value="Add Profile" name="AddProfile" id="AddProfile" class="btn btn-primary btn-lg submit">
							<a href="login.php" class="btn btn-primary btn-lg submit" type="submit">Back</a> 
						</div>
					</div>
				</fieldset>
				</form>
			 <?php
				//Add Profile
				//profile_do echos a profile message div class="receipt"
				$aProfile = new Profile_DO();
				if(isset($_POST['AddProfile'])){
					// ++++ Change: Added Variables for getting student_info for new profile 10/5 KM ++++
					$Email = $_POST['Email'];
					$FName = $_POST['FName'];
					$LName = $_POST['LName'];
					$Password = $_POST['Password'];
					$Role =$_POST['Role'];
					$Subj = "";
					$LoginID="";

					$aProfile = new Profile(array(
					'LoginID' => $LoginID,
					'Role' => $Role,
					'Password'=> $Password,
					'Subj' => $Subj, //Passes 0 because not used but model requires
					'Email' => $Email,
					'FName' => $FName,
					'LName' => $LName
					));

					//Get LoginID of new profile as $newID
					$rows = $aProfile->addProfile();
					$i=0;
					foreach($rows as $value){
						if($i>=1){break;}//return only first value
						$newID=$value['LoginID'];
						echo '<div class="receipt"><br/>New ID: <strong><a href="stud_mgmt_pg.php?stid=' . $newID . '">';
						echo 	$newID . '</a></strong></div>';
						$i++;
					}
				}



				?>
			</div>
		</div>
	</div>
</main>


	<?php
 
 // ++++ Change: Included Footer 11/14 KM ++++
 include($_SERVER['DOCUMENT_ROOT'].'/_templates/_footers/footer.php');?>

</body>
</html>
