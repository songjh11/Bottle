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
<h1>와 디테일</h1>
<img alt="" src="" style="width: 50%">
<div style="display: flex; align-items: center; flex-direction: column;">
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
			    <tr>
			      <td>${qvo.num}</td>
			      <td>${qvo.title}</td>
			      <td>${qvo.writer}</td>
			      <td>${qvo.hit}</td>
			    </tr>  	
			    <tr>
			      <td colspan="4" style="height: 500px; text-align: center;">${qvo.contents}</td>
			      <c:forEach items="${qvo.fileVOs}" var="file">
			      	<tr>
				      	<td>
				      		<img alt="" src="/file/qna/${file.fileName}">
				      	</td>
			      	</tr>
			      </c:forEach>
			    </tr>
		  </tbody>
		</table>
	</div>
	<div style="display: flex; width: 50%; justify-content: space-evenly">
		<div>
			<a href="./update?num=${qvo.num}" class="btn btn-outline-secondary">수정</a>
		</div>
		<div>
			<button type="button" id="delContents" class="btn btn-outline-secondary">삭제</button>
		</div>
	</div>
</div>
</body>
</html>