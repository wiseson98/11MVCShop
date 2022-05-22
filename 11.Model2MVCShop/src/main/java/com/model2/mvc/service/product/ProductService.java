package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Category;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	// 상품등록
	public void addProduct(Product product) throws Exception;
	
	// 상품확인
	public Product getProduct(int prodNo) throws Exception;
	
	// 상품정보리스트
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	// 상품정보수정
	public void updateProduct(Product product) throws Exception;
	
	// autocomplete
	public List<String> getProductNameList(String keyword) throws Exception;
	
	// category명 조회
	public List<Category> getCategory() throws Exception;
	
	// summernote
	public void addSummer(String content) throws Exception;
	
	// summernote get
	public String getSummer(int boardNo) throws Exception;
}