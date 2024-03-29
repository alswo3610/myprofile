<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="onedaybacking.announceBean"%>
<jsp:include page="top.jsp"/>
<jsp:useBean id="mmgr" class="onedaybacking.minjaeMgr" />

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
	
<link href="top_style.css" rel="stylesheet" type="text/css">
<link href="minjae.css" rel="stylesheet" type="text/css">

<%
	Vector<announceBean> list = mmgr.selectAllUserBoards();
	int totalItems = list.size(); // 게시글의 총 개수
	int itemsPerPage = 10;	//페이지당 볼 개수
	int totalPages = (totalItems + itemsPerPage - 1) / itemsPerPage; // 전체 페이지 수 계산
	int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // 현재 페이지 또는 기본값 1
	int startItem = (currentPage - 1) * itemsPerPage; // 시작 아이템 인덱스 계산
	int endItem = Math.min(startItem + itemsPerPage, totalItems); // 끝 아이템 인덱스 계산
%>
</head>


<body>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<div style="width: 60%; margin: auto">
		<div class="menuSub">공지사항</div>
		<br><br>
		<table class="boardmenu" style="text-align: center; width: 100%;">
			<tr style="background-color: rgb(237, 237, 237); height: 50px;">
				<th scope="col" style="width:20px;">순번</th>
				<th scope="col" style="width:90px;">제목</th>
				<th scope="col" style="width:30px;">작성자</th>
				<th scope="col" style="width:30px;">작성일자</th>
				<th scope="col" style="width:20px;">조회수</th>
			</tr>
				<%
				for (int i = startItem; i < endItem; i++) {
				    announceBean abean = list.get(i);
				%>
				<tr style="height: 60px;" onclick="location.href='announceContent.jsp?id=<%=abean.getAnnounceNum()%>'">
					<td><%=abean.getAnnounceNum()%></td>
					<td><%=abean.getAnnounceSubject()%></td>
					<td><%=abean.getAnnounceWriter()%></td>
					<td><%=abean.getAnnounceDay()%></td>
					<td><%=abean.getAnnounceView()%>	</td>
					<%}%>
				</tr>
		</table>
		<div style="padding: 10px 30px 0px 0px;">
			<button class="button" onclick="location.href='announceWrite.jsp'" style="float: right; width: 70px;">글쓰기</button>
		</div>
		<br><br>
		<div style="text-align: center;">
		    <ul class="pagination">
		        <% for (int i = 1; i <= totalPages; i++) { %>
		            <li class="Page <%= i == currentPage ? "active" : "" %>">
		                <a href="announceList.jsp?page=<%= i %>"><%= i %></a>
		            </li>
		        <% } %>
		    </ul>
		</div>
	</div>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
</body>
</html>