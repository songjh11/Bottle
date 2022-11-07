<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../">Home</a>
        </li>
        <li class="nav-item">
         <sec:authorize access="!isAuthenticated()">
        	  <a class="nav-link" href="../member/join">Join</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          	 <a class="nav-link" href="../member/mypage">My page</a>
          </sec:authorize>
        </li>
        <li class="nav-item">
        <sec:authorize access="!isAuthenticated()">
          <a class="nav-link" href="../member/login">Login</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <a class="nav-link" href="../member/logout">Logout</a>
        </sec:authorize>		
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Board
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="./qna/list">QnA</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>
      </ul>
      <!-- <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>