<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Ǹ� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "POST").attr("action", "/purchase/listSale").submit();
	}
	
	$(function(){
		
		$(".ct_list_pop td:nth-child(3)").click(function(){
			// /purchase/getPurchase?tranNo=${ purchase.tranNo }			
			console.log("�ǸŹ�ȣ Ŭ�� : " + $(this).text().trim());
			self.location = "/purchase/getPurchase?tranNo=" + $(this).text().trim();
		});
				
		$(".ct_list_pop td:nth-child(5)").click(function(){
			// /product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }			
			console.log("��ǰ��ȣ Ŭ�� : " + $(this).text().trim());
			self.location = "/product/getProduct?prodNo=" + $(this).text().trim();
		});
		
		$(".ct_list_pop td:nth-child(11) span").click(function(){
			// /purchase/updateTranCode?tranNo=${ purchase.tranNo }&tranCode=003&menu=manage			
			console.log("����ϱ� Ŭ�� : " + $(this).attr("value"));
			self.location = "/purchase/updateTranCode?tranNo=" + $(this).attr("value") + "&tranCode=003&menu=manage";
		});
		
		$(".ct_list_pop td:nth-child(3)").css("color", "#d31579");
		$(".ct_list_pop td:nth-child(5)").css("color", "#d31566");
		
		$(".ct_list_pop td:nth-child(11) span").css({
			"margin-left" : "50px",
			"font-weight" : "bold"
		});
	});
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="30">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">�ǸŹ�ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���� ��¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��� ����</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase"  items="${ list }">
		<c:set var="i" value="${ i+1 }" />	
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="center">
				<!-- <a href="/purchase/getPurchase?tranNo=${ purchase.tranNo }">${ i }</a>  -->
				${ purchase.tranNo }
			</td>
			<td></td>
			<td align="center">
			<!-- <a href="/product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }">${ purchase.purchaseProd.prodNo }</a> -->
				${ purchase.purchaseProd.prodNo }
			</td>
			<td></td>
			<td align="center">${ purchase.buyer.userId }</td>
			<td></td>
			<td align="center">${ purchase.orderDate }</td>
			<td></td>
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
			<td></td>
			<!-- 
			<td align="left">
				<c:if test="${ purchase.tranCode == '002' }">
					<a href="/purchase/updateTranCode?tranNo=${ purchase.tranNo }&tranCode=003&menu=manage">����ϱ�</a>
					����ϱ�
				</c:if>
			</td>
			 -->
		</tr>	
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>		
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp" />			
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>