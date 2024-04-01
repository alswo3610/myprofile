<!-- memberProc.jsp -->

<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<jsp:useBean id="mBean" class="onedaybaking.MemberBean"/>
<jsp:setProperty property="*" name="mBean"/>

<%
	String memberId = request.getParameter("memberId");
	boolean idresult = mgr.checkId(memberId);
	if(!idresult){
	boolean result = mgr.insertMember(mBean);
	if(result){
%>
<script>
	alert("회원가입 성공하였습니다.");
	location.href="login.jsp";
</script>
<% } 
	} else { %>
<script>
alert("아이디를 다시 확인해주세요.");
history.back();
</script>
<% }%>