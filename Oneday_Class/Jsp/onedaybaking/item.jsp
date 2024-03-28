<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="top.jsp"/>
<%
	String type = (String)session.getAttribute("type");
	if (type != null && type.equals("class"))
		response.sendRedirect(type + ".jsp");
%>