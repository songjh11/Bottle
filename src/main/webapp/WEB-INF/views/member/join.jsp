<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<c:import url="../template/boot.jsp"></c:import>
<script defer src="/js/join.js"></script>
<script defer src="/js/util.js"></script>
<style>
.mb-3{
	width: 330px;
}

</style>
</head>
<body>
<h1>Join</h1>
<c:import url="../template/Header.jsp"></c:import>
<div style="display: flex; align-items: center; flex-direction: column;">
	<main class="form-signin w-100 m-auto">
<div class="mt-5">
<form:form modelAttribute="memberVO" method="post" id="joinFrm">
<form action="add" method="post">
	<div style="width: 100%; display: flex; flex-direction: column; align-items: center;">
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">ID</label>
	  <form:input path="id" cssClass="form-control" id="id"/>
	  <form:errors path="id"></form:errors>
	  <div id="inputIdResult"></div>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">PASSWORD</label>
	  <form:password path="pw" cssClass="form-control" id="pw"/>
	  <form:errors path="pw"></form:errors>
	  <div id="inputPwResult"></div>
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">PASSWORD 확인</label>
		<form:password path="pw2" cssClass="form-control" id="pw2"/>
		<form:errors path="pw2"></form:errors>
		<div id="inputPw2Result"></div>
	  </div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">NAME</label>
	  <form:input path="name" cssClass="form-control" id="name"/>
	  <div id="inputNameResult">
	  	<form:errors path="name"></form:errors>
	  </div>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Email address</label>
	   <form:input path="email" cssClass="form-control" id="email" placeholder="ex: id@gmail.com"/>
	   <form:errors path="email"></form:errors>
	   <div id="inputEmailResult"></div>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Age</label>
	   <form:input path="age" cssClass="form-control" id="age"/>
	   <form:errors path="age"></form:errors>
	   <div id="inputAgeResult"></div>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Birth</label>
	   <form:input path="birth" cssClass="form-control" id="birth" placeholder="ex: 2022-11-04"/>
	   <form:errors path="birth"></form:errors>
	   <div id="inputBirthResult"></div>
	</div>
	<div>
		<button type="button" id="joinBtn" class="btn btn-outline-secondary">Join</button>
	</div>
	</div>
</form>
</form:form>
</div>
</main>

</div>

</body>
</html>