<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<title>�������� ����</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
	           padding-top : 50px;
	       }
	</style>
	
	<script type="text/javascript">
	
		function fncAddPurchase(){
			
			var receiverName = $("input[name='receiverName']").val();
			var receiverPhone = $("input[name='receiverPhone']").val();
			var dlvyAddr = $("input[name='dlvyAddr']").val();
			
			if(receiverName == null || receiverName.length <1){
				$("input[name='receiverName']").attr("placeholder", "�̸��� �Է��ϼ���.");
				$("input[name='receiverName']").focus();
				return;
			}
			
			if(receiverPhone == null || receiverPhone.length <1){
				$("input[name='receiverPhone']").attr("placeholder", "��ȣ�� �Է��ϼ���.");
				$("input[name='receiverPhone']").focus();
				return;
			}
			
			if(dlvyAddr == null || dlvyAddr.length <1){
				$("input[name='dlvyAddr']").attr("placeholder", "�ּҸ� �Է��ϼ���.");
				$("input[name='dlvyAddr']").focus();
				return;
			}
			
			$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${ purchase.tranNo }").submit();
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

<body bgcolor="#ffffff" text="#000000">
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">���� ���� ����</h3>
	    </div>
	
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<div class="form-group">
			    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			    <div class="col-sm-4">
			    	<p class="form-control-static">${ purchase.buyer.userId }</p>
			    	<input type="hidden" name="buyerId" value="${ purchase.buyer.userId }">
			    </div>
		  	</div>
		  	
			<div class="form-group">
			    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			    <div class="col-sm-4">
			    	<p class="form-control-static">
			    		${ purchase.paymentOption == "001" ? "���ݱ���" : "�ſ뱸��" }
			    	</p>			    
			    </div>
		  	</div>
			
			<div class="form-group">
			    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${ purchase.receiverName }"/>
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ purchase.receiverPhone }"/>
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ purchase.dlvyAddr }"/>
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${ purchase.dlvyRequest }"/>
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