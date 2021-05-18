<%@page import="com.itwillbs.project.ImgBean"%>
<%@page import="com.itwillbs.project.ImgDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
  
  
  <style type="text/css">
	#uploadFormArea{
		margin: auto;
		width: 500px;
		border: 1px solid grey;
	}
	.td_title{
		font-size: xx-large;
		text-align: center;
	}
</style>

  <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

 <jsp:include page="../inc/top.jsp"/>
	  <!-- Page Content -->
  <div class="container">

    <div class="row">

	<jsp:include page="../inc/left.jsp"/>
	
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
	// 파일 업로드 -> 정보 저장
	
	// 1. 파일업로드
	
	// 업로드 할 폴더 생성(WebContent/upload 생성)
	// /Users/eomsehwa/eclipse-workspace/.metadata/.plugins
	// /org.eclipse.wst.server.core/tmp0/wtpwebapps/FunWebJSP
	// 업로드 폴더로 지정
	
	String uploadPath = request.getRealPath("/upload");
	
	System.out.println("업로드 경로 : "+uploadPath);
	
	// 업로드 파일크기 지정
	int fileSize = 10 * 1024 * 1024; // 10MB (1024(1MB) * 1024 (1KB))
	
	// 파일업로드 -> 파일업로드 객체 생성 // 기본생성자가 없는 객체이기 때문에 생성자 정의 필요
	MultipartRequest multi = new MultipartRequest(
			request,
			uploadPath,
			fileSize,
			"UTF-8",
			new DefaultFileRenamePolicy()
			);
	
	System.out.println(" 파일 업로드 완료! ");
	
	// 이전 페이지에서 전달해준 정보를 출력
	// (사용자,메세지,파일)
	
		ImgBean ib = new ImgBean();
	
	//String name = request.getParameter("name");(X)
	      String id = multi.getParameter("id");
	      String pass = multi.getParameter("pass");
   		  String subject = multi.getParameter("subject");
    	  String msg = multi.getParameter("msg");
          String filename = multi.getFilesystemName("filename");
//           int num = Integer.parseInt(multi.getParameter("num"));
         
         ib.setId(id);
         ib.setPass(pass);
         ib.setSubject(subject);
         ib.setMsg(msg);
         ib.setFilename(filename);
	
//          ib.setNum(Integer.parseInt(multi.getParameter("num")));
		  
		 System.out.println("전달한정보 : "+ib.toString());

         ImgDAO idao = new ImgDAO();
         idao.insertBoard(ib);
	
	%>	
<!-- 		<tr><td height="1" colspan="3" style="border-bottom:1px solid #DBDBDB;"></td></tr> -->
<!-- 			<tr> -->
<%-- 			<td> 파일명 : <%=oFileName %> </td> --%>
<!-- 			</tr> -->

	
		<section id="uploadFormArea">
			<table>
			<tr>
			<td colspan="5" class="td_title">&nbsp;&nbsp;&nbsp;포&nbsp;토&nbsp;리&nbsp;뷰</td>
			</tr>
			<tr><td height="1" colspan="5" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
			<td> 작성자</td>
			<td colspan="5">  <%=id %> </td>
			</tr>
			<tr><td height="1" colspan="5" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
			<td> 제목 </td>
			<td colspan="5">  <%=subject %> </td>
			</tr>
			<tr><td height="1" colspan="5" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
			<td> 내용 </td>
			<td colspan="5"> <%=msg %>  </td>
			</tr>
			<tr><td height="1" colspan="5" style="border-bottom:1px solid #DBDBDB;"></td></tr>
			<tr>
			<td> 파일명 </td>
			<td colspan="5"> <%=filename %> </td>
			</tr>
			</table>

	<!-- 업로드 한 파일 정보 확인 <input type="text" or "hidden"> -->
	<form action="fileCheck.jsp" method="post">
		<input type="hidden" name="id" value=<%=id%>>
		<input type="hidden" name="pass" value=<%=pass%>>
		<input type="hidden" name="subject" value=<%=subject%>>
		<input type="hidden" name="msg" value=<%=msg%>>
		<input type="hidden" name="filename" value=<%=filename%>>
		<input type="submit" value="다운받기" class="btn btn-primary"  style="float: right;">
	</form>
	</section>
	
	 <%=filename %>
	<% 
		response.sendRedirect("../center/reviewList.jsp");
	%>
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