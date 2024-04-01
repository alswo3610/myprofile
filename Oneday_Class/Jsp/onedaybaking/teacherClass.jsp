<!-- teacherClass.jsp -->
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
<form name="frm" method="post" action="teacherClassProc.jsp">
<jsp:include page="top.jsp"/>
<br><br>
<div style="width: 50%; margin: auto">
<div style="margin-left: 30px;">
	<img src="img/<%=mBean.getMemberInfoImg()%>" width="50px" height="50px" style="border-radius:100%">
	<span style="padding:10px"><b><%=mBean.getMemberNick()%></b></span>
</div>
<hr>
<div style="margin-left: 30px;">
<p>강사소개</p>
<textarea id="inputField" name="memberInfo" placeholder="강사 소개 내용을 입력해 주세요" onkeypress="handleKeyPress(event)"></textarea>
<input type="button" class="teacherButton" value="수정하기" onclick="teacherUpdate()">
</div>
<hr style="border:none; border-top:2px solid #D6D6D6"><br>
<table>
	<tr algin="center">
		<td>판매 작품</td>
		<td>클래스</td>
	</tr>
</table>
</div>
</form>
</body>
</html>