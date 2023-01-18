<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<form action="order" method="post" id="orderForm">
			<table class="table table-hover w-75" >
				<thead class="table-light">
					<tr>
						<th><input class="form-check-input" type="checkbox" value="" id="allChecked" name="checkAll"></th>
						<th colspan="3">상품정보</th>
						<th>수량</th>
						<th>상품가격</th>
						<th>할인</th>
						<th>합계금액</th>
						<th>배송비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="checkList"></td>
						<td><img src="/item_img/101.Pure Perfume Oil.png" class="itemimg"></td>
						<td>상품명</td>
						<td>상품정보</td>
						<td>
							<input type="number" name="itemcount" min="1" max="200" value="1" onchange="changeCount(this)">
							<span class="btn_area">
								<button class="cart_btn up" type="button" onclick="increase(this);"></button>
								<button class="cart_btn down" type="button" onclick="decrease(this);"></button>
							</span>						
						</td>
						<td name="price" data-value="50000"><fmt:formatNumber pattern="#,###원" value="50000"></fmt:formatNumber></td>
						<td>할인</td>
						<td name="sumPrice" >상품합계</td>
						<td>배송비</td>
					</tr>
					<tr>
						<td><input class="form-check-input" type="checkbox" value="" name="checkList"></td>
						<td><img src="/item_img/101.Pure Perfume Oil.png" class="itemimg"></td>
						<td>상품명</td>
						<td>상품정보</td>
						<td>
							<input type="number" name="itemcount" min="1" max="200" value="1" onchange="changeCount(this)">
							<span class="btn_area">
								<button class="cart_btn up" type="button" onclick="increase(this);"></button>
								<button class="cart_btn down" type="button" onclick="decrease(this);"></button>
							</span>
						</td>
						<td name="price" data-value="100000"><fmt:formatNumber pattern="#,###원" value="100000"></fmt:formatNumber></td>
						<td>할인</td>
						<td name="sumPrice" >합계금액</td>
						<td>배송비</td>
					</tr>
					<tr>
						<td><input class="form-check-input" type="checkbox" value=""name="checkList"></td>
						<td><img src="/item_img/101.Pure Perfume Oil.png" class="itemimg"></td>
						<td>상품명</td>
						<td>상품정보</td>
						<td>
							<input type="number" name="itemcount" min="1" max="200" value="1" onchange="changeCount(this)">
							<span class="btn_area">
								<button class="cart_btn up" type="button" onclick="increase(this);"></button>
								<button class="cart_btn down" type="button" onclick="decrease(this);"></button>
							</span>
						</td>
						<td name="price" data-value="25253"><fmt:formatNumber pattern="#,###원" value="25253"></fmt:formatNumber></td>
						<td>할인</td>
						<td name="sumPrice" >상품합계</td>
						<td>배송비</td>
					</tr>
				</tbody>
<%--				<tfoot>--%>
<%--					<tr>--%>
<%--						<td colspan="3"></td>--%>
<%--						<td>총 상품금액</td>--%>

<%--						<td id="totalPrice">50000</td>--%>
<%--						<td>총 배송비</td>--%>
<%--						<td>2500</td>--%>
<%--						<td>총 합계</td>--%>
<%--						<td>\</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<td><button type="button" class="btn btn-danger">선택삭제</button></td>--%>
<%--						<td><button type="button" class="btn btn-primary">선택찜</button></td>--%>
<%--						<td colspan="5"></td>--%>
<%--						<td><button type="button" class="btn btn-secondary">선택주문</button></td>--%>
<%--						<td><button class="btn btn-lg btn-dark" type="submit">전체주문</button></td>--%>
<%--					</tr>--%>
<%--				</tfoot>--%>
			</table>
			<div class="totalPrice w-75">
				<dl>
					<dt>총<strong></strong>개의 상품금액</dt>
					<dd id="totalPrice"></dd>
				</dl>
				<dl>
					<dt>총<strong></strong>개의 상품금액</dt>
					<dd id="fee">155151</dd>
				</dl>
				<dl>
					<dt>총<strong></strong>개의 상품금액</dt>
					<dd id="totalPriceSumFee">151515</dd>
				</dl>
			</div>
		</form>
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
			const add = Number(parent.find('input[name=itemcount]').val())+1;
			parent.find('input[name=itemcount]').val(add);
			
			//물건 가격
			const target = parent.siblings('td[name=sumPrice]');	//타겟
			const price = parent.siblings('td[name=price]').data('value');	//물건 가격
			
			price_replace(target, add, price);

		}

		//감소 버튼 클릭시
		decrease = (e) => {
			const parent = $(e).closest('td');
			
			//개수 변경
			if (Number(parent.find('input[name=itemcount]').val()) == 1) {
				alert('최소수량은 1개입니다.'); 
				return;
			}
			const sub = Number(parent.find('input[name=itemcount]').val())-1;
			parent.find('input[name=itemcount]').val(sub);
			
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
			const tag = $('#totalPrice');
			
			let totalPrice = 0;
			
			$('td[name=price]').each(function() {
				if ($(this).closest('tr').find('.form-check-input').is(':checked')) {
					totalPrice +=Number($(this).text().replace(',','').replace('원',''));
				}
			});
			console.log(totalPrice);
			$(tag).text(comma(totalPrice)+'원');
		}

		// 모든 체크박스가 체크되어있으면 최상단 체크박스 체크 아니면 체크해기
		$('.form-check-input').on('change', () => {
			const cheLen = $('input[name=checkList]:checked').length;
			const boxLen = $('input[name=checkList]').length;
			
			if (cheLen == boxLen) {
				$('#allChecked').prop('checked',true);
			}
			else {
				$('#allChecked').prop('checked',false);
			}
			totalPrice();
		})

		comma = (num) => {
			return num.toLocaleString('ko-KR');
		}
	</script>
</body>
</html>