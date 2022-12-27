<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Kepla</title>
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
html, body {
	margin: 0;
}

span a {
	margin: 2em;
	text-decoration: none;
	color : white;
}

.main {
	font-size: 30px;
}

.#main_video {
	position: relative; 
	top: 0; 
	left: 0; 
	object-fit: cover;
}

.mainNav {
	position: absolute;
	margin-top: 12em;
	top: 0;
	width: 100%;
	z-index: 3;
	color: white;
	text-align: center;
}

.header {
	position: absolute;
	top: 0;
	z-index: 3;
	width: 100%;
}

.btn.btn-outline-light.border-none {
	border: none;
	box-shadow: none;
}
</style>
</head>
<body>
	<video id="main_video" src="/img/mainVideo.mp4" autoplay loop muted="muted" width="100%" height="100%"></video>

	<!-- 헤더 -->
	<div class="header">

		<jsp:include page="header.jsp"></jsp:include>
		<header style="position: relative; text-align: right; color: white; margin-top: 3em;">
			
			<span><button type="button" class="btn btn-outline-light border-none" data-bs-toggle="modal" data-bs-target="#loginModal">
 				로그인
			</button></span> 
			<span><button type="button" class="btn btn-outline-light border-none" data-bs-toggle="modal" data-bs-target="#signUpModal">
 				회원가입
			</button></span> 
			<span><button type="button" class="btn btn-outline-light border-none" data-bs-toggle="modal" data-bs-target="#cartModal">
 				장바구니
			</button></span> 
			<span><a>고객센터</a></span>
		</header>
	</div>
	
	<!-- 네비 -->
	<div class="mainNav">
		<nav>
			<span><a>Brand</a></span>
			<span><a>Shop</a></span> 
			<span><a style="font-family: Lobster; font-size: 30px;">kepla</a></span>
			<span><a>Event</a></span> 
			<span><a href="/map">Store</a></span>
		</nav>
	</div>
	
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		document.getElementById('main_video').play();
	</script>
	<%@ include file="modals/loginModal.jsp" %>
	<%@ include file="modals/signUpModal.jsp" %>
	<%@ include file="modals/cartModal.jsp" %>
</body>
</html>