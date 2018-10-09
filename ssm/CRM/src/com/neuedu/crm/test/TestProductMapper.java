package com.neuedu.crm.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;

import com.neuedu.crm.mapper.ProductMapper;
import com.neuedu.crm.bean.Product;

public class TestProductMapper {
	
	private ProductMapper productMapper;
	private SqlSession session;
	
	@Before
	public void init() {
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();

			productMapper = session.getMapper(ProductMapper.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@org.junit.Test
	public void testFindAll() {
		List<Product> products= productMapper.findAll();
		for (Product product : products) {
			System.out.println(product.toString());
		}
	}
	
	@After // 在Test执行完之后，回收资源等
	public void destroy() {
		if(session != null) {
			session.commit();
			session.close();
		}
	}

}
