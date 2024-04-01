<!-- myInquire.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="onedaybaking.MemberBean"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<%
	String memberId = (String)session.getAttribute("idKey");
	MemberBean mBean = mgr.memberList(memberId);
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<link href="myinfo_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js">
</script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<br><br><br><br>
<div style="width: 55%; margin: auto">
<div style="width: 30%; float: left">
<table class="info_menu">
	<tr>
		<td><br></td>
	</tr>
	<tr align="center">
		<td><img src="img/<%=mBean.getMemberInfoImg() %>" width="100" height="100"></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="wish.jsp"><p class="signUpdate_card_title">찜 목록</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="coupon.jsp"><p class="signUpdate_card_title">쿠폰함</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="#"><p class="signUpdate_card_title">주문 정보</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="#"><p class="signUpdate_card_title">클래스 정보</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="#"><p class="signUpdate_card_title">내 상품 관리</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr  align="center">
		<td class="signUpdate_card" ><a href="#"><p class="signUpdate_card_title">내 클래스 관리</p></a></td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
</table>
</div>
<div style="width: 70%; float: right">
<form name="frm" action="signUpdateProc.jsp">
<div style="font-size:20px;">
	<P><b><%=mBean.getMemberName() %></b>님의 문의내역</P>
</div>
<br>
<div style="font-size:16px;">
	<P>상품 문의</P>
</div>
<hr style="border:none; border-top:2px solid #D6D6D6">
<input type="hidden" name="memberId" value="<%=memberId%>">
</form>
</div>
</div>
<br><br><br>
</body>
</html>