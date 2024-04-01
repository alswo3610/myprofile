<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mmgr" class="onedaybaking.minjaeMgr" />
<jsp:useBean id="abean" class="onedaybaking.announceBean"/>
<jsp:setProperty property="*" name="abean"/>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String writer = (String)session.getAttribute("idKey");
    String announceFile = request.getParameter("announceFile");

    abean.setAnnounceSubject(title);
    abean.setAnnounceContent(content);
    abean.setAnnounceWriter(writer);
    abean.setAnnounceFile(announceFile);
    
    mmgr.writeboard(abean);
%>

<%=announceFile %>
<script type="text/javascript">
	alert("등록되었습니다.");
	window.location.href = "announceList.jsp";
</script>
