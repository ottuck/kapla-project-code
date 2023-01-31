<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="/css/main.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link href="/css/main.css" rel="stylesheet">
<style type="text/css">
.container {
	overflow: hidden;
	margin-top: 5em;
}
p {
	margin-top: -0.5em;
}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 네비게이터 include 부분 -->	
	
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<div class="container">
		<aside class="leftMenu">
			<h3>마이페이지</h3>
			<ul>
				<li>
					<h4>쇼핑정보</h4>
					<ul>
						<li>- 주문목록/배송조회</li>
					</ul>
				</li>
			</ul>
		</aside>
		<article class="contents">
			<div>
				<h3 style="margin-bottom: 1em;">진행중인주문</h3>
				<div>
					<ol>
						<li style="background-image: url('/img/mypgae_ing_next_bg.png'); background-repeat: no-repeat; background-position: left 50px; padding: 0 0 0 30px; text-align: center;">
							<p>입금대기</p>
							<strong style="background-image:url('/img/mypgae_ing_list_bg.png'); width: 52px; height: 52px; display: inline-block; text-align: center; padding-top: 13px;">0</strong>
						</li>
						<li style="background-image: url('/img/mypgae_ing_next_bg.png'); background-repeat: no-repeat; background-position: left 50px; padding: 0 0 0 30px; text-align: center;">
							<p>입금대기</p>
							<strong style="background-image:url('/img/mypgae_ing_list_bg.png'); width: 52px; height: 52px; display: inline-block; text-align: center; padding-top: 13px;">0</strong>
						</li>
						<li style="background-image: url('/img/mypgae_ing_next_bg.png'); background-repeat: no-repeat; background-position: left 50px; padding: 0 0 0 30px; text-align: center;">
							<p>입금대기</p>
							<strong style="background-image:url('/img/mypgae_ing_list_bg.png'); width: 52px; height: 52px; display: inline-block; text-align: center; padding-top: 13px;">0</strong>
						</li>													
					</ol>
				</div>
			</div>
		</article>
	</div>
</body>
</html>