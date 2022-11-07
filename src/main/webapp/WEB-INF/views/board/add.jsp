<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
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
<c:import url="../template/Header.jsp"></c:import>

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
					<sec:authentication property="Principal" var="user"/>
					<input type="text" readonly id="writer" class="form-control" name="writer" value="${user.id}">
					

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