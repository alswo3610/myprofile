<!-- makeboard.jsp -->
<%@page import="onedaybacking.boardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mmgr" class="onedaybacking.minjaeMgr" />

<html>
<head>
<title>게시판 생성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<link href="minjae.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function writeCheck() {
		var form = document.frm;

		if (!form.ename.value) {
			alert('영문명을 작성해 주세요');
			form.ename.focus();
			return false;
		}
		if (!form.kname.value) {
			alert('게시판명을 작성해 주세요');
			form.kname.focus();
			return false;
		}
		if (form.listvalue.value == "" || form.listvalue.value == null) {
			alert('목록보기 권한을 선택해주세요');
			return false;
		}
		if (form.readvalue.value == "" || form.readvalue.value == null) {
			alert('읽기권한을 선택해주세요');
			return false;
		}
		if (form.writevalue.value == "" || form.writevalue.value == null) {
			alert('쓰기권한을 선택해주세요');
			return false;
		}
		document.frm.submit();
	}

	function delFn(num) {
		var result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
			document.delfrm.num.value = num;
			document.delfrm.action = "deleteProc.jsp";
			document.delfrm.submit();
		}
	}
</script>

</head>

<body>
<nav class="navbar" id="navbar">
    <ul>
    	<a href="adminMain.jsp"><img id="adminpage" src="img/adminpage.png" width="55" height="55"></a>
        <li><a href="adminBoard.jsp" class="current-page">게시판 관리</a></li>
        <li><a href="#">주문 관리</a></li>
        <li><a href="#">상품 관리</a></li>
        <li><a href="#">클래스 관리</a></li>
        <li><a href="#">회원 관리</a></li>
    </ul>
</nav>



	<form name="frm" method="POST" action="adminboardProc.jsp" onsubmit="return writeCheck();">
		<div align="center">
			<br><br>
			<%
			Vector<boardBean> llist = mmgr.selectAllBoards();
			%>
			<table class="table table-hover" style="text-align: center; width: 60%">
				<thead>
					<tr>
						<td style="text-align: left;">
							<font size="5px" color="brown">|</font>
							<font size="4px"><b>총 게시판 수 : <%=llist.size()%></b></font>
						</td>
					</tr>
					<tr style="background-color: rgb(237, 237, 237)">
						<th scope="col">번호</th>
						<th scope="col">게시판 영문명</th>
						<th scope="col">게시판명</th>
						<th scope="col">사용여부</th>
						<th scope="col">목록보기권한</th>
						<th scope="col">읽기권한</th>
						<th scope="col">쓰기권한</th>
						<th scope="col">기능</th>
					</tr>
				</thead>

				<tbody>
					<%
					Vector<boardBean> list = mmgr.selectAllBoards();
					for (int i = 0; i < list.size(); i++) {
						boardBean bbean = list.get(i);
					%>

					<tr>
						<th><%=bbean.getNum()%></th>
						<td><%=bbean.getEname()%></td>
						<td><%=bbean.getKname()%></td>
						<td><%=bbean.getUsevalue()%></td>
						<td><%=bbean.getListvalue()%></td>
						<td><%=bbean.getReadvalue()%></td>
						<td><%=bbean.getWritevalue()%></td>
						<td>
							<button class="button">수정</button>
							<button class="button" onclick="javascript:delFn('<%=bbean.getNum()%>')">삭제</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<table id="square" style="text-align: center; width: 60%">
				<tr height="50">
					<td style="background-color: rgb(237, 237, 237); font-size: 12; width: 80px;">게시판생성</td>
					<td style="font-size: 12; width: 230px;">
						<input type="text" name="ename" placeholder="게시판 영문명을 입력하세요." required value=""	style="width: 200px"></td>
					<td style="font-size: 12; width: 230px;">
						<input type="text" name="kname" placeholder="게시판명을 입력하세요." required value="" style="width: 200px"></td>
					<td style="font-size: 12">목록권한</td>
					<td style="font-size: 12">
						<select id="목록권한" name="listvalue" style="width: 100px;">
							<option value="" selected disabled hidden>선택하세요</option>
							<option value="0">관리자</option>
							<option value="1">유저</option>
							<option value="2">모두</option>
						</select>
					</td>
					<td style="font-size: 12">읽기권한</td>
					<td style="font-size: 12">
						<select id="읽기권한" name="readvalue" style="width: 100px">
							<option value="" selected disabled hidden>선택하세요</option>
							<option value="0">관리자</option>
							<option value="1">유저</option>
							<option value="2">모두</option>
						</select>
					</td>
					<td style="font-size: 12">쓰기권한</td>
					<td style="font-size: 12">
						<select id="쓰기권한" name="writevalue" style="width: 100px">
							<option value="" selected disabled hidden>선택하세요</option>
							<option value="0">관리자</option>
							<option value="1">유저</option>
							<option value="2">모두</option>
						</select>
					</td>
					<td style="font-size: 12; width: 100px">
						<button type="button" class="button" onclick="writeCheck();">게시판 생성</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<form method="POST" name="delfrm">
		<input type="hidden" name="flag" value="delete">
		<input type="hidden" name="num">
	</form>
</body>
</html>