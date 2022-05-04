<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>�Ǹ� �����ȸ</title>
	
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
        
        td:nth-child(2) {
        	color: #d31579;
        }
        
        td:nth-child(3) {
        	color: #d31566;
        }
        
        td:nth-child(6) span {
        	padding-left : 25px;
        	font-weight : bold;
        }
    </style>

	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/purchase/listSale").submit();
		}
		
		$(function(){
			
			$("td:nth-child(2)").click(function(){
				// /purchase/getPurchase?tranNo=${ purchase.tranNo }			
				console.log("�ǸŹ�ȣ Ŭ�� : " + $(this).text().trim());
				self.location = "/purchase/getPurchase?tranNo=" + $(this).text().trim();
			});
					
			$("td:nth-child(3)").click(function(){
				// /product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }			
				console.log("��ǰ��ȣ Ŭ�� : " + $(this).text().trim());
				self.location = "/product/getProduct?prodNo=" + $(this).text().trim();
			});
			
			$("td:nth-child(6) span").click(function(){
				// /purchase/updateTranCode?tranNo=${ purchase.tranNo }&tranCode=003&menu=manage			
				console.log("����ϱ� Ŭ�� : " + $(this).attr("value"));
				self.location = "/purchase/updateTranCode?tranNo=" + $(this).attr("value") + "&tranCode=003&menu=manage";
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
	
		<div class="page-header text-info">
	       <h3>�Ǹ� �����ȸ</h3>
	    </div>
	
		<div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">   
				  				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
		    
		</div>
		
		<!--  table Start /////////////////////////////////////-->
    	<table class="table table-hover table-striped" >
    	
    		<thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left" >�ǸŹ�ȣ</th>
	            <th align="left">��ǰ��ȣ</th>
	            <th align="left">������</th>
	            <th align="left">���� ��¥</th>
	            <th align="left">��� ����</th>
	          </tr>
	        </thead>
	        
	        <tbody>
		
			  <c:set var="i" value="0" />
			  <c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <td align="left">${ i }</td>
				  <td align="left"  title="Click : �ǸŹ�ȣ">${ purchase.tranNo }</td>
				  <td align="left" title="Click : ��ǰ��ȣ">${ purchase.purchaseProd.prodNo }</td>
				  <td align="left">${ purchase.buyer.userId }</td>
				  <td align="left">${ purchase.orderDate }</td>
				  <td align="left">
				  	<c:if test="${ purchase.tranCode  == '002' }">
						���ſϷ�
						<span value="${ purchase.tranNo }">����ϱ�</span>					
					</c:if>
					<c:if test="${ purchase.tranCode == '003' }">
						�����					
					</c:if>
					<c:if test="${ purchase.tranCode  ==  '004' }">
						��ۿϷ�
					</c:if>
				  </td>
				  
				</tr>
	          </c:forEach>
        
        	</tbody>
	        
	   	</table>
	</div>
		
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>