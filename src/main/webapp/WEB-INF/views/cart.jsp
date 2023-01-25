<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>


<body>

	<jsp:include page="./include/header.jsp"></jsp:include>
	<!-- 네비게이터 include 부분 -->	
	
	<jsp:include page="./include/nav.jsp"></jsp:include>
	<!-- 찜 목록 article 부분 -->
	<article class="wrap">
		<form action="/order/order" id="cartForm">
			<table class="center table table-hover w-75" >
				<thead class="table-light">
					<tr>
						<th width="3%"><input class="form-check-input" type="checkbox" value="" id="allChecked" name="checkAll"></th>
						<th width="42%" colspan="2">상품정보</th>
						<th width="10%">수량</th>
						<th width="10%">상품가격</th>
						<th width="10%">할인</th>
						<th width="15%">합계금액</th>
						<th width="10%">배송비</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list }">
						<tr>
							<td>
								<input class="form-check-input" type="checkbox" value="${item.item_no }" name="checkList">
							</td>
							<td>
								<img src="${item.url }" class="itemimg">
							</td>
							<td>${item.item_name }</td>
							<td>
								<input type="number" name="quantity" min="1" max="200" value="${item.quantity }" onchange="changeCount(this)">
								<span class="btn_area">
									<button class="cart_btn up" type="button" onclick="increase(this);"></button>
									<button class="cart_btn down" type="button" onclick="decrease(this);"></button>
								</span>
							</td>
							<td name="price" data-value="${item.price }"><fmt:formatNumber pattern="#,###원" value="${item.price }"></fmt:formatNumber></td>
							<td name="discount"></td>
							<td name="sumPrice" ><fmt:formatNumber pattern="#,###원" value="${item.price * item.quantity }"></fmt:formatNumber></td>
							<td name="fee">무료배송</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</form>
		<div class="totalPrice w-75">
			<dl>
				<dt>총<strong id="chkLen"></strong>개의 상품금액</dt>
				<dd id="totalPrice"></dd>
			</dl>
			<span class="priceIcon">
				<img src="/img/plus.png">
			</span>
			<dl>
				<dt>배송비</dt>
				<dd id="fee">0</dd>
			</dl>
			<span class="priceIcon">
				<img src="/img/equal.png">
			</span>			
			<dl>
				<dt>합계</dt>
				<dd id="totalPriceSumFee"></dd>
			</dl>
		</div>
		<div class="center w-75">
			<button class="btn btn-danger" type="button">선택 상품 삭제</button>
			<button class="btn btn-lg btn-dark" style="float: right" type="button" onclick="goOrder();">상품 주문</button>
		</div>
	</article>
	<br>
	<hr>
	<!-- Footer include 부분  -->
	<jsp:include page="./include/footer.jsp"></jsp:include>
	<!-- signUp.jsp 작성자 : 박진영 -->
	
	<script type="text/javascript">
		/* 페이지 로드시 전체 체크하기*/
		$(document).ready(() => {
			$('#allChecked').click();
		});

		$('#allChecked').on('click', () => {
			const checkbox = $('input:checkbox[name="checkList"]');
			
			(checkbox.is(':checked')) ? checkbox.prop('checked',false) : checkbox.prop('checked',true); 
		})
		
		/* 밑에꺼랑 나중에 정리 필요 */
		changeCount = (e) => {
			const parent = $(e).closest('td');	//부모노드
			
			const target = parent.siblings('td[name=sumPrice]');	//타겟
			const price = parent.siblings('td[name=price]').data('value');	//물건 가격
			
			const quantity = $(e).val();
			
			price_replace(target, quantity, price)

		}

		//증가 버튼 클릭시
		increase = (e) => {
			const parent = $(e).closest('td');
			
			//개수 변경
			const add = Number(parent.find('input[name=quantity]').val())+1;
			parent.find('input[name=quantity]').val(add);
			
			//물건 가격
			const target = parent.siblings('td[name=sumPrice]');	//타겟
			const price = parent.siblings('td[name=price]').data('value');	//물건 가격
			
			price_replace(target, add, price);

		}

		//감소 버튼 클릭시
		decrease = (e) => {
			const parent = $(e).closest('td');
			
			//개수 변경
			if (Number(parent.find('input[name=quantity]').val()) == 1) {
				alert('최소수량은 1개입니다.'); 
				return;
			}
			const sub = Number(parent.find('input[name=quantity]').val())-1;
			parent.find('input[name=quantity]').val(sub);
			
			//물건 가격
			const target = parent.siblings('td[name=sumPrice]');	//타겟
			const price = parent.siblings('td[name=price]').data('value');	//물건 가격
			
			price_replace(target, sub, price);
		}

		//수량 변경시 가격 증감하기
		price_replace = (target, quantity, price) => {
			const newPrice = quantity * price;
			$(target).text(comma(newPrice)+'원');
			totalPrice();
		}

		//수량 변경시 총 가격 증감
		totalPrice = () => {
			
			let price 	= 0;		//선택된물건의 합계 저장하는 변수
			let fee 	= 0;		//배송비 저장하는 변수
			$('td[name=sumPrice]').each(function() {
				if ($(this).closest('tr').find('.form-check-input').is(':checked')) {
					price +=Number($(this).text().replaceAll(',','').replace('원',''));
				}
			});
			
			if (price > 1000000000) {
				fee = 3000;
			}
			
			$('#totalPrice').text(comma(price)+'원');
			$('#fee').text(comma(fee)+'원');
			$('#totalPriceSumFee').text(comma(price+fee)+'원');
		}

		// 모든 체크박스가 체크되어있으면 최상단 체크박스 체크 아니면 체크해기
		$('.form-check-input').on('change', () => {
			const chkLen = $('input[name=checkList]:checked').length;
			const boxLen = $('input[name=checkList]').length;
			
			if (chkLen == boxLen) {
				$('#allChecked').prop('checked',true);
			}
			else {
				$('#allChecked').prop('checked',false);
			}
			
			//몇개 체크 되어있는지
			$('#chkLen').text(chkLen);
			totalPrice();
		})

		comma = (num) => {
			return num.toLocaleString('ko-KR');
		}
		
		goOrder = () => {
			if ($('input[name=checkList]:checked').length == 0) {
				alert('선택된 상품이 없습니다.')
				return;
			}

			//이거 주문수량 변경시 서버에 업데이트 해야할듯
			//서버로 보낼 데이터 만들기
			const arr = new Array();
			const obj = new Object();
			
			$('input[name=checkList]:checked').each(function() {
				obj.item_no 	= $(this).val();
				obj.quantity	= $(this).closest('tr').find('input[name=quantity]').val();
				
				arr.push(obj);
			})
			//ajax나 fetch로 카트 업데이트하고 서버통신되면 get방식으로 order연결해야할듯
/* 			$.ajax({
				url:'/rest/cart',
				data:JSON.stringify(arr),
				method:'put',
				contentType:'application/json; charset=utf-8',
				dataType:'json',
				success : (result) => {
					console.log(result);
				}
			}) */
			$('#cartForm').submit();
		}
	</script>
</body>
</html>