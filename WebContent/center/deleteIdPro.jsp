<%@page import="com.itwillbs.project.member.MemberDAO"%>
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
	String id = (String) session.getAttribute("id");
	if(id == null){
		System.out.println("삭제 페이지 -> 로그인 페이지");
		response.sendRedirect("login.jsp");
	}
	
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 삭제할 계정정보를 받아서 처리
	// 파라미터값이 입력없이 전달될 경우 "" 공백문자로 입력
	String pw = request.getParameter("pw");
	System.out.println("pw: "+ pw);
	
	// DAO 객체 생성 - deleteMember(id,pw);
	MemberDAO mdao = new MemberDAO();
	
	int check = mdao.deleteMember(id,pw);
	
	// 처리 결과를 저장해서 페이지 이동
	// 삭제 완료 -> 1 , 비밀번호 오류 -> 0, 아이디 없음 -> -1
	if(check == 1){
		// 로그인 정보를 삭제
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("회원탈퇴 완료되었습니다. 이용해주셔서 감사합니다.");
			location.href="main.jsp";
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
			alert("비밀번호를 확인하세요.");
			history.back();
		</script>
		<%
	}else{ //check =-1
		%>
		<script type="text/javascript">
			alert("회원정보가 없습니다.");
			history.back();
		</script>
		<%
	}
	%>


</body>
</html>