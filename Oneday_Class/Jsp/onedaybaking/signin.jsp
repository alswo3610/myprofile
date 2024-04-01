<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>

</head>
<body align="center">
<img src="logo/logo.png" height="100">
<h2>회원가입<hr><br></h2>
<form name="frm" method="post" action="signinProc.jsp">
<table align="center" class="table-spacing">
	<tr align="center" class="id">
		<td>아이디<font color="red">*</font></td>
		<td><img src="logo/email.png" width="25" height="20"></td>
		<td width="50">
			<!-- // todo. Key Event 추가 -->
			<input id="member_id" name="memberId" onKeyDown="" size="65" placeholder="아이디를 입력하세요" value="">
			<input type="hidden" id="check_duplication" value="N">
		</td>
		<td><input type="button" value="중복확인" onClick="idCheck(this.form.memberId.value)"></td>
	</tr>
	<tr align="center">
		<td colspan="3" class="id-text"><font color="gray">영어소문자와 숫자를 이용하여 4~12자리의 아이디를 입력해주세요</font></td>
	</tr>
	<tr align="center"  class="password">
		<td>비밀번호<font color="red">*</font></td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="password" name="memberPwd" size="65" placeholder="비밀번호를 입력하세요" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="togglePwd" ></td>
	</tr>
	<tr align="center">
		<td colspan="3" class="id-text"><font color="gray">4자리 이상의 비밀번호를 입력해주세요</font></td>
	</tr>
	<tr align="center">
		<td>비밀번호 확인<font color="red">*</font></td>
		<td><img src="logo/padlock.png" width="25" height="20"></td>
		<td width="50"><input type="password" id="repassword" name="repassword" size="65" placeholder="비밀번호 확인" value=""></td>
		<td><img src="logo/hide.png" width="25" height="20" id="retogglePwd"></td>
	</tr>
	<tr align="center">
		<td>이름<font color="red">*</font></td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input name="memberName" size="65" placeholder="이름을 입력하세요" value="" ></td>
	</tr>
	<tr align="center">
		<td>닉네임<font color="red">*</font></td>
		<td><img src="logo/member.png" width="25" height="20"></td>
		<td width="50"><input class="input" name="memberNick" size="65" placeholder="닉네임을 입력하세요" value="" ></td>
	</tr>
	<tr align="center">
		<td>전화번호<font color="red">*</font></td>
		<td><img src="logo/phone.png" width="25" height="20"></td>
		<td width="50"><input name="memberPhone" size="65" placeholder="-를 제외한 번호만 입력하세요" value=""></td>
	</tr>
	<tr align="center">
		<td>생년월일<font color="red">*</font></td>
		<td><img src="logo/date.png" width="25" height="20"></td>
		<td width="50"><input name="memberBirth" size="65" placeholder="8자리 입력하세요(ex. 20001016)" value=""></td>
	</tr>
	<tr align="center">
		<td>성별<font color="red">*</font></td>
		<td width="50" colspan="2" class="gender">
 		<input type="radio" name="memberSex" value="0" checked>남
		<input type="radio" name="memberSex" value="1">여</td>
	</tr>
	<tr>
		<td colspan="4" align="center" class="agree" >
			<input type="checkbox"  name="allCh" onclick="allChk()"checked>모두 동의합니다.<br><br>
			<input type="checkbox"  name="fch" onclick="chk()"checked>[필수]만 14세 이상입니다.<br><br>
			<input type="checkbox"  name="fch" onclick="chk()"checked>[필수]이용약관 동의<br><br>
			<input type="checkbox"  name="fch" onclick="chk()"checked>[선택] 개인정보 수집 및 이용 동의</td>
	</tr>
	<tr>
		<td colspan="4"><br><br></td>
	</tr>
	
</table>
<input type="button" class="button" value="회원가입" onclick="inputCheck()"><br><br><br><br>
<div>아이디가 있으신가요? <b><a href="login.jsp">로그인</a></b>하기 <br><br><br><br><br><br><br><br> </div>
</form>
</body>
</html>