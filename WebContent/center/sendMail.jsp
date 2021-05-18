<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title> Flower Garden - 꽃집 </title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/modern-business.css" rel="stylesheet">

	
	<script type="text/javascript">
		function send_mail(){
   	 window.open("../test/test_mail.jsp", "", "width=1, height=1, resizable=no, scrollbars=no, status=no");
	}
	</script>


</head>
<body>

<jsp:include page="../inc/top.jsp"/>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Contact</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="main.jsp">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>
    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>Contact</h3>
        <form name="sentMessage" id="contactForm" novalidate>
<!--            <div class="control-group form-group"> -->
<!--              <div class="controls"> -->
<!--                <label> 이름 </label> -->
<!--               <input type="text" class="form-control" id="name" required data-validation-required-message="Please enter your name."> -->
<!--              </div> -->
<!--            </div>  -->
<!--            <div class="control-group form-group"> -->
<!--              <div class="controls"> -->
<!--                <label> 전화번호 </label> -->
<!--                <input type="tel" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number."> -->
<!--              </div>  -->
<!--           </div> -->
          <div class="control-group form-group">
            <div class="controls">
              <label> 이메일 </label>
              <input type="email" class="form-control" id="email" name="email" required data-validation-required-message="Please enter your email address.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label> 내용 </label>
              <textarea rows="10" cols="100" class="form-control" id="text" name="text" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton" onclick="send_mail();" style="float: right;">Send Message</button>
        </form>
      </div>

  </div>
  <!-- /.container -->
</div>
  <!-- Footer -->
  <jsp:include page="../inc/bottom.jsp"/>
</div>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="../vendor/bootstrap/js/jqBootstrapValidation.js"></script>

</body>
</html>