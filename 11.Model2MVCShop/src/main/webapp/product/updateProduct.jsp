<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>��ǰ��������</title>
	
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
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

	function fncAddProduct(){
		//Form ��ȿ�� ����
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
			
		$("form").attr("method", "post").attr("action", "/product/updateProduct").attr("enctype", "multipart/form-data").submit();
	}
	
	$(function(){
		
		$.getJSON("/product/json/getCategory",
				function(JSONData, status){
					console.log("JSONData : " + Object.keys(JSONData));
					console.log("JSONData[0] : " + JSONData[0].categoryName);
					console.log("JSONData[1] : " + JSONData[1].categoryName);					
					
					$("select[name='productCategory']").empty();
					var selectItem = ${ product.prodCategory.categoryNo };
					console.log(selectItem);
					$.each(JSONData, function(index, value){						
						var option;
						if(JSONData[index].categoryNo == selectItem){
							option = $("<option value='" + JSONData[index].categoryNo + "' selected>" + JSONData[index].categoryName + "</option>");
						}else{
							option = $("<option value='" + JSONData[index].categoryNo + "'>" + JSONData[index].categoryName + "</option>");
						}
						
						$("select[name='productCategory']").append(option);
					});
					
				}
		);
		
		$("select[name='productCategory']").change(function(){
			console.log("selected : " + $(this).val());	
		});
		
		$("button.btn.btn-primary:contains('����')").on("click", function(){
			fncAddProduct();
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
	       <h3 class=" text-info">�� ǰ �� ��</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<input type="hidden" name="prodNo" value="${ product.prodNo }"/>
			
			<div class="form-group">
			    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodName" name="prodName" value="${ product.prodName }" />
			       <span id="helpBlock" class="help-block">
			      	<strong class="text-danger"></strong>
			      </span>
			    </div>
		  	</div>
		
			<div class="form-group">
			    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ ������</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${ product.prodDetail }" />
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			    <div class="col-sm-4">
			      <input type="date" class="form-control" id="manuDate" name="manuDate" />
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="price" name="price" value="${ product.price }" />
			    </div>
		  	</div>
		  	
		  	<div class="form-group">
			    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
			    <div class="col-sm-4">
	    			<input type="file" id="file" name="file" value="${ product.fileName }" />
	    		</div>
			</div>
		 
			<div class="form-group">
			    <label for="productCategory" class="col-sm-offset-1 col-sm-3 control-label">ī�װ�</label>
			    <div class="col-sm-4">
			      <select class="form-control" id="productCategory" name="productCategory">
			      </select>
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