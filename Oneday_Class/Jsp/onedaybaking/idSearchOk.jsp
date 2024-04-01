<!-- idSearchOk.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<%
	String memberName = request.getParameter("idname");
	String memberPhone = request.getParameter("memberPhone");
	String memberBirth = request.getParameter("memberBirth");
	String idResult = mgr.idSearch(memberName, memberPhone, memberBirth);
	//out.print(idResult);
%>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body align="center">
<form>
<img src="logo/logo.png" height="100"><hr><br>
	<div id="idResult" align="center">
		<%
		if(idResult != ""){
			out.print("검색된 아이디는");
		%>
		<b><%=idResult %></b>
		<%out.print("입니다.");
			} else {
				out.print("검색된 아이디가 없습니다");
			}%>
			<br><br>
	<a href="#" onClick="self.close()">닫기
	</div>
	</form>
</body>
</html>