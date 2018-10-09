package com.neuedu.crm.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.CustAverage;
import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.service.ICustAverageService;
import com.neuedu.crm.service.ICustomerService;
import com.neuedu.crm.service.ISaleService;

@Controller
@RequestMapping("/echarts")
public class EchartsController {
	@Autowired
	private ICustomerService customerServiceImpl;
	
	@Autowired
	private ICustAverageService custAverageServiceImpl;
	
	@Autowired
	private ISaleService saleService;
	private Logger logger = Logger.getRootLogger();
	
	@RequestMapping("/CountCusCagtegory")
	@ResponseBody
	public String CountCusCategory() {
		List<Customer> listCustomer = customerServiceImpl.findAll();
		
		Map<String, Integer> category = new HashMap();
		/**
		 * 1.循环遍历所有顾客
		 * 2.查看map中是否有该分类
		 * 3.如有有，就把num取出来加1
		 * 4.如果没有，就直接加入 
		 */
		for (Customer customer : listCustomer) {
			logger.info(customer);
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
		//{list:[{},{}]}
		String string="";
		List<String> list = new ArrayList<>();
		for(Map.Entry<String,Integer> entry : category.entrySet()) {
			string+="{\"name\": \""+entry.getKey()+"\",\"value\": \""+entry.getValue()+"\"},";
			
		}
		string = string.substring(0,string.length()-1);
		return string;
		
	}
	
	@RequestMapping("/CustAverage")
	@ResponseBody
	public String CustAverage(CustAverage custAverage) {
		List<CustAverage> list = custAverageServiceImpl.findCustAverage(custAverage);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/CustOrder")
	@ResponseBody
	public String CustOrder(CustAverage custAverage) {
		List<CustAverage> list = custAverageServiceImpl.findCustOder(custAverage);
		return new Gson().toJson(list); 
	}
	
	@RequestMapping("/CountSaleSource")
	@ResponseBody
	public String CountSaleSource() {
		List<SaleVo> listSaleVo = saleService.findAll();	
				if(listSaleVo == null) {
				logger.info("xxxxxxxxxxxxxxxx");
				}
		Map<String, Integer> category = new HashMap();
		/**
		 * 1.循环遍历所有顾客
		 * 2.查看map中是否有该分类
		 * 3.如有有，就把num取出来加1
		 * 4.如果没有，就直接加入 
		 */
		for (SaleVo saleVo : listSaleVo) {
			String key = saleVo.getSource();
			Integer num = 1;
			//System.out.println(key);
			if(category.containsKey(key)) {
				num = category.get(key) +1;
				category.replace(key, num);
			}else {
				category.put(key, num);
			}
		}
		//{list:[{},{}]}
		String string="";
		List<String> list = new ArrayList<>();
		for(Map.Entry<String,Integer> entry : category.entrySet()) {
			string+="{\"name\": \""+entry.getKey()+"\",\"value\": \""+entry.getValue()+"\"},";
			
		}
		string = string.substring(0,string.length()-1);
		return string;
		
	}
	
	/**
	 * 查询产品销量
	 * @return
	 */
	@RequestMapping("/findProductSale")
	@ResponseBody
	public String findProductSale() {
		return new Gson().toJson(custAverageServiceImpl.findProductSale());
	}
	
}
