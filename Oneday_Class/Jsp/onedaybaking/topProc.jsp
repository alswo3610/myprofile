<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String type = request.getParameter("type");
	if (type == null)
		type = "item";
	session.setAttribute("type", type);
%>
<script>
	location.replace("<%=type + ".jsp"%>");
</script>