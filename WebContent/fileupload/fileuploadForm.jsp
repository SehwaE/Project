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
  
  
  <title> Flower Garden - 꽃집 </title>
  
  <link rel="stylesheet" href="css/bootstrap.css">
  
<style type="text/css">
	#uploadFormArea{
		margin: auto;
		width: 700px;
		border: 1px solid grey;
	}
	.td_title{
		font-size: xx-large;
		text-align: center;
	}
</style>
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
		response.sendRedirect("../center/login.jsp");
	}
	
	
	%>

	<hr>
	<br>
	<section id="uploadFormArea">
		<form action="fileuploadPro.jsp" method="post" enctype="multipart/form-data">
		  <table>
			<tr>
				<td colspan="4" class="td_title">&nbsp;&nbsp;&nbsp;포&nbsp;토&nbsp;리&nbsp;뷰</td>
			</tr>
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;작&nbsp;성&nbsp;자</td>
				<td>
				  <input type="text" name="id" value="<%=id %>" class="form-control" readonly>
				</td>
			</tr>
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;목</td>
				<td>
				  <input type="text" name="subject" class="form-control">				
				</td>
			</tr>			
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;&nbsp;비&nbsp;&nbsp;밀&nbsp;&nbsp;번&nbsp;&nbsp;호</td>
				<td>
				  <input type="password" name="pass" class="form-control">				
				</td>
			</tr>			
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;용</td>
				<td>
				
				  <textarea rows="10" cols="100" class="form-control" name="msg"></textarea>
				</td>
			</tr>
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;파&nbsp;일&nbsp;명</td>
				<td>
				  <input type="file" name="filename">
				</td>
			</tr>
			<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
			  	<td>
			  	  <input type="submit" value="파일 업로드" class="btn btn-primary" style="float: right;">
			  	</td>
			</tr>
		  </table>
		</form>
	</section>
	<br>
	<hr>
	<br>
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