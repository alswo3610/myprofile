<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="top.jsp"/>

<html>
<head>
<title>게시글 작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<link href="minjae.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function updateFileName(input) {
		var fileName = input.files[0].name;
		document.getElementById('fileName').textContent = fileName;
	}
	
	function insertBoard() {
		var title = document.forms["frm"]["title"].value;
		var content = document.forms["frm"]["content"].value;

		if (title.trim() === "") {
			alert("제목을 입력하세요");
			document.frm.title.focus();
			return false;
		}
	   
		if (content.trim() === "") {
			alert("내용을 입력하세요");
			document.frm.content.focus();
			return false;
		}
	    
		document.frm.submit();
	}
</script>

</head>

<body>
	<form name="frm" method="POST" action="boardWriteProc.jsp" onsubmit="return insertBoard();">
		<br><br>
		<br><br>
		<br><br>
		<br><br>
		<div style="width: 60%; margin: auto">
			<div class="menuSub">게시글 작성</div>
			<br><br>
			<table class="boardmenu" style="text-align: left; margin: auto; width: 60%; border-spacing: 0 10px; border-collapse: separate;">
				<tr>
					<th>글 제목</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="title" placeholder="제목을 입력하세요" style="width: 100%; padding: 5px;">
					</td>
				</tr>
				<tr>
					<td>
					<div style="display: flex; align-items: center;">
						<span id="fileName" style="flex: 1; padding: 5px; color: rgb(118, 118, 118); border: 1px solid rgb(118, 118, 118); border-radius: 3px;">첨부파일을 선택하세요</span>
						<label style="font-size: 13px;color: white; background-color: #B4866C; border-color: #B4866C;" class="filebutton" for="profile">파일선택</label>
						<input type="file" id="profile" style="margin-left: 10px; display:none;" onchange="updateFileName(this)" >
					</div>
					</td>
				</tr>
				<tr height="10px"></tr>
				<tr>
					<th>글 내용</th>
				</tr>
				<tr>
					<td>
						<textarea name="content" placeholder="내용을 작성하세요" style="width: 100%; padding: 5px; height: 400px; resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<br><br>
			<button style="padding: 10px 70px; display: block; margin: 0 auto; background-color: #884A01; color: white; border: 1px solid #884A01; border-radius: 10px;" onclick="insertBoardAndRedirect()">
				등록하기
			</button>
			<br><br>
			<br><br>
			<br><br>
			<br><br>
	
	
	
	
		</div>
	</form>
</body>
</html>