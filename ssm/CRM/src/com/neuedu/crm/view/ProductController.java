package com.neuedu.crm.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.crm.bean.Product;
import com.neuedu.crm.service.IProductService;

/**
 * 
 * @author WYY
 *
 */

@Controller
@RequestMapping("/products")
public class ProductController {
	private Logger logger = Logger.getRootLogger();

	@Autowired
	private IProductService productService;

	@RequestMapping("/list")
	public String listProduct(Model model) {

		List<Product> list = productService.findAll();

		model.addAttribute("list", list); // 类似 于request.setAttribute();

		for (Product product : list) {
			logger.info(product.toString());
		}

		return "productlist"; // 返回值是页面的名称
	}
	

	@RequestMapping("/add")
	public String addProduct(HttpServletRequest request, Model model,Product product) {
		
		int ret = productService.addProduct(product);
		if (ret != 0)
			return "redirect:/products/list.action";
		else
			return "redirect:/products/add.action";
	}
	
	@RequestMapping("/edit")
	public String editProduct(Product product) {
		int ret = productService.editProduct(product);

		if (ret != 0) {
			// 更新成功
			return "forward:/products/list.action";
		} else {
			// 更新失败
			return "forward:/products/edit.action";
		}
	}
}
