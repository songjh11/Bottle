<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<h1>와 리스트</h1>
<img alt="" src="" style="width: 50%">
<div style="display: flex; flex-direction: column; align-items: center;">
	<div style="display: flex; width: 50%; justify-content: flex-end;">
		<div>
			<a href="./add" class="btn btn-outline-secondary">게시글 작성</a>
		</div>
	</div>
	<div style="width: 50%">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">글 번호</th>
		      <th scope="col">글 제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">조회수</th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach items="${list}" var="l">
			    <tr>
			      <td>${l.num}</td>
			      <td><a href="./detail?num=${l.num}">${l.title}</a></td>
			      <td>${l.writer}</td>
			      <td>${l.hit}</td>
			    </tr>  	
			  </c:forEach>
		  </tbody>
		</table>
	</div>
</div>
</body>
</html>