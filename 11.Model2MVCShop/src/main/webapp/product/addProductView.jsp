<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
	<title>상품등록</title>

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
	
		function fncAddProduct(){
			//Form 유효성 검증 	
			var name = $("input[name='prodName']").val();
			var detail = $("input[name='prodDetail']").val();
			var manuDate = $("input[name='manuDate']").val();
			var price = $("input[name='price']").val();
		
			if(name == null || name.length<1){
				$("input[name='prodName']").attr("placeholder", "상품명을 입력하세요.");
				return;
			}
			if(detail == null || detail.length<1){
				$("input[name='prodDetail']").attr("placeholder", "상품정보를 입력하세요.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				$("input[name='manuDate']").attr("placeholder", "제조일자를 입력하세요.");
				return;
			}
			if(price == null || price.length<1){
				$("input[name='price']").attr("placeholder", "가격을 입력하세요.");
				return;
			}
			//$("form").attr("method" , "POST").attr("action", "/user/addUser").submit();
			$("form").attr("method", "POST").attr("action", "/product/addProduct").attr("enctype", "multipart/form-data").submit();
		}
	
		$(function(){
			
			$.getJSON("/product/json/getCategory",
						function(JSONData, status){
							console.log("JSONData : " + Object.keys(JSONData));
							console.log("JSONData[0] : " + JSONData[0].categoryName);
							console.log("JSONData[1] : " + JSONData[1].categoryName);					
							
							$("select[name='productCategory']").empty();
							$.each(JSONData, function(index, value){						
								var option = $("<option value='" + JSONData[index].categoryNo + "'>" + JSONData[index].categoryName + "</option>");
								$("select[name='productCategory']").append(option);
							});
							
						}
			);
			
			$("select[name='productCategory']").change(function(){
				console.log("selected : " + $(this).val());	
			});
		});
	
		//============= "가입"  Event 연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddProduct();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
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
	
		<div class="page-header">
	       <h3 class=" text-info">상 품 등 록</h3>
	    </div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
			<div class="form-group">
			    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodName" name="prodName" />
			       <span id="helpBlock" class="help-block">
			      	<strong class="text-danger"></strong>
			      </span>
			    </div>
		  	</div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품 상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDate" name="manuDate" />
		      <!-- 
		      <input type="text" name="manuDate" readonly="readonly" class="ct_input_g"  
						style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
				&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
			 -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" />
		    </div>
		  </div>
						
		 <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
    			<input type="file" id="file" name="file" />
    		</div>
		 </div>
		 
		 <div class="form-group">
		    <label for="productCategory" class="col-sm-offset-1 col-sm-3 control-label">카테고리</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="productCategory" name="productCategory">
		      </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등&nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  
		</form>	
		<!-- form End /////////////////////////////////////-->		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>