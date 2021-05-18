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
	String name = (String)session.getAttribute("id");
	
	// 전달된 파라미터값 저장 (num, pageNum)
	int num = Integer.parseInt(request.getParameter("num")); //DB까지 가야함
	String pageNum = request.getParameter("pageNum"); //DB까지 가지않음
	
	// DAO 객체 생성
	BoardDAO dbao = new BoardDAO();
	
	// 해당 글의 조회수를 1증가
	dbao.updateReadCount(num); 
	
	// DB에서 해당 번호(num)에 해당하는 글 정보를 조회
	BoardBean bb = dbao.getBoard(num);

	System.out.println("pro : "+bb);
	// 해당정보를 화면에 출력
	
	// 본문의 내용 줄바꿈 표시하기
	// \n -> <br>
	
	String content = bb.getContent();
	
	if(content != null){
		content = content.replace("\r\n", "<br>");
	}
	
	
	
	
%>

<!-- 게시판 -->
<article>
<h1> 게시판 본문보기 </h1>

	  <table id="notice">
		<tr>
			<th class="tno" colspan="5">주문서 확인 게시판</th>
		</tr>
    
		<tr>
			<td>글번호</td>
			<td><%=bb.getNum() %></td>
			<td>조회수</td>
			<td><%=bb.getReadcount() %></td>
   		</tr>
   		
   		<tr>
			<td>작성자</td>
   			<td><%=bb.getName() %></td>
   			<td>작성일</td>
   			<td><%=bb.getDate() %></td>
   			
   		</tr>
   		
   		<tr>
			<td>주문제품</td>
			<td colspan="3"><%=bb.getProduct() %></td>
   		</tr>
   		<% 
   		if(bb.getName().equals(name) || name.equals("admin")){
   		%>
   		<tr>
			<td>배송지</td>
			<td><%=bb.getPostcode() %></td>
			<td><%=bb.getAdd1() %></td>
			<td><%=bb.getAdd2() %></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><%=bb.getAdd3() %></td>
			<td><%=bb.getAdd4() %></td>
   		</tr>
   		 <%} %>
   		
   		<tr>
			<td>제목</td>
			<td colspan="3"><%=bb.getSubject() %></td>
   		</tr>
   		<% 
   		if(bb.getName().equals(name) || name.equals("admin")){
   		%>
   		<tr>
			<td>내용</td>
			<td colspan="3" width="200" height="150"><%=content %></td>
   		</tr>
   		<%} %>
	</table>
	<div id="table_search">
   		<% 
   		if(bb.getName().equals(name) || name.equals("admin")){
   		%>
		<input type="button" value="수정하기" class="btn btn-primary"
			onclick="location.href='updateForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>';">
		<input type="button" value="삭제하기" class="btn btn-primary"
			onclick="location.href='deleteForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'">
		<%
		}
   		%>
		<input type="button" value="답글쓰기" class="btn btn-primary"
			onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq() %>';">
		<input type="button" value="목록으로" class="btn btn-primary"
			onclick="location.href='boardList.jsp?pageNum=<%=pageNum %>';">
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