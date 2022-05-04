<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>구매 목록조회</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        td:nth-child(5) span {
        	padding-left : 25px;
        	font-weight : bold;
        }
    </style>

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
		}
		
		$(function(){
			
			$("td:nth-child(1)")
			.hover(
					function(){
						$(this).css({
							"color": "skyblue",
							"font-weight": "bolder"
						});
					},
					function(){
						$(this).css({
							"color": "",
							"font-weight": ""
						});
					}
			)
			.click(function(){
				// /purchase/getPurchase?tranNo=${ purchase.tranNo }
				console.log("주문번호 클릭 : " + $(this).text().trim());
				self.location = "/purchase/getPurchase?tranNo=" + $(this).text().trim();
			});
			
			$("td:nth-child(2)").click(function(){
				// /product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }			
				console.log("상품번호 클릭 : " + $(this).attr("value"));
				self.location = "/product/getProduct?prodNo=" + $(this).attr("value");
			});
			
			$("td:nth-child(5) span").click(function(){
				// /purchase/updateTranCode?tranNo=${  purchase.tranNo }&tranCode=004	
				console.log("물건도착 클릭 : " + $(this).attr("value"));
				self.location = "/purchase/updateTranCode?tranNo=" + $(this).attr("value") + "&tranCode=004";
			});
			
		});
	
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>구매이력조회</h3>
	    </div>
	    
		<div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">   
				  				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
		    
		</div>
		
		<!--  table Start /////////////////////////////////////-->
    	<table class="table table-hover table-striped" >
    	
    		<thead>
	          <tr>
	            <th align="center">주문번호</th>
	            <th align="left" >구매상품</th>
	            <th align="left">구매자</th>
	            <th align="left">주문일</th>
	            <th align="left">배송현황</th>
	          </tr>
	        </thead>
	        
	        <tbody>
		
			  <c:set var="i" value="0" />
			  <c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <td align="left"><!-- ${ i }  -->${ purchase.tranNo }</td>
				  <td align="left"  title="Click : 상품정보 확인" value="${ purchase.purchaseProd.prodNo }">
				  	${ purchase.purchaseProd.prodName }
				  </td>
				  <td align="left">${ purchase.receiverName }</td>
				  <td align="left">${ purchase.orderDate }</td>
				  <td align="left">
				  	<c:if test="${ purchase.tranCode  == '002' }">
						구매완료					
					</c:if>
					<c:if test="${ purchase.tranCode == '003' }">
						배송중
						<span value="${ purchase.tranNo }">물건도착</span>							
						<!-- <a href="/purchase/updateTranCode?tranNo=${  purchase.tranNo }&tranCode=004">물건도착</a>  -->						
					</c:if>
					<c:if test="${ purchase.tranCode  ==  '004' }">
						배송완료
					</c:if>
				  </td>
				  
				</tr>
	          </c:forEach>
        
        	</tbody>
    	
    	</table>
	
	</div>   	
		
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>