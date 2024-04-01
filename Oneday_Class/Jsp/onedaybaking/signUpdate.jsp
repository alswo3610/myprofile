<!-- signUpdate.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="onedaybaking.MemberBean"%>
<%@page import="onedaybaking.MemberAddressBean"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>

<%
	String memberId = (String)session.getAttribute("idKey");
	MemberBean mBean = mgr.memberList(memberId);
	MemberAddressBean maBean = mgr.AddressList(memberId);
%>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<link href="myinfo_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<jsp:include page="top.jsp"/>
<br><br><br><br>
<div class="info_card" style="width: 55%; height:72%; margin: auto">
<div style="width: 40%; float: left">
<table class="info_menu">
	<tr>
		<td><br></td>
	</tr>
	<tr align="center">
		<td><img src="img/<%=mBean.getMemberInfoImg() %>" class="infoImg"></td>
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

<div style="width: 60%; float: right">

<form name="frm" action="signUpdateProc.jsp">
<table class="info_update">
	<tr>
		<td><br><br></td>
	</tr>
	<tr align="center" class="card-text">
		<td width="50">이름</td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input name="memberName" size="40" value="<%=mBean.getMemberName()%>"></td>
	</tr>
	<tr align="center" class="card-text">
		<td>비밀번호 확인</td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="password" name="memberPwd" size="40" placeholder="비밀번호 확인" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="togglePwd"></td>
	</tr>
	<tr align="center" class="card-text">
		<td width="130">닉네임</td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input class="input" name="memberNick" size="40" value="<%=mBean.getMemberNick()%>" ></td>
	</tr>
	<tr align="center" class="card-text">
		<td width="130">전화번호</td>
		<td><img src="logo/phone.png" width="25" height="20"></td>
		<td width="50"><input name="memberPhone" size="40" value="<%=mBean.getMemberPhone()%>" ></td>
	</tr>
	<tr align="center" class="card-text">
		<td width="130">주소입력</td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50">
		<input type="text" id="postcode" name="zipcode" size="10" placeholder ="우편번호"
		value="<%if(maBean.getZipcode() == null) {
		} else {%><%=maBean.getZipcode()%>
		<% } %>" readonly>
		<input type="button" style="font-size:12px;" onclick="requestAddr()" value="우편번호 찾기">
		</td>
	</tr>
	<tr align="center" class="card-text">
		<td colspan="2"></td>
		<td width="50">
		<input type="text" id="roadAddress" name="address"  size="40" placeholder="도로명주소"
		value="<%if(maBean.getAddress() == null) {
		} else {%><%=maBean.getAddress()%>
		<% } %>">
		<input type="hidden" id="jibunAddress" placeholder="지번주소"  size="40">
		<span id="guide" style="color:#999; display:none"></span>
		</td>
	</tr>
	<tr align="center" class="card-text">
		<td colspan="2"></td>
		<td width="50">
		<input type="text" id="detailAddress" name="addressDetail"  size="40" placeholder="상세주소"
		value="<%if(maBean.getAddressDetail() == null) {
		} else {%><%=maBean.getAddressDetail()%>
		<% } %>">
		<input type="hidden" id="extraAddress" placeholder="참고항목"  size="40">
		<input type="hidden" id="engAddress" placeholder="영문주소"  size="40" >
		</td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr>
		<td colspan="3">
		<input class="updateButton" type="button" value="회원정보 수정" onclick="memberUpdate()">
		</td>
	</tr>
</table>
<input type="hidden" name="memberId" value="<%=memberId%>">
</form>
</div>
</div>
<br><br><br>
</body>
</html>