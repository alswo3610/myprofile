<!-- wish.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String memberId = (String)session.getAttribute("idKey");
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<link href="myinfo_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js">
</script>
</head>
<body>
<jsp:include page="top.jsp"/>
<br><br>
<div style="width: 55%;  margin: auto">
<div class="wishTitle">
	<p>상품 위시리스트</p>
</div>

</div>
</body>
</html>