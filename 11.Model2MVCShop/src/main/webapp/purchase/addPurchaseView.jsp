<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<title>구매</title>

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
     </style>
     
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		function fncAddPurchase() {
			
			var receiverPhone =  $("input[name='receiverPhone']").val();
			var dlvyAddr = $("input[name='dlvyAddr']").val();
			console.log("receiverPhone : " + receiverPhone + ", dlvyAddr : " + dlvyAddr);
			
			if(receiverPhone == null || receiverPhone.length <1){
				alert("연락처는 반드시 입력하셔야 합니다.");
				$("input[name='receiverPhone']").focus();
				return;
			}
			
			if(dlvyAddr == null || dlvyAddr.length <1){
				alert("주소는 반드시 입력하셔야 합니다.");
				$("input[name='dlvyAddr']").focus();
				return;
			}
			
			//document.addPurchase.submit();
			$("form").attr("method", "POST").attr("action", "/purchase/addPurchase?tranCode=002").submit();	
		}
		
		$(function(){
			
			$("button.btn.btn-primary:contains('구매')").on("click", function(){
				fncAddPurchase();
			});
			
			$("button.btn.btn-primary:contains('취소')").on("click", function(){
				history.go(-1);
			});
			
		});
	
	</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상 품 구 매</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<input type="hidden" name="prodNo" value="${ product.prodNo }" />
			<input type="hidden" name="buyerId" value="${ user.userId }" />
		
			<div class="form-group">
			    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
			    <div class="col-sm-4">
			    	<p class="form-control-static">${ product.prodName }</p>
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품 상세정보</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.prodDetail }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.manuDate }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.price }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자 ID</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ user.userId }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
			    <div class="col-sm-4">
			      <select class="form-control" id="paymentOption" name="paymentOption">
			      	<option value="001" selected="selected">현금구매</option>
					<option value="002">신용구매</option>
			      </select>
			    </div>
			</div>
		  
		  	<div class="form-group">
			    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${ user.userName }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ user.phone }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송주소</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ user.addr }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
			    <div class="col-sm-4">
			      <input type="date" class="form-control" id="dlvyDate" name="dlvyDate" />
			    </div>
			</div>
			
			<div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" class="btn btn-primary">구매</button>
				  <button type="button" class="btn btn-primary">취소</button>
			    </div>
			</div>
		  
		</form>
	
	</div>

</body>
</html>