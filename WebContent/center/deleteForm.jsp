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

	// 파라미터값 num, pageNum	저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB 이동 후 num에 해당하는 정보를 가져오기
	// -> 화면에 출력(글쓴이, 제목, 내용)
	BoardDAO bdao = new BoardDAO();
	BoardBean bb = bdao.getBoard(num);

%>
	
	
	
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
 <article>
<h1>주문서 삭제하기</h1>
	<!-- form 태그 시작 -->
	<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
		<input type="hidden" name="num" value="<%=num %>">
	  
	  <table id="notice">
		<tr>
			<th class="tno" colspan="5">글 삭제하기</th>
		</tr>
   	
   		<tr>
			<td height="50">비밀번호</td>
   			<td height="50">
   				<input type="password" class="form-control" name="pass">
   			</td>
   		</tr>
	</table>
	<div id="table_search">
		<input type="submit" value="삭제하기" class="btn btn-primary">
	</div>
	
	</form>
	<!-- form 태그 끝 -->
	<div class="clear"></div>
	<div id="page_control">
	</div>

</article>
</div>
  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>


  <!-- Bootstrap core JavaScript -->
   <script src="../vendor/jquery/jquery.min.js"></script> 
   <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vender/bootstrap/js/bootstrap.js"></script>

</body>
</html>