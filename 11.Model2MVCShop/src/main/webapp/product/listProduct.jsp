<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>상품 목록조회</title>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScript 이용
		function fncGetList(currentPage){
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
		}
	
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			 });
		 });
		
		$(function(){
						
			$("td:nth-child(2)").on("click", function(){
				
				var pageLink = ($("input[name='menu']").val() == "manage") ? "/product/updateProduct" : "/product/getProduct" ;	
				console.log($(this).attr("value"));
				
				self.location = pageLink + "?prodNo=" + $(this).attr("value") + "&menu=" + $("input[name='menu']").val();
			});
			
			$("td:nth-child(2)").css("color" , "blue");
			
			$(".ct_list_pop:nth-child(4n+6)").css("background-color" , "whitesmoke");
			
			$("#searchKeyword").autocomplete({
				source: function(request, response){
					$.ajax({
						url : "/product/json/productNameList/" + $("#searchKeyword").val(),
						type : "GET",
						success : function(data){
							response(
								$.map(data, function(item){
									console.log("item : " + item);
									return{
										label : item,
										value : item
										
									};
								})		
							);
						},
						error : function(){
							console.log("error");
						}
						
					});
				},
				minLength : 1,
		        select : function(evt, ui) {
		            console.log("전체 data: " + JSON.stringify(ui));
		            console.log("db Index : " + ui.item.idx);
		            console.log("검색 데이터 : " + ui.item.value);
		        }, 
		        focus : function(evt, ui) {
		            return false;
		        },
		        close : function(evt) {
		        }
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
	       <h3>${ ! empty menu && menu == "manage" ? "상품 관리" : "상품 목록조회" }</h3>
	    </div>
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
					<input type="hidden" name="menu" value="${ menu }" />
					<input type="hidden" name="categoryNo" value="${ categoryNo }" />
					
					<div class="form-group">
				    	<select class="form-control" name="searchCondition" >						
							<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" } >상품명</option>
						</select>
				  	</div>
				  
				  	<div class="form-group">
				    	<label class="sr-only" for="searchKeyword">검색어</label>
				    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  	</div>
				  	
				  	<button type="button" class="btn btn-default">검색</button>
				  
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				
				</form>
			</div>
		</div>
		<!-- table 위쪽 검색 End /////////////////////////////////////-->
		
		<!--  table Start /////////////////////////////////////-->
    	<table class="table table-hover table-striped" >
		
			<thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left" >상품명</th>
	            <th align="left">가격</th>
	            <th align="left">등록일</th>
	            <th align="left">현재상태</th>
	          </tr>
	        </thead>
	        
	        <tbody>
		
			  <c:set var="i" value="0" />
			  <c:forEach var="product" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <td align="center">${ i }</td>
				  <td align="left"  title="Click : 상품정보 확인" value="${ product.prodNo }">${ product.prodName }</td>
				  <td align="left">${ product.price }</td>
				  <td align="left">${ product.regDate }</td>
				  <td align="left">
				  	<c:choose>
						<c:when test="${ product.proTranCode != '001' }">
							판매 완료
						</c:when>
						<c:otherwise>
							판매중
						</c:otherwise>
					</c:choose>
				  </td>
				</tr>
	          </c:forEach>
        
        	</tbody>
		
		</table>		
		<!--  table End /////////////////////////////////////-->
	</div>	
	<!--  화면구성 div End /////////////////////////////////////--> 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>