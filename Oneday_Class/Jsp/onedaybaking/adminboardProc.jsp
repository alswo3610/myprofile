<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mmgr" class="onedaybaking.minjaeMgr" />
<jsp:useBean id="mbean" class="onedaybaking.boardBean"/>
<jsp:setProperty property="*" name="mbean"/>
<%
	String flag = request.getParameter("flag");
	String method = request.getMethod();
	if(method.equalsIgnoreCase("POST")){
		mmgr.insertboard(mbean);
	}

%>
<script type="text/javascript">
	alert("등록되었습니다.");
	window.location.href = "adminBoard.jsp";
</script>