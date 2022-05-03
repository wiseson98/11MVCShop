package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Category;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	// ��ǰ���
	public void addProduct(Product product) throws Exception;
	
	// ��ǰȮ��
	public Product getProduct(int prodNo) throws Exception;
	
	// ��ǰ��������Ʈ
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	// ��ǰ��������
	public void updateProduct(Product product) throws Exception;
	
	// autocomplete
	public List<String> getProductNameList(String keyword) throws Exception;
	
	// category�� ��ȸ
	public List<Category> getCategory() throws Exception;
}