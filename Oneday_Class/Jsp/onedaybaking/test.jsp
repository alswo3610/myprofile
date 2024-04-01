<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="test.js"></script>
	
	<script type="text/javascript">
		var intervalId;
		var currentIndex = 0; // 현재 배너 인덱스
		var banners = [
			'img/img01.jpg',
			'img/img02.jpg',
			'img/img03.jpg',
			'img/img04.jpg',
			'img/img05.jpg',
			'img/img06.jpg'
		];
		
		var totalImages = banners.length;

		function updateImageNumber() {
			// 현재 이미지 번호와 전체 이미지 번호 업데이트
			document.getElementById('imageNumber').innerText = (currentIndex + 1) + " / " + totalImages;
		}
		
		function changeBanner(index) {
			// 현재 배너 숨기기
			document.getElementById('banner').style.display = 'none';
			
			// 다음 배너 인덱스로 이동
			currentIndex = index;
			
			// 다음 배너 표시
			document.getElementById('banner').src = banners[currentIndex];
			document.getElementById('banner').style.display = 'block';
			
			// INDEX 번호 변경
			updateImageNumber();
		}
		
		function moveLeft() {
			// 좌측으로 이동 (이전 배너)
			currentIndex = (currentIndex - 1 + banners.length) % banners.length;
			changeBanner(currentIndex);
			resetInterval();
		}
		
		function moveRight() {
			// 우측으로 이동 (다음 배너)
			currentIndex = (currentIndex + 1) % banners.length;
			changeBanner(currentIndex);
			resetInterval();
		}
		
		function resetInterval() {
			// 현재 실행 중인 인터벌을 중지
			clearInterval(intervalId);
			
			// 클릭 동작이 끝난 후 3초 간격으로 인터벌 재설정
			intervalId = setInterval(function() { moveRight(); }, 1000);
		}
		
		function test() {
			alert("d");
		}
		
		// 페이지 로드 후 일정 시간마다 changeBanner 함수 호출
		window.onload = function () {
			intervalId  = setInterval(function() { moveRight() }, 1000);
		};
		
		function requestAddr() {
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
					 
					document.getElementById("sample4_engAddress").value = data.addressEnglish;
					 
					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if(roadAddr !== ''){
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}
					
					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if(data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						guideTextBox.style.display = 'block';
					
					} else if(data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
				}
			}).open();
		}
		
		function test() {
			var a = document.getElementById("test").value;
			if (a == null) {
				alert(a);
				return;
			}
			document.getElementById("test2").textContent = a;
		}
	</script>
</head>
<body>
	<div align="center">
		<br /><br />
		<img id="logo" src="img/logo.jpg" alt="로고 이미지" height="200px"><br>
		<input id="test" name="test" placeholder="상세주소"  size="60">
		<input type="submit" value="테스트" onclick="javascript:test()"><br>
		<span id="test2"></span>
		<form name="regFrm" method="post" action="testProc.jsp">
			<input type="text" name="id" width="20%">
			<input type="button" value="결제하기" onclick="requestPay()"><p>
			<input type="text" id="sample4_postcode" name="addr1"  placeholder="우편번호">
			<input type="button" onclick="requestAddr()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" name="addr2" placeholder="도로명주소" size="60" ><br>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
			<span id="guide" style="color:#999; display:none"></span>
			<input type="text" id="sample4_detailAddress" name="addr3" placeholder="상세주소"  size="60"><br>
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
			<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
		</form>
	</div>
	<div id="bannerContainer">
		<img id="banner" src="img/img01.jpg" alt="배너 이미지" width="100%">
		<button class="navButton" id="leftButton" onclick="moveLeft()"><img id="left" src="img/left01.jpg" alt="왼쪽" width="50px" height="50px"></button>
		<button class="navButton" id="rightButton" onclick="moveRight()"><img id="right" src="img/right01.jpg" alt="오른쪽" width="50px" height="50px"></button>
		<div id="imageNumber">1 / 6</div>
	</div>
</body>
</html>