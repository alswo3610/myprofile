<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bmgr" class="onedaybacking.boardMgr" />
<jsp:useBean id="bbean" class="onedaybacking.boardBean"/>
<jsp:setProperty property="*" name="bbean"/>
<%
	String flag = request.getParameter("flag");
	String method = request.getMethod();
	//out.print(method);
	if(method.equalsIgnoreCase("POST")){
		bmgr.insertboard(bbean);
	}

%>
<script type="text/javascript">
	alert("등록되었습니다.");
	window.location.href = "makeboard.jsp";
</script>