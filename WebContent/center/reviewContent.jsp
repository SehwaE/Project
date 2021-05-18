<%@page import="com.itwillbs.project.ImgBean"%>
<%@page import="com.itwillbs.project.ImgDAO"%>
<%@page import="com.itwillbs.project.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.project.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <link href="../css/default.css" rel="stylesheet" type="text/css">
  <link href="../css/subpage.css" rel="stylesheet" type="text/css">
  <title> Flower Garden - 꽃집 </title>
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
              <img class="d-block img-fluid" src="../img/main/72.jpg" alt="First slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/73.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/74.jpg" alt="Third slide" width="900" height="350">
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

<%	
	String id = (String)session.getAttribute("id");	

	// 전달된 파라미터값 저장 (num, pageNum)
	int num = Integer.parseInt(request.getParameter("num")); //DB까지 가야함
	String pageNum = request.getParameter("pageNum"); //DB까지 가지않음
	
	// DAO 객체 생성
	ImgDAO idao = new ImgDAO();
	
	// DB에서 해당 번호(num)에 해당하는 글 정보를 조회
	ImgBean ib = idao.getBoard(num);

	System.out.println("pro : "+ib);
	// 해당정보를 화면에 출력
	
	// 본문의 내용 줄바꿈 표시하기
	// \n -> <br>
	
	String msg = ib.getMsg();
	
	if(msg != null){
		msg = msg.replace("\r\n", "<br>");
	}
	
	
	
	
%>

<!-- 게시판 -->
<article>
<h1> 상품 후기 게시판 </h1>

	  <table id="notice">
		<tr>
			<th class="tno" colspan="5">상품후기</th>
		</tr>
    
		<tr>
			<td colspan="2">글번호</td>
			<td><%=ib.getNum() %></td>
   		</tr>
   		
   		<tr>
			<td colspan="2">작성자</td>
   			<td><%=ib.getId() %></td>		
   		</tr>
   		<tr>
			<td>제목</td>
			<td colspan="3"><%=ib.getSubject() %></td>
   		</tr>
   		
   		<tr>
			<td>내용</td>
			<td colspan="3" width="200" height="150"><%=msg %></td>
   		</tr>
   		<tr>
			<td>첨부파일</td>
			<td colspan="3"><a href="../fileupload/filedown.jsp?filename=<%=ib.getFilename() %>"><%=ib.getFilename() %></a> </td>
   		</tr>
	</table>
	<div id="table_search">
	<%
		if(ib.getId().equals(id) || id.equals("admin")){
	%>
		<input type="button" value="삭제하기" class="btn btn-primary"
			onclick="location.href='deleteReview.jsp?num=<%=ib.getNum() %>&pageNum=<%=pageNum %>'">
	<%
		}
	%>
		<input type="button" value="목록으로" class="btn btn-primary"
			onclick="location.href='reviewList.jsp?pageNum=<%=pageNum %>';">
	</div>
	

	<div class="clear"></div>
	<div id="page_control">
	</div>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->

    </div>
    </div>
	<jsp:include page="../inc/bottom.jsp"/>

  <!-- Bootstrap core JavaScript -->
   <script src="../vendor/jquery/jquery.min.js"></script> 
   <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vender/bootstrap/js/bootstrap.js"></script>

</body>
</html>