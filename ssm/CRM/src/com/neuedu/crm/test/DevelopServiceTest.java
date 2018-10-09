package com.neuedu.crm.test;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.crm.bean.Develop;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.service.IDevelopService;
import com.neuedu.crm.service.impl.DevelopServiceImpl;

public class DevelopServiceTest {

	ApplicationContext context;
	IDevelopService developService;
	Logger logger = Logger.getLogger(TestSaleService.class);
	
	@Before
	public void init() {
		String config = "applicationContext.xml";
		context = new ClassPathXmlApplicationContext(config);
		developService =  context.getBean(DevelopServiceImpl.class);
	}
	
	@Test
	public void findAll(){
		List<Develop> list = developService.findAll();
		for (Develop develop : list) {
			System.out.println(develop.toString());
		}
	}
	
	@Test
	public void findById(){
		Develop develop = developService.findById(1);
		System.out.println(develop.toString());
	}
	
	@Test
	public void findBySaleId(){
		Sale sale = new Sale();
		sale.setSaleId(1);
		Develop develop = new Develop();
		develop.setSale(sale);
		List<Develop> develops = developService.findBySaleId(develop);
		for (Develop develop2 : develops) {
			System.out.println(develop2.toString());
		}
	}
	
	@Test
	public void insert(){
		Sale sale = new Sale();
		sale.setSaleId(1);
		Develop develop = new Develop();
		develop.setContent("询问客户需要");
		develop.setSale(sale);
		develop.setStartDate(new Date());
		int result = developService.addDevelop(develop);
		if (result == 1) {
			System.out.println("success add");
		}
	}
	
	@Test
	public void deleteById() {
		int result = developService.deleteById(3);
		if (result == 1) {
			System.out.println("delete success");
		}
	}
	
	@Test
	public void edit() {
		Develop develop = new Develop();
		develop.setDevelopId(4);
		develop.setContent("xxxxxx");
		develop.setStartDate(new Date());
		develop.setEndDate(new Date());
		develop.setResult("客户确认购买产品");
		int result = developService.editDevelop(develop);
		if (result == 1) {
			System.out.println("success edit");
		}
	}
	
	@Test
	public void editResult() {
		Sale sale = new Sale();
		sale.setState(-1);
		sale.setSaleId(54);
		int result = developService.editResult(sale);
		if (result == 1) {
			System.out.println("success edit result");
		}
	}
	
	
}
