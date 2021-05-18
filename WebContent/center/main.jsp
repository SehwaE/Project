<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title> Flower Garden - 꽃집 </title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

  <link href="../css/modern-business.css" rel="stylesheet">
  
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
              <img class="d-block img-fluid" src="../img/main/64.jpg" alt="first slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/105.jpg" alt="Second slide" width="900" height="350">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="../img/main/12.jpg" alt="Third slide" width="900" height="350">
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

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#1"><img class="card-img-top" src="../img/item/81.jpg" alt="flower1" width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#1">라넌큘러스</a>
                  </h4>
                <h5> ₩ 20,000</h5>
                <p class="card-text">사랑하는 사람에게 매력적인 라넌큘러스를 선물하세요<br><br>
                (한 단을 기준으로 판매합니다)
          		 </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9733; </small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#2"><img class="card-img-top" src="../img/item/82.jpg" alt="flower2"  width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#2">백합</a>
                </h4>
                <h5> ₩ 20,000</h5>
                <p class="card-text">사랑하는 사람에게 백합으로 변함없는 사랑을 선물하세요<br><br>
                (한 단을 기준으로 판매합니다)
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9733; </small>
              </div> 
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#3"><img class="card-img-top" src="../img/item/80.jpg" alt="flower3"  width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#3">카네이션</a>
                </h4>
                <h5> ₩ 20,000</h5>
                <p class="card-text">카네이션으로 사랑과 존경을 표현하세요<br><br>
                (한 단을 기준으로 판매합니다)
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9734; </small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#4"><img class="card-img-top" src="../img/item/97.jpg" alt="flower4"  width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#4">안개꽃</a>
                </h4>
                <h5> ₩ 20,000</h5>
                <p class="card-text">안개꽃으로 영원한 사랑을 표현하세요<br><br>
                (한 단을 기준으로 판매합니다)</p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9734; </small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#5"><img class="card-img-top" src="../img/item/28.jpg" alt="flower5"  width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#5">장미</a>
                </h4>
                <h5> ₩ 20,000</h5>
                <p class="card-text">장미꽃으로 열렬한 사랑을 표현하세요<br><br>
                (한 단을 기준으로 판매합니다)</p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9733;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productList.jsp#6"><img class="card-img-top" src="../img/item/44.jpg" alt="flower6"  width="700" height="400"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productList.jsp#6">꽃바구니</a>
                </h4>
                <h5> ₩ 50,000</h5>
                <p class="card-text">사랑하는 사람에게 선물하세요<br><br><br>
                (30송이가 랜덤으로 들어갑니다)</p>
              </div>
              <div class="card-footer">
                <small class="text-muted"> 고객만족도 &#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
          

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
	<jsp:include page="../inc/bottom.jsp"/>
  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
