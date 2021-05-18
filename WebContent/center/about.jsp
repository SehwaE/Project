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
  

  
  <title>Flower Garden - 꽃집 </title>
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
              <img class="d-block img-fluid" src="../img/main/6.jpg" alt="First slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/4.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/5.jpg" alt="Third slide" width="900" height="350">
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
	</div>
	

	<center>
	<h2>About Us</h2>
	<pre>
	
안녕하세요.
<b>Flower Garden</b>입니다.
저희 매장은 회원제로 운영되고 있으므로 모든 주문은 <b>회원가입</b>을 하셔야만 가능합니다.
제품 구매을 구매하기 전, <b>꼭 주문방법게시판에서 주문방법을 확인해주세요!</b>
단체주문 예약 및 빠른 회신을 원하시면 051-123-4567로 전화, 혹은 <a href="sendMail.jsp">flowerGarden@gmail.com</a>으로 문의 바랍니다.
현재 모든 결제는 무통장 입금만 가능합니다. 주문 후 48시간 내에 입금해주세요.
(국민은행 1234-567-8910 홍길동)
감사합니다!
	
	
	</pre>

	<hr>
	<h3>찾아오시는길</h3>
<small>부산광역시 부산진구 부전동 동천로 109<br>
051-123-4567</small>
	<br><br>
	<div id="map" style="width:500px;height:400px;"></div>
	
	<!-- map -->
	   
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e9c89eff3191bfa6145e41e46ccec6a"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
  
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.15854565984174, 129.0620982196126), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.15854565984174, 129.0620982196126); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
	<br>
	</center>
  <!-- Footer -->
  	<jsp:include page="../inc/bottom.jsp"/>


  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	
</body>
</html>