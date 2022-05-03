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
		</form>
	
	</div>





<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail"  value="${ product.prodDetail }" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="${ product.manuDate }" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" value="${ product.price }"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	type="file" name="file" class="ct_input_g" 
						style="width: 200px; height: 19px" maxLength="13" value="${ product.fileName }"/>
																		<!-- value="../../images/empty.GIF" -->
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			ī�װ� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<select name="productCategory"		class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
					<!--  <a href="javascript:fncAddProduct();">����</a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!--  <a href="javascript:history.go(-1)">���</a> -->
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>