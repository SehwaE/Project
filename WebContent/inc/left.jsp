<%@page import="com.itwillbs.project.member.MemberDAO"%>
<%@page import="com.itwillbs.project.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <div class="col-lg-3">
		<%
		String id = (String)session.getAttribute("id");
		
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
		if(id != null){ %>
		<h5 class="my-4"><%=mb.getId() %>님 환영합니다!</h5>
		<%
		}else{ 
		%>
        <h5 class="my-4">사랑하는 사람에게 <br>꽃을 선물하세요</h5>
        <%
        }
		%>
        <div class="list-group">
          <a href="../center/howtoorder.jsp" class="list-group-item">주문방법</a>
          <a href="../center/writeForm.jsp" class="list-group-item">주문하기</a>
          <a href="../center/boardList.jsp" class="list-group-item">주문서 확인</a>
		  <a href="../fileupload/fileuploadForm.jsp" class="list-group-item">상품후기작성</a>
		  <a href="../center/reviewList.jsp" class="list-group-item">상품후기게시판</a>
        </div>

      </div>