<!-- passwordUpdate.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<jsp:useBean id="mBean" class="onedaybaking.MemberBean"/>
<jsp:setProperty property="*" name="mBean"/>

<%
	String memberId = request.getParameter("memberId");
	String memberPwd = request.getParameter("memberPwd");
	boolean pwdresult = mgr.passwordCheck(memberId, memberPwd);
	if(!pwdresult){
	boolean result = mgr.passwordUpdate(memberId, memberPwd);
	
	if(result){
%>	
<script>
	alert("비밀번호를 수정하였습니다.");
	history.back();
</script>
<% } 
	} else { %>
<script>
alert("예전 비밀번호와 동일합니다. 새로운 비밀번호를 입력해주세요.");
history.back();
</script>
<% }%>
<div align="center">
<a href="#" onClick="self.close()">닫기
</div>
