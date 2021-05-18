<%@page import="com.itwillbs.project.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Flower Garden - 꽃집 </title>
</head>
<body>


	<%
	// 이전페이지에서 전달된 정보를 받아서 수정

	// 한글 데이터 처리
	request.setCharacterEncoding("UTF-8");
	
	// pageNum 정보 저장
	String pageNum = request.getParameter("pageNum");
	
	// 글번호(hidden), 글쓴이, 비밀번호, 제목, 내용 저장 (액션태그)
	%>
	
	<jsp:useBean id="bb" class="com.itwillbs.project.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	
	System.out.println("pro : 수정할 정보 -> "+bb);
	
	// DAO 객체 생성 -> 정보수정 메서드 updateBoard();
	BoardDAO bdao = new BoardDAO();
	int check = bdao.updateBoard(bb);
	
	System.out.println("pro : 수정정보 check -> "+check);
	// 결과에 따라서 페이지 이동
	if(check == 1){ // 수정 성공
		%>
		<script type="text/javascript">
			alert("주문서가 성공적으로 수정되었습니다");
			location.href="boardList.jsp?pageNum=<%=pageNum %>";	
		</script>
		<%
	}else if(check == 0){ // 수정 실패 - 비밀번호 오류
		%>
		<script type="text/javascript">
			alert("글 비밀번호를 확인하세요");
			history.back();	
		</script>
		<%
	}else{ // check == -1, 수정실패 - 게시글 없음.
		%>
		<script type="text/javascript">
			alert("글 비밀번호를 확인하세요");
			history.back();	
		</script>
		<%
	}
	
	%>




</body>
</html>