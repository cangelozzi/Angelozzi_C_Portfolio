<?php

error_reporting(-1);
ini_set('display_errors', 'On');
set_error_handler("var_dump");
// Message Vars
$msg = '';
$msgClass = '';

// Input Form fields
$fields = array(
  'name' => array(
    'type' => 'text',
    'label' => 'Name',
    'id' => 'inputName'
  ),
  'email' => array(
    'type' => 'email',
    'label' => 'Email',
    'id' => 'inputEmail'
  ),
  'message' => array(
    'type' => 'textarea',
    'label' => 'Message',
    'id' => 'inputMsg'
  )
);

// Check For Submit
if (filter_has_var(INPUT_POST, 'submit')) {
	// Get Form Data
  $name = htmlspecialchars($_POST['name']);
  $email = htmlspecialchars($_POST['email']);
  $message = htmlspecialchars($_POST['message']);

	// Check Required Fields
  if (!empty($email) && !empty($name) && !empty($message)) {
		// Passed
		// Check Email
    if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
			// Failed
      $msg = 'Please use a valid email';
      $msgClass = 'alert-danger';
    } else {
			// Passed
      $toEmail = 'camillo@camilloangelozzi.com';
      $subject = 'Contact Request From ' . $name;
      $body = '<h2>Contact Request</h2>
					<h4>Name</h4><p>' . $name . '</p>
					<h4>Email</h4><p>' . $email . '</p>
					<h4>Message</h4><p>' . $message . '</p>
				';
			// Email Headers
      $headers = "MIME-Version: 1.0" . "\n";
      $headers .= "Content-type:text/html;charset=iso-8859-1" . "\n";

			// Additional Headers
      $headers .= "From: " . $name . "<" . $email . ">" . "\n";

      if (mail($toEmail, $subject, $body, $headers)) {
				// Email Sent
        $msg = 'Your email has been sent! Press < icon to go back to my Portfolio, I will get back to you really fast.';
        $msgClass = 'alert-success';
      } else {
				// Failed
        $msg = 'Your email was not sent';
        $msgClass = 'alert-danger';
      }
    }
  } else {
		// Failed
    $msg = 'Please fill in all fields';
    $msgClass = 'alert-danger';
  }
}

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Contact Us</title>
      <link
      rel="shortcut icon"
      type="image/png"
      href="../images/favicon/favicon_black.png"
    />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/cosmo/bootstrap.min.css">
  <link rel="stylesheet" href="../css/main.css">
</head>
<body>

  <div class="formHeader">
    <!-- FOR LOCAL DEV -->
    <a href="/Angelozzi_C_Portfolio/"><img id="formLogo" src="../images/logo/logo.svg" alt="Camillo Main Logo"></a>
    <a id="backToHome" href="/Angelozzi_C_Portfolio/"><</a>

    <!-- WHEN IN HOST SERVICE -->
    <!-- <a href="/"><img id="formLogo" src="../images/logo/logo.svg" alt="Camillo Main Logo"></a>
    <a id="backToHome" href="/"><</a> -->
  </div>

    <div class="container">
    	<?php if ($msg != '') : ?>
    		<div class="alert <?php echo $msgClass; ?>"><?php echo $msg; ?></div>
    	<?php endif; ?>
      <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">

	      <div class="form-group">

          <?php foreach ($fields as $field_name => $field_config) : ?> 
            <label for="<?php echo $field_name; ?>"><?php echo $field_config['label']; ?></label>
            <input class="form-control" type="<?php echo $field_config['type']; ?>" id="<?php echo $field_config['id']; ?>" name="<?php echo $field_name; ?>" >
          <?php endforeach; ?>

        </div> 
        
	      <br>
	      <button type="submit" name="submit" class="btn btn-primary">Send</button>
      </form>
    </div>
</body>
</html>