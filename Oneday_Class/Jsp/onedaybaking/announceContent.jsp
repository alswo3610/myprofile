<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="top.jsp"/>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mmgr" class="onedaybacking.minjaeMgr" />
<jsp:useBean id="abean" class="onedaybacking.announceBean"/>

<html>
<head>
<title>게시글 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<link href="minjae.css" rel="stylesheet" type="announceext/css">

</head>

<body>
<%
Vector<onedaybacking.announceBean> announceList = mmgr.selectAllUserBoards();
onedaybacking.announceBean announce = announceList.get(0);
%>

	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<div style="width: 60%; margin: auto">
		<div class="menuSub">공지사항</div>
		<br><br>
		<table class="boardmenu" style="text-align: left; margin: auto; width: 60%; border-spacing: 0 10px; border-collapse: separate;">
				<tr>
					<th>글 제목</th>
				</tr>
				<tr>
					<td style="border: 1px solid rgb(118, 118, 118); padding: 5px; font-size: 22px"><%=announce.getAnnounceSubject()%></td>
				</tr>
				<tr>
					<td>
						 파일주소 넣기 [첨부파일.jsp]
					</td>
				</tr>
				<tr height="10px"></tr>
				<tr>
					<th>글 내용</th>
				</tr>
				<tr>
					<td style="vertical-align : top; border: 1px solid rgb(118, 118, 118); width: 100%; padding: 5px; height: 400px; resize: none;"><%=announce.getAnnounceContent()%></td>
				</tr>
			</table>
			<br><br>
			<button style="padding: 10px 70px; display: block; margin: 0 auto; background-color: #884A01; color: white; border: 1px solid #884A01; border-radius: 10px;" onclick="location.href='announceList.jsp'">
				목록가기
			</button>
			<br><br>
			<br><br>
			<br><br>
			<br><br>
	</div>
</body>