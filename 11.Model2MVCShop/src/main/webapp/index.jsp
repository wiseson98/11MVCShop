<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
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
			
			$("select[name='productCategory']").change(function(){
				console.log("selected : " + $(this).val());	
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('전체상품')").on("click" , function() {
				self.location = "/product/listProduct?menu=search"
			});
		});
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
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
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="col-sm-3 col-md-2 sidebar">
        
        	<ul id="category" class="nav nav-pills nav-stacked">
	            <li><a href="#">전체상품</a></li>
         	</ul>
        	
        </div>
		<!--  Main start /////////////////////////////////////-->   		
 	 	<div class="col-md-9">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		      </ol>
		      <div class="carousel-inner" role="listbox">
		        <div class="item active">
		          <img class="first-slide" src="images/img1.jpg" alt="First slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>Hawaii</h1>
		              <p>state in the Western United States, located in the Pacific Ocean about 2,000 miles from the U.S. mainland.</p>
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="second-slide" src="images/img2.jpg" alt="Second slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>Italy venezia</h1>
		              <p>country consisting of a peninsula delimited by the Alps and several islands surrounding it</p>		              
		            </div>
		          </div>
		        </div>
		        <div class="item">
		          <img class="third-slide" src="images/img3.jpg" alt="Third slide">
		          <div class="container">
		            <div class="carousel-caption">
		              <h1>Singapore</h1>
		              <p>officially the Republic of Singapore, is a sovereign island city-state in maritime Southeast Asia.</p>		              
		            </div>
		          </div>
		        </div>
		      </div>
		      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>
        </div>
	   	 <!--  Main end /////////////////////////////////////-->   		
	 	 			
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>