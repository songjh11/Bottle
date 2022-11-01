<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<script defer src="/js/add.js"></script>
<script defer src="/js/util.js"></script>
</head>
<body>
<h1>와 글쓰기</h1>
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
			<a class="nav-link" href="">My Page</a>
		  </li>
		  <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			  Board
			</a>
			<ul class="dropdown-menu">
			  <li><a class="dropdown-item" href="../qna/list">QnA</a></li>
			  <li><hr class="dropdown-divider"></li>
			</ul>
		  </li>
		</ul>
	  </div>
	</div>
  </nav>

<div style="display: flex; align-items: center; flex-direction: column;">
	<form:form modelAttribute="qnaVO" method="POST" enctype="multipart/form-data" id="addFrm">
			<form action="add" method="POST" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="title" class="form-label">Title</label>
					<form:input path="title" cssClass="form-control" id="title"/>
						<form:errors path="title"></form:errors>
						 	<div id="titleResult"></div>
				</div>
				<div class="mb-3">
					<label for="writer" class="form-label">Writer</label>
					<form:input path="writer" cssClass="form-control" id="writer"/>
						<form:errors path="writer"></form:errors>
						 	<div id="writerResult"></div>
				</div>
				<div class="mb-3">
					<label for="contents" class="form-label">Contents</label>
					<form:textarea path="contents" cssClass="form-control" id="contents"/>
						<form:errors path="contents"></form:errors>
						 	<div id="contentsResult"></div>
				</div>
				<div class="mb-3" id="fileArea">
					<label for="files" class="form-label">Files</label>
				</div>
				<div class="mb-3">
					<button type="button" class="btn btn-outline-secondary" id="fileAdd">FileAdd</button>
				</div>
				
				<div style="display: flex; width: 100%; justify-content: space-evenly">
					<div>		
						<button type="button" id="addBtn" class="btn btn-outline-secondary">등록</button>
					</div>
					<div>
						<a href="./list" class="btn btn-outline-secondary">취소</a>
					</div>
				</div>
		</form>
	</form:form>
</div>
	<script type="text/javascript">
    $('#contents').summernote({
        tabsize: 4,
        height: 350
      });
	</script>
</body>
</html>