<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<%
	String memberId = request.getParameter("memberId");
	String memberName = request.getParameter("memberName");
	String passwordResult = mgr.passwordSearch(memberId, memberName);
	//out.print(passwordResult);
	
	if(passwordResult == ""){
		out.println("  해당하는 아이디가 없습니다.");
	} else {
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body align="center">
<img src="logo/logo.png" height="80"><hr>
<form name="frm" method="post" action="passwordUpdate.jsp">
<input type="hidden" name="memberId" value="<%=memberId%>">
<h3>비밀번호 찾기</h3>
<table align="center" class="table-spacing" >
	<tr align="center">
		<td>새 비밀번호<font color="red">*</font></td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="password" name="memberPwd" size="30" placeholder="새 비밀번호를 입력하세요" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="togglePwd" ></td>
	</tr>
	<tr align="center">
		<td>새 비밀번호 확인<font color="red">*</font></td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="repassword" name="repassword" size="30" placeholder="새 비밀번호 확인" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="retogglePwd"></td>
	</tr>
		<td colspan="4">
		<input type="button" class="idsearchButton" value="비밀번호 변경" onclick="passwordUpdate()"></td>
	</tr>
</table>	
	<br><a href="#" onClick="self.close()">닫기
</form>
</body>
</html>

<% }%>