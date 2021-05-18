<%@page import="com.itwillbs.project.member.MemberBean"%>
<%@page import="com.itwillbs.project.member.MemberDAO"%>
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
  <link href="../css/shop-homepage.css" rel="stylesheet">

  <link href="../css/modern-business.css" rel="stylesheet">
  
</head>
<body>

 <jsp:include page="../inc/top.jsp"/>
	
	
	<script type="text/javascript">
		function fun1(){
			if(documnet.fr.pw.value == "" || document.fr.pw.value.length < 0){
				alert("비밀번호를 확인하세요.");
				history.back();
				document.fr.pw.focus();
				return false;
			}
		}
	
	</script>
      	
    <!-- Page Content -->
  <div class="container">

    <div class="row">

	<jsp:include page="../inc/left2.jsp"/>

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
      	
      	request.setCharacterEncoding("UTF-8");
        
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("login.jsp");
		}else{
		
		
		
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
   		
		
        %>
               
   <!-- Information Form -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h2> My Page </h2>
        <form action="infoPro.jsp" method="post" name="fr" onsubmit="return fun1();">
          <div class="control-group form-group">
            <div class="controls">
              <label> 아이디 </label>
              <input type="text" class="form-control" name="id" value="<%=id %>" readonly>
              <p class="help-block"></p>
            </div>
          </div>
           <div class="control-group form-group">
            <div class="controls">
              <label> 비밀번호 </label>
              <input type="password" class="form-control" name="pw" required data-validation-required-message="Please enter your password.">
              <p class="help-block"></p>
            </div>
            </div>
          <div class="control-group form-group">
            <div class="controls">
              <label> 이름 </label>
              <input type="text" class="form-control" name="name" value="<%=mb.getName() %>">
            </div>
          </div>
           <div class="control-group form-group">
            <div class="controls">
              <label> 이메일 </label>
              <input type="email" class="form-control" name="email" value="<%=mb.getEmail()%>">
              <p class="help-block"></p>
            </div>
            </div>
            <div class="control-group form-group">
            <div class="controls">
              <label> 전화번호 </label>
              <input type="text" class="form-control" name="phone" value="<%=mb.getPhone() %>">
              <p class="help-block"></p>
            </div>
            </div>

          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">회원정보 수정</button>
        </form>
      </div>
    </div>
      
      <%} %>
      

      
      
      </div>

      
      
      
      

 
  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>
  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>