<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mmgr" class="onedaybacking.minjaeMgr" />
<jsp:useBean id="mbean" class="onedaybacking.boardBean" />

<%
int num = Integer.parseInt(request.getParameter("num"));
	mbean.setNum(num);
	mmgr.deleteboard(mbean);
%>

<script>
	alert("게시판을 삭제하였습니다.");
	window.location.href = "adminBoard.jsp";
</script>