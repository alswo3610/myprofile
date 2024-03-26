<!-- top.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String type = request.getParameter("type");
	if (type == null || type.equals(""))
		type = "item";
	
	String id = (String)session.getAttribute("idKey");
%>
<script>

</script>
<script type="text/javascript">
	function setType(type) {
		location.href = "test.jsp";
		document.getElementById('type').value = type;
	}
</script>
<link href="top_style.css" rel="stylesheet" type="text/css">
<table>
	<tr>
		<td height="30" align="right" bgcolor="#F1E5E0">
			<div align="left">
				<% if (id == null || id.equals("")) { %>
				<button type="button" onclick="location.href = 'notice.jsp';" id="notice">공지사항</button>
				<button type="button" onclick="location.href = 'login.jsp';" id="login">로그인</button>
				<button type="button" onclick="location.href = 'signin.jsp';" id="signin">회원가입</button>
				<% } else { %>
				<button type="button" onclick="location.href = 'notice.jsp';" id="notice">공지사항</button>
				<button type="button" onclick="location.href = 'myinfo.jsp';" id="login">내 정보</button>
				<button type="button" onclick="location.href = 'logout.jsp';" id="signin">로그아웃</button>
				<% } %>
			</div>
		</td>
	</tr>
</table>
<div class="logo" align="center">
	<img id="logo_img" src="img/logo.png">
	<form method="post" action="test.jsp">
		<input type="hidden" name="type" id="type" value="">
<% if (type.equals("item")) { %>
		<button class="navButton" onclick="setType('item')" id="item" style="color: #C57B37;">상품</button>
		<button class="navButton" onclick="setType('class')" id="class" style="color: #000;">클래스</button>
<% } else if (type.equals("class")) { %>
		<button class="navButton" onclick="setType('item')" id="item" style="color: #000;">상품</button>
		<button class="navButton" onclick="setType('class')" id="class" style="color: #C57B37;">클래스</button>
<% } %>
	</form>
	<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요."  size="60">
	<img id="search_icon" src="img/search.png">
	<ul class="header_info">
		<li><a href="#"><img src="img/heart.png"><span class="item">찜목록</span></a></li>
		<li><a href="#"><img src="img/people.png"><span class="item">내 정보</span></a></li>
		<li><a href="#"><img src="img/cart.png" ><!-- <span class="notification-dot"></span> --><span class="item">장바구니</span></a></li>
	</ul>
</div>