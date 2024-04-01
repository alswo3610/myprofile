<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>

<%
	String memberId = request.getParameter("memberId");
	boolean result = mgr.checkId(memberId);
%>

<html>
<head>
<link>
</head>
<body align="center">
<img src="logo/logo.png" height="40"><hr>
<div align="center">
	<b><%=memberId %></b><br>
	<%
		if(result){
			out.println("이미 존재하는 아이디 입니다.<p/>");
		} else{
			out.println("사용 가능한 아이디 입니다.<p/>");
		}
	%>
	<br><a href="#" onClick="self.close()">닫기
	
	<script>
		function ctrl_parents() {
			var _flag = "<%=result%>";
			opener.document.getElementById("check_duplication").value = 'Y';
			 // todo. 조건식 수정
			if ( _flag == true ) {
				// 부모창의 id가 'check_duplication'의 값을 'Y' 변경 
				
			} else {
				// 부모창의 아이디 입력란을 비우고 포커스 맞춰주기
				opener.document.getElementById("member_id").value = "";
				opener.document.getElementById("member_id").focus();
			}
			// 창 닫기 
			self.close();
		}	
	</script>
</div>
</body>
</html>