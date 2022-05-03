<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<title>����</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
				alert("����ó�� �ݵ�� �Է��ϼž� �մϴ�.");
				$("input[name='receiverPhone']").focus();
				return;
			}
			
			if(dlvyAddr == null || dlvyAddr.length <1){
				alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				$("input[name='dlvyAddr']").focus();
				return;
			}
			
			//document.addPurchase.submit();
			$("form").attr("method", "POST").attr("action", "/purchase/addPurchase?tranCode=002").submit();	
		}
		
		$(function(){
			
			$("button.btn.btn-primary:contains('����')").on("click", function(){
				fncAddPurchase();
			});
			
			$("button.btn.btn-primary:contains('���')").on("click", function(){
				history.go(-1);
			});
			
		});
	
	</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�� ǰ �� ��</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<input type="hidden" name="prodNo" value="${ product.prodNo }" />
			<input type="hidden" name="buyerId" value="${ user.userId }" />
		
			<div class="form-group">
			    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
			    <div class="col-sm-4">
			    	<p class="form-control-static">${ product.prodName }</p>
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ ������</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.prodDetail }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.manuDate }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ product.price }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">������ ID</label>
			    <div class="col-sm-4">
			      <p class="form-control-static">${ user.userId }</p>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			    <div class="col-sm-4">
			      <select class="form-control" id="paymentOption" name="paymentOption">
			      	<option value="001" selected="selected">���ݱ���</option>
					<option value="002">�ſ뱸��</option>
			      </select>
			    </div>
			</div>
		  
		  	<div class="form-group">
			    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${ user.userName }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ user.phone }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">����ּ�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ user.addr }"/>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			    <div class="col-sm-4">
			      <input type="date" class="form-control" id="dlvyDate" name="dlvyDate" />
			    </div>
			</div>
			
			<div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" class="btn btn-primary">����</button>
				  <button type="button" class="btn btn-primary">���</button>
			    </div>
			</div>
		  
		</form>
	
	</div>

</body>
</html>