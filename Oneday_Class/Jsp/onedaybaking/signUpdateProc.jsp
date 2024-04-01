<!-- signUpdateProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<jsp:useBean id="mBean" class="onedaybaking.MemberBean"/>
<jsp:useBean id="maBean" class="onedaybaking.MemberAddressBean"/>
<jsp:setProperty property="*" name="mBean"/>
<jsp:setProperty property="*" name="maBean"/>
<%
	String memberId = request.getParameter("memberId");
	String memberPwd = request.getParameter("memberPwd");
	boolean pwdresult = mgr.passwordCheck(memberId, memberPwd);
	if(pwdresult){
	boolean result = mgr.memberUpdate(maBean, mBean);
		if(result) {
%>	
<script>
	alert("회원정보를 수정하였습니다.");
	location.href="signUpdate.jsp";
</script>
<% } 
	} else { %>
<script>
alert("비밀번호가 일치하지 않습니다.");
history.back();
</script>
<% }%>



