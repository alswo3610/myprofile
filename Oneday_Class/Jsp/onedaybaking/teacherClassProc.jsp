<!-- teacherClassProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<jsp:useBean id="mBean" class="onedaybaking.MemberBean"/>
<jsp:setProperty property="*" name="mBean"/>

<%
	String memberId = request.getParameter("memberId");
	boolean result = mgr.teacherInfo(memberId);
	if(result){
		
%>
<script>
	alert("강사소개를 수정하였습니다.");
	location.href="teacherClass.jsp";
</script>
<% } else {%>
<script>
	alert("강사소개 수정 실패하였습니다.");
	history.back();
	</script>
<% }%>