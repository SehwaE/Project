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
  
  
  <title>Flower Garden - 꽃집 </title>
  
  <link rel="stylesheet" href="css/bootstrap.css">
  
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

	// 파라미터값 num, pageNum	저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB 이동 후 num에 해당하는 정보를 가져오기
	// -> 화면에 출력(글쓴이, 제목, 내용)
	BoardDAO bdao = new BoardDAO();
	BoardBean bb = bdao.getBoard(num);

%>
	
	
	
	
	
	
	
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>주문서 수정하기</h3>
        <form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" name="sentMessage" id="contactForm" novalidate>
        	<input type="hidden" name="num" value="<%=bb.getNum() %>">
          <div class="control-group form-group">
            <div class="controls">
              <label> 주문자 명 </label>
              <input type="text" class="form-control" name="name" value="<%=bb.getName() %>" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
           <div class="control-group form-group">
            <div class="controls">
              <label>비밀번호 </label>
              <input type="password" class="form-control" name="pass" required data-validation-required-message="Please enter your password.">
              <p class="help-block"></p>
            </div>
            </div>
            <div class="control-group form-group">
            <div class="controls">
              <label> 주문제품 </label>
              <input type="text" class="form-control" name="product" value="<%=bb.getProduct() %>">
              <p class="help-block"></p>
            </div>
            </div>
       	<div class="control-group form-group">
           <div class="controls">
              <label> 배송지 </label>
				<input type="text" id="postcode" name="postcode" value="<%=bb.getPostcode() %>" style="width:200px;font-size:15px;">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="add1" name="add1" value="<%=bb.getAdd1() %>" style="width:360px;font-size:15px;">
				<input type="text" id="add2" name="add2" value="<%=bb.getAdd2() %>" style="width:360px;font-size:15px;"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="add3" name="add3" value="<%=bb.getAdd3() %>" style="width:360px;font-size:15px;">
				<input type="text" id="add4" name="add4" value="<%=bb.getAdd4() %>" style="width:360px;font-size:15px;">
              <p class="help-block"></p>
            </div>
            </div>
            
          <div class="control-group form-group">
            <div class="controls">
              <label> 글제목 (Subject) </label>
              <input type="text" class="form-control" name="subject" value="<%=bb.getSubject() %>" required data-validation-required-message="Please enter the subject.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label> 요구 사항 (Request) </label>
              <textarea rows="10" cols="100" class="form-control" name="content" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none">
<%=bb.getContent() %>
</textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton"  style="float: right;">수정하기</button>
        </form>
      </div>
    </div>
    <!-- /.row -->

	</div>
  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>
	
	<!-- Map API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("add1").value = roadAddr;
                document.getElementById("add2").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("add4").value = extraRoadAddr;
                } else {
                    document.getElementById("add4").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

  <!-- Bootstrap core JavaScript -->
   <script src="../vendor/jquery/jquery.min.js"></script> 
   <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vender/bootstrap/js/bootstrap.js"></script>

</body>
</html>