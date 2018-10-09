package com.neuedu.crm.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.crm.service.IProductService;
import com.neuedu.crm.service.impl.ProductServiceImpl;
import com.neuedu.crm.bean.Product;

public class TestProductService {
	
	private ApplicationContext Context;
	private IProductService productService;
	private Logger logger = Logger.getLogger(TestProductService.class);
	
	@Before
	public void init() {
		String configLocation = "applicationContext.xml";
		Context = new ClassPathXmlApplicationContext(configLocation);
		productService = (IProductService)Context.getBean(ProductServiceImpl.class);
	}
	
	@org.junit.Test
	public void testFindAll() {
		List<Product> products= productService.findAll();
		for (Product product : products) {
			System.out.println(product.toString());
		}
	}
	
	@After // 在Test执行完之后，回收资源等
	public void destroy() {
		
	}
	
}
