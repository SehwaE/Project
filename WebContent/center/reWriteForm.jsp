<%@page import="com.itwillbs.project.member.MemberBean"%>
<%@page import="com.itwillbs.project.member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.project.BoardBean"%>
<%@page import="com.itwillbs.project.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
  
  <title>Flower Garden - 꽃집 </title>
  
  <link rel="stylesheet" href="css/bootstrap.css">
  
</head>
<body>

	 <jsp:include page="../inc/top.jsp"/>
	
  <!-- Page Content -->
  <div class="container">

    <div class="row">

	<jsp:include page="../inc/left.jsp"/>

      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="../img/main/16.jpg" alt="First slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/22.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/2.jpg" alt="Third slide" width="900" height="350">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
	</div>
	</div>

	<%
	
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
	}
	
	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(id);
	

	// 전달된 정보 저장하기
	// pageNum
	String pageNum = request.getParameter("pageNum");
	// num, re_ref, re_lev, re_seq
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	
%>	
	
	
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>답글 작성</h3>
		<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
		 <input type="hidden" name="num" value="<%=num %>">
		 <input type="hidden" name="re_ref" value="<%=re_ref %>">
		 <input type="hidden" name="re_lev" value="<%=re_lev %>">
		 <input type="hidden" name="re_seq" value="<%=re_seq %>">
          <div class="control-group form-group">
            <div class="controls">
              <label> 아이디 </label>
              <input type="text" class="form-control" name="name" required data-validation-required-message="Please enter your name."
              value="<%=id %>">
              <p class="help-block"></p>
            </div>
          </div>
           <div class="control-group form-group">
            <div class="controls">
              <label> 비밀번호 </label>
              <input type="password" class="form-control" name="pass" required data-validation-required-message="Please enter your password.">
              <p class="help-block"></p>
            </div>
            </div>
          <div class="control-group form-group">
            <div class="controls">
              <label> 글제목 </label>
              <input type="text" class="form-control" name="subject" value="[Re]" required data-validation-required-message="Please enter the subject.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label> 작성글 </label>
              <textarea rows="10" cols="100" class="form-control" name="content" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none">

</textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton"  style="float: right;">작성하기</button>
        </form>
      </div>
    </div>
    <!-- /.row -->

	</div>
  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>


  <!-- Bootstrap core JavaScript -->
   <script src="../vendor/jquery/jquery.min.js"></script> 
   <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vender/bootstrap/js/bootstrap.js"></script>

</body>
</html>