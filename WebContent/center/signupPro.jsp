<%@page import="com.itwillbs.project.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
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
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달한 정보를 저장(액션태그-자바빈)
	
	%>
	<jsp:useBean id="mb" class="com.itwillbs.project.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb" />
	
	<%
	// + 날짜 정보 생성 후 추가
	mb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	System.out.println("전달정보 : "+mb);
	//모든 DB의 처리를 실행하는 객체를 생성 - 각각의 동작을 메서드로 표현
	// DB 회원가입
	// MemberDAO 객체 - exInsertMember() 호출
	MemberDAO mdao = new MemberDAO();
	
	//mdao.exInsertMember(mb);
	//mdao.getCon();
	mdao.InsertMember(mb);
	
	
	// 페이지 이동 -> 로그인 페이지
	
	%>
	
	<script type="text/javascript">
		alert("회원가입 완료되었습니다");
		location.href="login.jsp";
	</script>

	
	
	
</body>
</html>