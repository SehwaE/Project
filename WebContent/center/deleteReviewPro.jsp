<%@page import="com.itwillbs.project.ImgDAO"%>
<%@page import="com.itwillbs.project.ImgBean"%>
<%@page import="com.itwillbs.project.BoardDAO"%>
<%@page import="com.itwillbs.project.BoardBean"%>
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
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달된 정보 저장(pageNum, num, pass)
	// => BoardBean 객체에 저장
	//(pageNum은 BoardBean에 저장되어있지 않기때문에 따로 저장)
	String pageNum = request.getParameter("pageNum");
	
	ImgBean ib = new ImgBean();
	ib.setNum(Integer.parseInt(request.getParameter("num")));
// 	String pass = request.getParameter("pass");
// 	bb.setPass(pass);
	// 두 줄의 코드를 한번에 작성가능
	ib.setPass(request.getParameter("pass"));

	// 내정보확인
	System.out.println("pro(삭제할 번호, 비밀번호) : "+ib.toString());
	
	// BoardDAO 객체 생성
	ImgDAO idao = new ImgDAO();
	// deleteBoard(bb) - 글 삭제 메서드
	int check = idao.deleteBoard(ib);
	
	// 처리 결과에 따른 페이지 이동
	
	if(check == 1){
		%>
		<script type="text/javascript">
			alert("글을 성공적으로 삭제했습니다");
			location.href="reviewList.jsp?pageNum=<%=pageNum %>";
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
			alert("비밀번호를 확인하세요");
			history.back();
		</script>
		<%
	}else { // check == -1
		%>
		<script type="text/javascript">
			alert("비밀번호를 확인하세요");
			history.back();
		</script>
		<%
	}		
		
		
%>	




</body>
</html>