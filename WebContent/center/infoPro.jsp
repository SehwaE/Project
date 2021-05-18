<%@page import="com.itwillbs.project.member.MemberDAO"%>
<%@page import="com.itwillbs.project.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	// 로그인 세션 제어
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
	}
	
	// 한글데이터 처리
	request.setCharacterEncoding("UTF-8");
	
	
	// 수정에 필요한 정보들을 전달받아서 사용 -> 출력
	// 액션 태그 사용해서 저장
	
	%>
	
	<jsp:useBean id="umb" class="com.itwillbs.project.member.MemberBean"/>
	<jsp:setProperty property="*" name="umb"/>
	<%
	System.out.println("수정할 정보 : "+umb);
	
	MemberDAO mdao = new MemberDAO();
	int result = mdao.updateMember(umb);
	
	if(result == 1){
		%>
		<script type="text/javascript">
			alert("회원정보가 수정되었습니다.");
			location.href="main.jsp";
		</script>
		<%
		}else{
		%>
		<script type="text/javascript">
			alert("비밀번호를 확인하세요.");
			history.back();
		</script>
		<%
		}
		%>

	
	
	
	
</body>
</html>