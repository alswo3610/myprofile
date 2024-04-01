<%@ page contentType="text/html; charset=UTF-8"%>


<html>
<head>
<title>아이디/비밀번호 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>

</head>
<body align="center">
<img src="logo/logo.png" height="150"><br><hr>
<form name="frm" action="idSearchProc.jsp">
<div style="width: 80%; margin: auto">
<div style="width: 45%; float: left">
<h3>아이디 찾기</h3>
<table align="center" class="table-spacing" >
	<tr align="center">
		<td>이름<font color="red">*</font></td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input name="idname" size="50" placeholder="이름을 입력하세요" value="" ></td>
	</tr>
	<tr align="center">
		<td>전화번호<font color="red">*</font></td>
		<td><img src="logo/phone.png" width="25" height="20"></td>
		<td width="50"><input name="memberPhone" size="50" placeholder="-를 제외한 번호만 입력하세요" value=""></td>
	</tr>
	<tr align="center">
		<td>생년월일<font color="red">*</font></td>
		<td><img src="logo/date.png" width="25" height="20"></td>
		<td width="50"><input name="memberBirth" size="50" placeholder="8자리 입력하세요(ex. 20001016)" value=""></td>
	</tr>
	
	<tr>
		<td colspan="3">
		<input type="button" class="loginButton" value="로그인" onClick="javascript:location.href='login.jsp'">
		<input type="button" class="idsearchButton" value="아이디찾기" onclick="idSearch()">
		</td>
	</tr>
</table>
</div>
<div class="vertical-line"></div> 
<div style="width: 45%; float: right">
<h3>비밀번호 찾기</h3>
<table align="center" class="table-spacing">
	<tr>
		<td>아이디<font color="red">*</font></td>
		<td><img src="logo/email.png" width="25" height="20"></td>
		<td width="50"><input name="memberId" size="50" placeholder="아이디를 입력하세요" value=""></td>
	</tr>
	<tr align="center">
		<td>이름<font color="red">*</font></td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input name="memberName" size="50" placeholder="이름을 입력하세요" value="" ></td>
	</tr>
	
	<tr>
		<td colspan="3">
		<input type="button" class="loginButton" value="로그인" onClick="javascript:location.href='login.jsp'">
		<input type="button" class="idsearchButton" value="비밀번호 찾기" onclick="passwordSearch()"></td>
	</tr>
</table>
</div>
</div>
</form>
</body>
</html>