package com.model2.mvc.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Category;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Resource(name="uploadPath")
	String uploadPath;
		
	/// Constructor
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
		   
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct() throws Exception{
		
		System.out.println("/product/addProduct : GET");		
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("productCategory") int categoryNo, MultipartFile file) throws Exception{
		
		System.out.println("/product/addProduct : POST ");
		
		System.out.println("productCategory : " + categoryNo);
		
		if(!file.isEmpty()) {
			System.out.println("file exist");
			
			String savedName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath, savedName));
					
			product.setFileName(savedName);
		}		
		
		product.setProdCategory(new Category());
		product.getProdCategory().setCategoryNo(categoryNo);
		
		productService.addProduct(product);
				
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value = "/getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("/getProduct");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		String cookieValue = null;
		Cookie cookie = null;
		
		cookieValue = Integer.toString(prodNo);
		
		if(request.getCookies() != null) {
			for(Cookie c : request.getCookies()) {
				if(c.getName().equals("history")) {
					cookieValue = URLDecoder.decode(c.getValue(), "euc-kr");
					cookieValue += "," + prodNo;
					System.out.println("CookieValue(history ����): " + cookieValue);
				}
			}
		}
		System.out.println("CookieValue: " + cookieValue);
		cookie = new Cookie("history", URLEncoder.encode(cookieValue, "euc-kr"));
		response.addCookie(cookie);
		
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value = "/listProduct")
	public String listProduct(@ModelAttribute("search") Search search, @RequestParam(value = "menu", defaultValue = "search") String menu, 
							  @RequestParam(value = "categoryNo", defaultValue = "0") int categoryNo, Model model) throws Exception{
		
		System.out.println("/listProduct");
		
		System.out.println("categoryNo : " + categoryNo);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);		
		
		search.setCategory(new Category(categoryNo));
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		model.addAttribute("categoryNo", categoryNo);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception{
		
		System.out.println("/updateProductView");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		System.out.println("product : " + product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, @RequestParam("productCategory") int categoryNo, MultipartFile file ) throws Exception{
		
		System.out.println("/updateProduct");
		
		if(!file.isEmpty()) {
			String savedName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			
			FileCopyUtils.copy(file.getBytes(), new File(uploadPath, savedName));
					
			product.setFileName(savedName);
		}
		
		product.setProdCategory(new Category());
		product.getProdCategory().setCategoryNo(categoryNo);
		
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo=" + product.getProdNo();
	}	

}//end of class
