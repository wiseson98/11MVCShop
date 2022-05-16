<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
			
		 	//=============  개인정보조회회 Event  처리 =============	
		 	$( "a:contains('개인정보조회')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		 	
		 });
		
		//============= 판매상품관리 Event  처리 =============	
		$(function(){
			
			$("a:contains('판매상품등록')").on("click" , function() {
				self.location = "/product/addProduct";
			});
			
			$("a:contains('판매상품관리')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage";
			});
			
			$("a:contains('판매내역관리')").on("click" , function() {
				self.location = "/purchase/listSale";
			});
			
			$("a:contains('배송조회')").on("click" , function() {
				self.location = "/purchase/deliveryTracking";
			});
			
		});
		
		//============= 상품구매 Event  처리 =============	
		$(function(){
			
			$("a:contains('전체상품')").on("click" , function() {
				self.location = "/product/listProduct?menu=search";
			});
			
			$("a:contains('구매이력조회')").on("click" , function() {
				self.location = "/purchase/listPurchase";
			});
			
		});
		
		$(function(){
			
			$.getJSON("/product/json/getCategory",
						function(JSONData, status){
							console.log("JSONData : " + Object.keys(JSONData));
							console.log("JSONData[0] : " + JSONData[0].categoryName);
							console.log("JSONData[1] : " + JSONData[1].categoryName);					
							
							//$("select[name='productCategory']").empty();
							$.each(JSONData, function(index, value){				
								var category = $("<li><a href='/product/listProduct?categoryNo=" +  JSONData[index].categoryNo + "'>" + JSONData[index].categoryName + "</a></li>");								
								$("#category").append(category);
							});
							
						}
			);
			
		});
		
</script> 
	
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="../index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <c:if test="${sessionScope.user.role == 'admin'}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     
		                     <ul class="dropdown-menu">		                                              
		                         <li><a href="#">회원정보조회</a></li>
		                     </ul>
	                     
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매 관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li><a href="#">판매상품관리</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">판매내역관리</a></li>
		                         <li><a href="#">배송조회</a></li>
		                     </ul>
		                </li>
	              </c:if> 
	              
	              <c:if test="${sessionScope.user.role == 'user'}">
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                         <span >상품구매</span>
                         <span class="caret"></span>
                     </a>
                     <ul class="dropdown-menu" id="category">
                         <li><a href="#">전체상품</a></li>
                         <li class="divider"></li>
                     </ul>
	              </li>
	              </c:if>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${sessionScope.user.role == 'user'}">
	             		
	             		<li class="dropdown">
	             			<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	                         	<span class="caret"></span>
                     		</a>
		                    <ul class="dropdown-menu">
		                         <li><a href="#">개인정보조회</a></li>
		                         <li><a href="#">구매이력조회</a></li>		                         
		                    </ul>
		                    
	             	</c:if>
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	 