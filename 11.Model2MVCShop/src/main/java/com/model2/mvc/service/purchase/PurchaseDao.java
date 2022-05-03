package com.model2.mvc.service.purchase;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	
	// INSERT
	public void addPurchase(Purchase purchase) throws Exception;
	
	// SELECT ONE
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// SELECT LIST - purchase
	public List<Purchase> getPurchaseList(Search search) throws Exception;

	// SELECT LIST - sale
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	// UPDATE
	public void updatePurchase(Purchase purchase) throws Exception;	
	
	// UPDATE - trancode
	public void updateTranCode(Purchase purchase) throws Exception;		
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}