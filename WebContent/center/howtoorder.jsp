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
              <img class="d-block img-fluid" src="../img/main/94.jpg" alt="First slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/100.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/93.jpg" alt="Third slide" width="900" height="350">
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
   	  
   	  	<!-- main -->
	<div id="main">
	<center>
	<h1>How to Order?</h1>
	
	<h4>주문안내</h4>
	<pre>
	
1. <b>로그인</b>을 하세요. (계정이 없을경우 <b>회원가입</b>이 필요합니다)
2. 원하는 꽃의 품목을 선택하세요.
3. 주문서 작성하기 게시판에서 상품명과 수량, 주소를 입력하세요.
4. 요구사항의 문항을 채워주세요.
5. 주문서를 작성한 뒤 <b>48시간 내에 입금</b>해주세요.
<b>국민은행 1234-567-8910 홍길동</b>
(현재 무통장입금만 가능합니다. 양해부탁드립니다.)

	</pre>
	</center>
	</div>

	<!-- /main -->
   	  
   	 </div>
          

  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>


  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>