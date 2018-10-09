package com.neuedu.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Product;
import com.neuedu.crm.mapper.ProductMapper;
import com.neuedu.crm.service.IProductService;

@Service
@Transactional  //事务管理
public class ProductServiceImpl implements IProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> findAll() {
		
		return productMapper.findAll();
	}

	@Override
	public Product findById(Integer productId) {
		
		return productMapper.findById(productId);
	}

	@Override
	public int editProduct(Product product) {
		
		return productMapper.editProduct(product);
	}

	@Override
	public int addProduct(Product product) {
		
		return productMapper.addProduct(product);
	}

	@Override
	public int deleteById(Integer productId) {
		
		return productMapper.deleteById(productId);
	}

	@Override
	public List<Product> findByPager(Pager pager) {
		
		return productMapper.findByPager(pager);
	}

	@Override
	public int countForPager(Pager pager) {
		
		return productMapper.countForPager(pager);
	}

}
