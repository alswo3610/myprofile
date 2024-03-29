<!-- adminMain.jsp -->
<%@page import="onedaybacking.boardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="onedaybacking.minjaeMgr" />

<html>
<head>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
			crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous">
	</script>
	
	<link href="minjae.css" rel="stylesheet" type="text/css">

</head>


<body>

<nav class="navbar" id="navbar">
    <ul>
    	<a href="adminMain.jsp"><img id="adminpage" src="img/adminpage.png" width="55" height="55"></a>
        <li><a href="adminBoard.jsp">게시판 관리</a></li>
        <li><a href="#">주문 관리</a></li>
        <li><a href="#">상품 관리</a></li>
        <li><a href="#">클래스 관리</a></li>
        <li><a href="#">회원 관리</a></li>
    </ul>
</nav>

<form name="frm" method="POST" action="boardProc.jsp">

	<div style="width: 60%; margin: auto">
		<br><br>
			<td style="text-align: left;">
				<font size="5px" color="brown">|</font>
				<font size="4px"><b>전체 주문통계</b></font><p>
			</td>
		<div style="width: 30%; float: left">
			<table border="1" align="center">
				<tr>
					<th style="text-align: center; width: 30%;" colspan="2">전체 주문현황</th>
				</tr>
				<tr>
					<td scope="col" style="text-align: center; width:50px; background-color:rgb(237, 237, 237)">총 주문건수</td>
					<td scope="col" style="text-align: center; width:50px; background-color:rgb(237, 237, 237)">총 주문금액</td>
				</tr>
				<tr>
					<td style="text-align: center;">DB</td>
					<td style="text-align: center;">DB</td>
				</tr>
			</table>
		</div>
		<div style="width: 60%; float: right">
			<table border="1" align="center">
				<tr>
					<th style="text-align: center; width: 60%;" colspan="5">전체 주문상태</th>
				</tr>
				<tr>
					<td scope="col" style="text-align: center; width:100px; background-color:rgb(237, 237, 237)">결제완료</td>
					<td scope="col" style="text-align: center; width:100px; background-color:rgb(237, 237, 237)">상품 준비중</td>
					<td scope="col" style="text-align: center; width:100px; background-color:rgb(237, 237, 237)">배송준비</td>
					<td scope="col" style="text-align: center; width:100px; background-color:rgb(237, 237, 237)">배송중</td>
					<td scope="col" style="text-align: center; width:100px; background-color:rgb(237, 237, 237)">배송완료</td>
				</tr>
				<tr>
					<td style="text-align: center;">DB</td>
					<td style="text-align: center;">DB</td>
					<td style="text-align: center;">DB</td>
					<td style="text-align: center;">DB</td>
					<td style="text-align: center;">DB</td>
				</tr>
			</table>
		</div>
		<br><br>
		<div align="center">
			<br><br>
			<table style="text-align: center; width: 100%">
				<thead>
					<td style="text-align: left;">
						<font size="5px" color="brown">|</font>
						<font size="4px"><b>최근 주문내역</b></font><p>
					</td>
				</thead>
				
				<tbody id="square">
					<%
						Vector<boardBean> llist = mgr.selectAllAdminBoards();
					%>
					<tr style="background-color: rgb(237, 237, 237)">
						<th scope="col">주문번호</th>
						<th scope="col">주문자</th>
						<th scope="col">수령인</th>
						<th scope="col">전화번호</th>
						<th scope="col">결제방법</th>
						<th scope="col">주문금액</th>
						<th scope="col">주문일자</th>
					</tr>
					<%
						Vector<boardBean> list = mgr.selectAllAdminBoards();
						for (int i = 0; i < list.size(); i++) {
							boardBean bbean = list.get(i);
					%>
					<tr>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			
			<br><br>
			
			<table style="text-align: center; width: 100%">
				<thead>
					<td style="text-align: left;" colspan='7'>
						<font size="5px" color="brown">|</font>
						<font size="4px"><b>최근 등록된 상품</b></font><p>
					</td>
				</thead>
				
				<tbody id="square">
					<tr style="background-color: rgb(237, 237, 237)">
						<th scope="col">상품번호</th>
						<th scope="col">등록인</th>
						<th scope="col">상품명</th>
						<th scope="col">상품금액</th>
						<th scope="col">등록아이디</th>
						<th scope="col">등록일자</th>
						<th scope="col">삭제여부</th>
					</tr>
					<tr>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
					</tr>
				</tbody>
			</table>
			
			<br><br>
			
			<table style="text-align: center; width: 100%">
				<thead>
					<td style="text-align: left;" colspan='7'>
						<font size="5px" color="brown">|</font>
						<font size="4px"><b>최근 등록된 클래스</b></font><p>
					</td>
				</thead>
				
				<tbody id="square">
					<tr style="background-color: rgb(237, 237, 237)">
						<th scope="col">클래스번호</th>
						<th scope="col">강사명</th>
						<th scope="col">클래스명</th>
						<th scope="col">클래스금액</th>
						<th scope="col">소요시간</th>
						<th scope="col">등록일자</th>
						<th scope="col">승인여부</th>
					</tr>
					<tr>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
					</tr>
				</tbody>
			</table>
			
			<br><br>
			
			<table style="text-align: center; width: 100%">
				<thead>
					<td style="text-align: left;" colspan='7'>
						<font size="5px" color="brown">|</font>
						<font size="4px"><b>최근 가입한 사용자</b></font><p>
					</td>
				</thead>
				
				<tbody id="square">
					<tr style="background-color: rgb(237, 237, 237)">
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">생년월일</th>
						<th scope="col">성별</th>
						<th scope="col">전화번호</th>
						<th scope="col">가입일자</th>
						<th scope="col">탈퇴여부</th>
					</tr>
					<tr>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
						<td style="width : 180px;">DB</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>
</body>
</html>
