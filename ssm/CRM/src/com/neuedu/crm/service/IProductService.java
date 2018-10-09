package com.neuedu.crm.service;

import java.util.List;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Product;

public interface IProductService {
	public List<Product> findAll();

	public Product findById(Integer productId);

	public int editProduct(Product product);

	public int addProduct(Product product);

	public int deleteById(Integer productId);
	
	public List<Product> findByPager(Pager pager);

	public int countForPager(Pager pager);
}
