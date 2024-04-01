<%@ page contentType="text/html; charset=UTF-8"%>
<%
		String memberId = (String)session.getAttribute("idKey");
		
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>

</head>
<body align="center">
<img src="logo/logo.png" height="150"><hr>
<form name="frm" method="post" action="loginProc.jsp">	
<table align="center" class="table-spacing">
	<tr>
		<td>아이디<font color="red">*</font></td>
		<td><img src="logo/email.png" width="25" height="20"></td>
		<td width="50"><input name="memberId" size="65" placeholder="아이디를 입력하세요" value=""></td>
	</tr>
	<tr align="center">
		<td>비밀번호<font color="red">*</font></td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="password" name="memberPwd" size="65" placeholder="비밀번호를 입력하세요" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="togglePwd" ></td>
	</tr>
	<tr>
		<td id="idSearch" colspan="4"><a href="idSearch.jsp">아이디/비밀번호 찾기</a></td>
	</tr>
	<tr>
		<td colspan="4"><br><br></td>
	</tr>
</table>	

<input type="button" class="button" value="로그인" onclick="loginCheck()"><br><br>
<input type="button" class="button" value="회원가입" onclick="javascript:location.href='signin.jsp'">
</form>
</body>
</html>
