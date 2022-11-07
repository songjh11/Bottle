<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<script defer src="/js/util.js"></script>
<script defer src="/js/login.js"></script>
</head>
<body>
<h1>Login</h1>
<c:import url="../template/Header.jsp"></c:import>
<div style="display: flex; align-items: center; flex-direction: column;">
	<main class="form-signin w-100 m-auto">
<form action="login" method="POST" id="lgFrm">
	<div style="display: flex; justify-content: center;">
		<div style="width: 30%;">
	    <h1 class="h3 mb-3 fw-normal">Please Login</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" name="id" id="floatingInput" placeholder="ID">
	      <label for="floatingInput">ID</label>
	    </div>
	    <div>
	      <label id="idResult"></label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" name="pw" id="floatingPassword" placeholder="Password">
	      <label for="floatingPassword">Password</label>
	    </div>
		<div>
	      <label id="passwordResult"></label>
		</div>
	    <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div>
	    <button class="w-100 btn btn-lg btn-outline-secondary" id="lgBtn" type="button">Login</button>
		</div>
	</div>
  </form>
</main>

</div>
	<script type="text/javascript">
    $('#contents').summernote({
        tabsize: 4,
        height: 350
      });
	</script>
</body>
</html>