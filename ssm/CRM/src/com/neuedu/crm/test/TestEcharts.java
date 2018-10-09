package com.neuedu.crm.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.service.ICustomerService;
import com.neuedu.crm.service.impl.CustomerServiceImpl;
import com.neuedu.crm.service.impl.ListAuthorityImpl;
import com.neuedu.crm.service.impl.LogServiceImpl;
import com.neuedu.crm.service.impl.ServiceVoServiceImpl;

public class TestEcharts {
	private ApplicationContext Context;
	private ICustomerService customerServiceImpl;
	
	@Before
	public void init() {
		String location="applicationContext.xml";
		Context = new ClassPathXmlApplicationContext(location);
		customerServiceImpl = Context.getBean(CustomerServiceImpl.class);
		
	}
	@Test
	public void CustCategory() {
		List<Customer> listCustomer = customerServiceImpl.findAll();
		Map<String, Integer> category = new HashMap();
		/**
		 * 1.循环遍历所有顾客
		 * 2.查看map中是否有该分类
		 * 3.如有有，就把num取出来加1
		 * 4.如果没有，就直接加入 
		 */
		for (Customer customer : listCustomer) {
			String key = customer.getCustcategoryId().getValue();
			Integer num = 1;
			//System.out.println(key);
			if(category.containsKey(key)) {
				num = category.get(key) +1;
				category.replace(key, num);
			}else {
				category.put(key, num);
			}
		}
		for(Map.Entry<String,Integer> entry : category.entrySet()) {
			System.out.println("Key: "+ entry.getKey()+ " Value: "+entry.getValue());
		}
	}
}
