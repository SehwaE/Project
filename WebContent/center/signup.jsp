<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../css/style.css">

    <title> Flower Garden - 꽃집 </title>
    
    <script type="text/javascript">
	function check(){
		if(document.fr.id.value == "" || document.fr.id.value.length < 0){
			alert("아이디를 입력하세요");
			history.back();
			document.fr.id.focus();
			return false;
	}
	
		if(document.fr.pw.value == "" || document.fr.pw.value.length < 0){
			alert("비밀번호를 입력하세요");
			document.fr.pw.focus();
			return false;
	}
		if(document.fr.pw2.value == "" || document.fr.pw2.value.length < 0){
			alert("비밀번호를 다시 입력하세요");
			document.fr.pw2.focus();
			return false;
	}		
		if(document.fr.pw.value != document.fr.pw2.value){
			alert("비밀번호가 일치하지 않습니다");
			document.fr.pw2.focus();
			return false;
	}
		
		if(document.fr.name.value == "" || document.fr.name.value.length < 0){
			alert("이름을 입력하세요");
			document.fr.name.focus();
			return false;
	}	
		
		if(document.fr.email.value == "" || document.fr.email.value.length < 0){
			alert("이메일을 입력하세요");
			document.fr.email.focus();
			return false;
	}	
}
	
	function fun1(){
		if(document.fr.id.value == "" || document.fr.id.value.length < 0){
			alert("아이디를 먼저 입력하세요");
			document.fr.id.focus();
		}else{
			window.open("idCheck.jsp?id="+document.fr.id.value,"","width=500, height=300");
		}
	}

</script>

</head>
<body>
  

  
  <div class="content">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="form-block">
                  <div class="mb-4">
                  <h3>Sign Up</h3>                  
                </div>
                <form action="signupPro.jsp" method="post" name="fr" onsubmit="return check();">
                  <div class="form-group first">
                    <label for="name">아이디</label>
                    <input type="text" class="form-control" name="id">
                  </div>
                   <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" name="pw">

                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호 확인</label>
                    <input type="password" class="form-control" name="pw2">

                  </div>
 
                  <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" name="name">
                    
                  </div>
                  <div class="form-group last mb-4">
                    <label for="email">이메일</label>
                    <input type="text" class="form-control" name="email">
                    
                  </div>
                    <div class="form-group last mb-4">
                    <label for="phoneNumber">전화번호</label>
                    <input type="text" class="form-control" name="phone">
                    
                  </div>
                  
                  <div class="d-flex mb-5 align-items-center">
                    <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Agree our <a href="#">Terms and Conditions</a></span>
                    <input type="checkbox" checked="checked"/>
                    <div class="control__indicator"></div>
                  </label>
                    <span class="ml-auto"><a href="login.jsp" class="forgot-pass">Login</a></span> 
                  </div>
            	<input type="button" value="아이디 중복체크" class="btn btn-pill text-white btn-block btn-primary" style="width: 420px;height: 40px;"
            	onclick="fun1();">
                  <input type="submit" value="회원가입" class="btn btn-pill text-white btn-block btn-primary">
                  
                </form>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
  </body>
</html>