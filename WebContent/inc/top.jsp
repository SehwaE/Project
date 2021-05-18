<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../index.jsp"> Flower Garden </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="../index.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../center/about.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../center/productList.jsp">Flowers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../center/writeForm.jsp">Order</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../center/reviewList.jsp">Review</a>
          </li>
<!--           <li class="nav-item"> -->
<!--              <a class="nav-link" href="../center/sendMail.jsp">Contact</a> -->
<!--            </li>  -->
           <%if(session.getAttribute("id")!=null){ %>
          <li class="nav-item">
            <a class="nav-link" href="../center/info.jsp">My Page</a>
          </li>
          <%}%>
          <li class="nav-item">
            <a class="nav-link" 
            <%if(session.getAttribute("id")==null){ %>
            href="../center/login.jsp">Login
            <%
            }else{
            %>
            href="../center/logout.jsp">Logout
            <%}%></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>