<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--컨텍스트 패스 주소 얻기 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function viewFile(obj) {
		if (obj.files && obj.files[0]) {
			$("#preview").html(
					"<img id='previewFile' src='#' width=300 height=300/>");

			var reader = new FileReader();

			reader.readAsDataURL(obj.files[0]);

			reader.onload = function(ProgressEvent) {
				$("#previewFile").attr("src", ProgressEvent.target.result);

			}
		}
	}
</script>

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 상품등록</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="img/favi.ico">

<!--================ CSS및 그외 링크 =================-->
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../css/style.css">

</head>

<style type="text/css">
#b {
	color: #384aeb;
}

@font-face {
	font-family: 'S-CoreDream-4Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'S-CoreDream-6Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

th {
	font-family: 'S-CoreDream-6Bold';
	color: black;
}

td {
	font-family: 'S-CoreDream-4Regular';
	color: black;
}

.register_form_in {
	box-shadow: 0px 10px 40px 0px rgba(56, 74, 235, 0.1);
	text-align: center;
	border-top: solid 2px #f54245;
	border-bottom: solid 2px #f54245;
	width: 800px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.purple {
	font-family: 'S-CoreDream-4Regular';
	margin-left: 150px;
	font-weight: 800;
	width: 800px;
	margin: 0 auto;
	font-size: 0.9em;
}

.signup {
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}

.btn, .button {
	cursor: pointer;
}

.p_table {
	width: 100%;
	text-align: center;
}

td {
	width: auto;
}

.w_100 {
	width: 100%;
}

.info_title {
	font-family: 'S-CoreDream-6Bold';
	font-size: 1.3em;
	background-color: #ebedec;
	text-align: center;
}

.p_table input {
	border-radius: 4px;
}

.p_table textarea {
	border-radius: 4px;
}

.p_btn {
	padding: 7px 100px;
	cursor: pointer;
	font-weight: 900;
}

.p_btn:HOVER {
	opacity: 0.8;
}
</style>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->

	<!-- 상품등록 Form -->

	<p class="purple">
		<span class="signup">PRODUCT</span><br> 다양한 옵션들로 본 상품을 소개해보세요<i
			class="far fa-smile"></i>
	</p>


	<div class="register_form_in">
		<form action="${contextPath}/product/addProduct.do"
			enctype="multipart/form-data" method="post">
			<table align="center" class="p_table table">
				<tr>
					<td colspan="4" class="info_title">상품 등록란</td>
				</tr>
				<tr>
					<td rowspan="10" id="preview"><img
						src="../upload/${productInfo.filename}" width="300" height="300"></td>
					<th>상품명</th>
					<td><input type="text" name="name" class="w_100"
						value="${productInfo.name }"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" class="w_100"
						value="${productInfo.price}"></td>
				</tr>

				<tr>
					<th>이벤트</th>
					<td><input type="text" name="event" class="w_100"
						placeholder="생일 또는 발렌타인으로 입력해주세요."></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><select name="gender">
							<c:if test="${productInfo.gender=='man' }">
								<option value="man" selected="selected">남자</option>
								<option value="woman">여자</option>
							</c:if>

							<c:if test="${productInfo.gender=='woman' }">
								<option value="man">남자</option>
								<option value="woman" selected="selected">여자</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<th>연령대</th>
					<td><select name="age">
							<c:if test="${productInfo.age == '10' }">
								<option value="10" selected="selected">10~20</option>
								<option value="20">20~30</option>
								<option value="30">30~40</option>
								<option value="40">40~50</option>
							</c:if>
							<c:if test="${productInfo.age == '20' }">
								<option value="10">10~20</option>
								<option value="20" selected="selected">20~30</option>
								<option value="30">30~40</option>
								<option value="40">40~50</option>
							</c:if>
							<c:if test="${productInfo.age == '30' }">
								<option value="10">10~20</option>
								<option value="20">20~30</option>
								<option value="30" selected="selected">30~40</option>
								<option value="40">40~50</option>
							</c:if>
							<c:if test="${productInfo.age == '40' }">
								<option value="10">10~20</option>
								<option value="20">20~30</option>
								<option value="30">30~40</option>
								<option value="40" selected="selected">40~50</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="inventory"
						value="${productInfo.inventory }" class="w_100"></td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea rows="5" cols="40" name="content" class="w_100">${productInfo.content }</textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="filename"
						class="btn btn-outline-primary" onchange="viewFile(this);"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="filename1"
						class="btn btn-outline-primary" onchange="viewFile(this);"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="file" name="filename2"
						class="btn btn-outline-primary" onchange="viewFile(this);"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="상품등록"
						class="p_btn"> <input type="button" value="취소"
						class="p_btn" onclick="location.href='category.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- End productWrite Area  -->

	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>