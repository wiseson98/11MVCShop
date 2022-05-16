<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<title>상품상세조회</title>
	
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

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">		
		
		
	
		$(function(){
			
			$("button:contains('구매')").on("click", function(){
				self.location = "/purchase/addPurchase?prodNo=${ product.prodNo }";
			});
			
			$("button:contains('이전')").on("click", function(){
				history.go(-1);
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
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo }</div>
		</div>
		
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodName }</div>
		</div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${ product.manuDate }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${ product.price }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
					<c:when test="${ ! empty fileNames }">
						<c:forEach var="fileName" items="${ fileNames }">
							<img class="img-circle" src = "/images/uploadFiles/${ fileName }" width="30%" height="16%"/>	
						</c:forEach>	
					</c:when>
					<c:otherwise>
						<img src = "/images/uploadFiles/../empty.GIF"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${ product.regDate }</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-primary">이전</button>
	  			<a id="create-kakao-link-btn" href="javascript:;">
				  <img
				    src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
				    alt="카카오링크 보내기 버튼"
				    width="37px"
				  />
				</a>
	  		</div>
		</div>
		
	</div>
	<script type="text/javascript">
		Kakao.init('9e7bfe9bda76f4fc82c74df2aa9c4c98');
		Kakao.isInitialized();
		console.log(Kakao.isInitialized());
		
		Kakao.Link.createDefaultButton({
		    container: '#create-kakao-link-btn',
		    objectType: 'commerce',
		    content: {
		      title: 'Fait Main',
		      imageUrl:
		        'http://k.kakaocdn.net/dn/dScJiJ/btqB3cwK1Hi/pv5qHVwetz5RZfPZR3C5K1/kakaolink40_original.png',
		      link: {
		        mobileWebUrl: 'http://192.168.0.90:8080/product/getProduct?prodNo=${ product.prodNo }',
		        webUrl: 'http://192.168.0.90:8080/product/getProduct?prodNo=${ product.prodNo }',
		      },
		    },
		    commerce: {
		      productName: '${ product.prodName }',
		      regularPrice: ${ product.price },
		      discountRate: 0,
		      discountPrice: ${ product.price }
		    },
		    buttons: [
		      {
		        title: '구매하기',
		        link: {
		          mobileWebUrl: 'http://192.168.0.90:8080/product/getProduct?prodNo=${ product.prodNo }',
		          webUrl: 'http://192.168.0.90:8080/product/getProduct?prodNo=${ product.prodNo }',
		        },
		      },
		      {
		        title: '공유하기',
		        link: {
		          mobileWebUrl: 'https://developers.kakao.com',
		          webUrl: 'https://developers.kakao.com',
		        },
		      },
		    ],
		})
	</script>
</body>
</html>