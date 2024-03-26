<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybacking.boardMgr" />
<jsp:useBean id="bbean" class="onedaybacking.boardBean" />

<%
int num = Integer.parseInt(request.getParameter("num"));
	bbean.setNum(num);
	mgr.deleteboard(bbean);
%>

<script>
	alert("게시판을 삭제하였습니다.");
	window.location.href = "makeboard.jsp";
</script>