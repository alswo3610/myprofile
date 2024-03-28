<!-- top.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String type = (String)session.getAttribute("type");	
	String id = (String)session.getAttribute("idKey");
%>
<script>
<% if (type == null) {
	type = "item";
	session.setAttribute("type", type);
%>
	location.replace("home.jsp");
<% } %>
</script>
<script type="text/javascript">
	function setType(type) {
		document.getElementById('type').value = type;
	}
</script>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link href="top_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar" id="header_bar">
	<ul class="header_top">
<% if (id == null || id.equals("")) { %>
		<li><a href="anounceWrite.jsp">공지사항</a></li>
		<li><a href="#">로그인</a></li>
		<li><a href="#">회원가입</a></li>
<% } else { %>
		<li><a href="anounceWrite.jsp">공지사항</a></li>
		<li><a href="#">내 정보</a></li>
		<li><a href="#">로그아웃</a></li>
<% } %>
	</ul>
</nav>
<div style="width: 65%; margin: 10px auto 0 auto; align: center">
	<form method="post" action="topProc.jsp">
		<input type="hidden" name="type" id="type" value="">
		<table style="width: 100%; align: center">
			<tr>
				<td width="120"><img src="img/logo2.png" width="120" height="100"></td>
		<% if (type.equals("item")) { %>
				<td align="center" width="70"><button class="navButton" onclick="setType('item')" id="item" style="color: #C57B37;">상품</button></td>
				<td align="center" width="70"><button class="navButton" onclick="setType('class')" id="class" style="color: #000;">클래스</button></td>
		<% } else if (type.equals("class")) { %>
				<td align="center" width="70"><button class="navButton" onclick="setType('item')" id="item" style="color: #000;">상품</button></td>
				<td align="center" width="70"><button class="navButton" onclick="setType('class')" id="class" style="color: #C57B37;">클래스</button></td>
		<% } %>
				<td width="450" align="right"><div style="width: 95%;"><input type="text" class="form-control" placeholder="검색어를 입력해주세요."></div></td>
				<td width="230" align="right">
					<ul class="header_info">
						<li><a href="#"><img src="img/heart.png" width="30" height="30"><span class="item">찜목록</span></a></li>
						<li><a href="#"><img src="img/people.png" width="30" height="30"><span class="item">내 정보</span></a></li>
						<li><a href="#"><img src="img/cart.png"  width="30" height="30"><!-- <span class="notification-dot"></span> --><span class="item">장바구니</span></a></li>
					</ul>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>