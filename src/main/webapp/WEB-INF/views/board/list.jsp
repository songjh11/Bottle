<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<h1>와 리스트</h1>
<c:import url="../template/Header.jsp"></c:import>
<div style="display: flex; flex-direction: column; align-items: center;">
	<div style="display: flex; width: 70%; justify-content: flex-end;">
					<form>
					<div style="display: flex; align-items: center; padding-right: 10px;">
				 	 <div class="dropdown me-1">
					    <select name="kind" class="form-control" id="kind" value="">
		                    <option value="title">Title</option>
		                    <option value="contents">Contents</option>
		                    <option value="writer">Writer</option>
		                  </select>
					  </div>
					  <div style="padding-right: 5px;">
					  	<input type="text" name="search">
					  </div>
					  <div>
					  	<button class="btn btn-outline-secondary">검색</button>
					  </div>
					</div>
					</form>
					<div>
					<sec:authorize access="isAuthenticated()">
						<a href="./add" class="btn btn-outline-secondary">게시글 작성</a>
					</sec:authorize>
					</div>
	</div>
	<div style="width: 70%">
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
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pager.pre?'':'disabled'}">
	      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">Previous</a>
	    </li>
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a> </li>
			</c:forEach>
		<li class="page-item ${pager.next?'':'disabled'}">
	      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">Next</a>
	    </li>
	  </ul>
</nav>
</div>
</body>
</html>