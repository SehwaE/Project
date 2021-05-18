<%@page import="com.itwillbs.project.ImgBean"%>
<%@page import="com.itwillbs.project.ImgDAO"%>
<%@page import="com.itwillbs.project.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.project.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
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
<!--   <link href="../css/default.css" rel="stylesheet" type="text/css"> -->
  <link href="../css/subpage.css" rel="stylesheet" type="text/css">
  <title> Flower Garden - 꽃집 </title>
</head>
<body>
	
 <jsp:include page="../inc/top.jsp"/>

  <!-- Page Content -->
  <div class="container">

    <div class="row">
	<br><br><br>
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
              <img class="d-block img-fluid" src="../img/main/105.jpg" alt="First slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/sunset.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/woman.jpg" alt="Third slide" width="900" height="350">
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
	if(id == null){
	response.sendRedirect("login.jsp");
}
	
		// DB정보를 가져와야함.
		// DAO 객체 생성 
		ImgDAO idao = new ImgDAO();
		// DB에 글정보가 있는지 체크 : getBoardCount()
		int cnt = idao.getBoardCount();
		System.out.println("pro : 글 개수 -> "+cnt);
		//////////////////////////////////////////////////////////
		// 페이징 처리 - 게시판 보여질 글의 개수를 페이징 처리
		// 한 페이지에서 보여줄 글의 수
		int pageSize = 10;
		
		// 현 페이지 정보 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){ // 만약 페이지번호가 null일 경우 페이지번호는 1
			pageNum = "1";
		}
		
		// 페이지 출력 첫행 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		//////////////////////////////////////////////////////////
		
		ArrayList boardList = null;
		if(cnt != 0){
			// 정보를 처리해주는 메서드를 생성 : getBoardList()
			//boardList = bdao.getBoardList();
			
			boardList = idao.getBoardList(startRow,pageSize);
			System.out.println("pro : 글목록 저장완료!");
		}
	
	
	%>


<article>
<h1> 상품 후기 게시판 </h1>
<hr>
<table id="notice">
	<tr>
		<th class="tno">No</th>
    	<th class="ttitle">제목</th>
    	<th class="twrite">작성자</th>

    </tr>
    <%if(cnt != 0){
    	for(int i=0;i<boardList.size();i++){
    		ImgBean ib = (ImgBean)boardList.get(i);
    	%>
	<tr>
		<td><%=ib.getNum() %></td>
		<td class="left">
				<!-- re_lev값에 따른 들여쓰기 표현 -->
				<!-- 답글일때만 이미지 사용(re_lev) -->
				<!-- ------------------------- -->
			<a href="reviewContent.jsp?num=<%=ib.getNum()%>&pageNum=<%=pageNum%>">
				<%=ib.getSubject() %></a>
		
		</td>
  		<td colspan="3"><%=ib.getId() %></td>
	</tr>
		<%
		}
    }
	%>
</table>

	<div id="table_search"></div>
	<div class="clear"></div>
	<div id="page_control">
	<%
		if(cnt != 0){
			
			// 전체 페이지수 계산하기
			int pageCount = cnt / pageSize+(cnt%pageSize == 0? 0:1);
	
			// 한 페이지에 보여줄 페이지수(페이지 블럭)
			int pageBlock = 5;
			
			// 한 페이지에서 시작하는 페이지 번호
			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			// 한 페이지에서 끝나는 페이지 번호
			int endPage = startPage+pageBlock-1;
			
			if(endPage > pageCount){
				endPage = pageCount; 
			}
	%>
		<% //이전페이지 활성화
		 if(startPage > pageBlock){
		%>
		<a href="reviewList.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<% 
		 }
		%>
		
		
		<%
			for(int i=startPage;i<=endPage;i++){
		%>
			<a href="reviewList.jsp?pageNum=<%=i%>"><%=i %></a>
		<%
			} 
		%>
		
		<% 
		 if(endPage<pageCount){
		%>
		<a href="reviewList.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<% 
		 }
		%>
		
	<% } %>
	<hr>
	</div>
</article>
	</div>
	</div>
	</div>



  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>