<%@page import="onedaybaking.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybaking.MemberMgr"/>
<%
	 String memberId = request.getParameter("memberId");
	String memberPwd = request.getParameter("memberPwd");
	boolean result = mgr.login(memberId, memberPwd);
	
	session.setAttribute("idKey", memberId);
	
	String msg="로그인에 실패 하였습니다.";
	String location = "login.jsp";
	if(result){
	    msg = "로그인에 성공 하였습니다.";
	   location = "main.jsp";
	  }
	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
	
</script>