<%@page import="onedaybaking.MemberBean"%>
<%@page import="onedaybaking.MemberAddressBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>

<%
	
	String memberId = (String)session.getAttribute("idKey");
	MemberBean mBean = mgr.memberList(memberId);
	MemberAddressBean maBean = mgr.AddressList(memberId);
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<link href="myinfo_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<form>
<jsp:include page="top.jsp"/>
<br><br><br><br><br>
 <div style="width: 55%;  margin: auto">
 <div style="width: 25%; float: left;">
	<table class="card_body">
	<tr>
  		<td><br><br></td>
  	</tr>
	 <tr>
	 	 <td>
	 	 <img src="img/<%=mBean.getMemberInfoImg() %>" class="infoImg">
	  	<input type="button" class="inqButton" value="문의내역" onclick="location.href = 'myInquire.jsp';">
  		</td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td><input type="button" class="signButton" value="회원정보 수정" onclick="location.href='signUpdate.jsp';"></td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td>아이디 : <%=mBean.getMemberId() %></td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td>이름 : <%=mBean.getMemberName()%></td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td>기본 배송지 : </td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td>
 		<%if(maBean.getAddress() == null) {%>
 		기본 배송지를 입력해주세요.
 		<% } else { %>
  		<%=maBean.getAddress() %>
  		<% } %>
  		</td>
  	</tr>
  	<tr>
  		<td><br></td>
  	</tr>
  	<tr>
  		<td>
 		<%if(maBean.getAddressDetail() == null) {%>
 		
 		<% } else { %>
  		<%=maBean.getAddressDetail()%>
  		<% } %>
  		</td>
  	</tr>
  	<tr>														
  		<td><br><br></td>
  	</tr>
	</table>
	</div>
<table style="width:5%; float:center"></table>
<table  class="info_box"style="width:70%; float: right">
<tr>
	<td  class="cards" >
	<a href="#">
    <p class="card-title">내 상품 관리</p>
    <p></p>
    <p class="card-text">자신이 등록한 상품을 확인해 보세요!</p>
    </a>
    </td>
    <td class="space"></td>
	<td class="cards">
	<a href="wish.jsp">
    <p class="card-title">찜 목록</p>
    <p></p>
    <p class="card-text">자신이 찜한 상품과 클래스를 확인해 보세요!</p>
    </a>
    </td>
     <td class="space"></td>
	<td class="cards">
	<a href="#">
    <p class="card-title">주문 정보</p>
    <p></p>
    <p class="card-text">자신이 주문한 상품을 확인해 보세요!</p>
    </a>
    </td>
    <td class="space"></td>
  <tr>
	<td><br></td>
  </tr>
 <tr>
	<td class="cards">
	<a href="#">
    <p class="card-title">내 클래스 관리</p>
    <p></p>
    <p class="card-text">자신이 등록한 클래스를 확인해 보세요!</p>
	</a>
	</td>
	<td class="space"></td>
	<td class="cards">
	<a href="coupon.jsp">
    <p class="card-title">쿠폰함</p>
    <p></p>
    <p class="card-text">자신이 보유하고 있는 쿠폰을 확인해 보세요!</p>
    </a>
    </td>
    <td class="space"></td>
	<td class="cards">
	<a href="#">
    <p class="card-title">클래스 정보</p>
    <p></p>
    <p class="card-text">자신이 예약한 클래스를 확인해 보세요!</p>
    </a>
    </td>
    <td class="space"></td>
</tr>
</table>
</div>
</form>
<br><br><br>
</body>
</html>