<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mmgr" class="onedaybacking.minjaeMgr" />
<jsp:useBean id="abean" class="onedaybacking.announceBean"/>
<jsp:setProperty property="*" name="abean"/>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    abean.setAnnounceSubject(title);
    abean.setAnnounceContent(content);
    abean.setAnnounceWriter("user_id");
    
    mmgr.writeboard(abean);
%>
<script type="text/javascript">
    alert("등록되었습니다.");
    window.location.href = "announceList.jsp";
</script>
