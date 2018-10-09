package com.neuedu.crm.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.Develop;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.IDevelopService;
import com.neuedu.crm.service.ISaleService;

@Controller
@RequestMapping("/sale")
public class SaleController {
	
	@Autowired
	ISaleService saleService;
	@Autowired
	IDevelopService developService;
	@Autowired
	HttpServletRequest request;
	
	Logger logger = Logger.getLogger(SaleController.class);
	

	/**
	 * 查询全部销售机会信息
	 * @return
	 */
	@RequestMapping(value="/allList",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findAll() {
		
		List<SaleVo> salelist = saleService.findAll();	
		String result = new Gson().toJson(salelist);
		logger.info("---------------------------");
		return result;
	}
	
	/**
	 * 分页查询--客户开发计划的个人负责机会
	 */
	@RequestMapping(value="/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findAllByPager(Pager<SaleVo> pager,SaleVo saleVo){
		logger.info(pager.getCurrentPage());
		logger.info(pager.getPageSize());
		logger.info(saleVo.toString());
		pager.setParam(saleVo);
		int total = saleService.countForPagerWithCond(pager);
		pager.setTotal(total);
		List<SaleVo> saleVos = saleService.findByPagerWithCondAssign(pager);
		for (SaleVo saleVo2 : saleVos) {
			System.out.println(saleVo2);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pager.getTotal());
		map.put("data", saleVos);	
		return map;
	}
	
	/**
	 * 分页查询
	 */
	@RequestMapping(value="/list2",produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> findAllByPager2(Pager<SaleVo> pager,SaleVo saleVo){
		logger.info(pager.getCurrentPage());
		logger.info(pager.getPageSize());
		logger.info(saleVo.toString());
		pager.setParam(saleVo);
		int total = saleService.countForPagerWithCond(pager);
		pager.setTotal(total);
		List<SaleVo> saleVos = saleService.findByPagerWithCond(pager);
		for (SaleVo saleVo2 : saleVos) {
			System.out.println(saleVo2);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pager.getTotal());
		map.put("data", saleVos);		
		return map;
	}
	
	/**
	 * 查询所有客户经理(user用户表的客户经理)
	 */
	@RequestMapping(value="/cmanagers",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findAllCustomerManager() {
		
		List<User> users = saleService.findAllCustomerManager();
		return new Gson().toJson(users);
	}
	
	
	/**
	 * 新增销售机会信息
	 */
	@RequestMapping(value="/doadd",produces="application/json;charset=utf-8")
	@ResponseBody
	public String addSale(Sale sale){
		
		logger.info(sale.toString());
		sale.setStatus(0);	//新建销售机会统一设置指派状态为0（未指派状态）
		int result = saleService.addSale(sale);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result == 1) {
			map.put("code", 0);
		}else {
			map.put("code", 1);
		}
		return new Gson().toJson(map);
	}
	
	/**
	 * 删除销售机会信息
	 */
	@RequestMapping(value="/dodel",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteSale(Sale sale,HttpServletRequest request){
		
		logger.info(sale);
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			result = saleService.deleteSaleByExample(sale);
		} catch (Exception e) {
			logger.info("存在外键约束！");
			map.put("msg", "该数据存在关联值，不可删除");
		}
		
		if (result == 1) {
			map.put("code", 0);
		}else {
			map.put("code", 1);
		}
		return new Gson().toJson(map);
	}
	
	/**
	 * 批量删除销售机会信息
	 */
	@RequestMapping(value="/dodels",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteSales(@RequestParam(value="saleIds") int[] saleIds){
		
		logger.info(saleIds);
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			result = saleService.deleteByIdList(saleIds);
		} catch (Exception e) {
			logger.info("存在外键约束！");
			result = -99;			
		}
		
		if (result == saleIds.length) {
			map.put("code", 0);
		}else if(result == -99){
			map.put("code", 1);
			map.put("msg", "无法删除已有开发计划的机会");
		}else {
			map.put("code", 1);
			map.put("msg", "未知错误,请重试");
		}
		return new Gson().toJson(map);
	}
	
	/**
	 * 验证当前登录用户并查找他的角色
	 */
	@RequestMapping(value="/getRole",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findRole(int userId) {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		logger.info(user.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		if (userId == user.getId()) {
			int role = saleService.findRoleById(userId);
			System.out.println("------------\n"+role);
			if (role != 2) {
				map.put("code", 1);
				map.put("msg", "权限不足");
			}else {
				map.put("code", 0);
			}
		}else {
			map.put("code", 2);
			map.put("msg", "当前登录异常，请重新登录");
		}
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 根据id查找销售机会
	 */
	@RequestMapping(value="/getSale",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getSale(int saleId) {
		
		logger.info(saleId);
		SaleVo saleVo = saleService.findById(saleId);
		logger.info(saleVo.toString());
		return new Gson().toJson(saleVo);
	}
	
	
	/**
	 * 编辑销售与机会
	 */
	@RequestMapping(value="/edit",produces="application/json;charset=utf-8")
	@ResponseBody
	public String editSale(Sale sale,HttpServletRequest request) {
		
		logger.info(sale.toString());
		int result = saleService.modifyByExample(sale);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result == 1) {
			map.put("code", 0);
		}else {
			map.put("code", 1);
		}
		return new Gson().toJson(map);
	}
	
	/**
	 * 查找销售机会状态
	 */
	@RequestMapping(value="/getStatus",produces="application/json;charset=utf-8")
	@ResponseBody
	public int getStatus(int saleId) {
		
		SaleVo saleVo = saleService.findById(saleId);
		if (saleVo.getStatus() == 1) {
			return 1;
		}else {
			return -1;
		}
		
	}
	
	/**
	 * 指派负责人
	 */
	@RequestMapping(value="/doDeal",produces="application/json;charset=utf-8")
	@ResponseBody
	public String customerDeal(Sale sale){
		
		logger.info(sale.toString());
		int result = saleService.changeDealUser(sale);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result == 1) {
			map.put("code", 0);
		}else {
			map.put("code", 1);
		}
		return new Gson().toJson(map);
	}
	
	/**
	 * 查找某个销售机会的客户开发计划
	 */
	@RequestMapping(value="/getDevelop",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getDevelopBySaleId(Develop develop){
		
		logger.info(develop.toString());
		List<Develop> list = developService.findBySaleId(develop);
		for (Develop develop2 : list) {
			logger.info(develop2.toString());
		}
		return new Gson().toJson(list);
	}
	
	/**
	 * 新建客户开发计划
	 * @param develop
	 * @return
	 */
	@RequestMapping(value="/adddevelop",produces="application/json;charset=utf-8")
	@ResponseBody
	public String addDevelop(Develop develop){
		
		logger.info(develop.toString());
		int result = developService.addDevelop(develop);
		if (result == 1) {
			return "1";
		}
		return "0";
	}
	
	/**
	 * 编辑客户开发计划
	 */
	@RequestMapping(value="/editdevelop",produces="application/json;charset=utf-8")
	@ResponseBody
	public String editDevelop(Develop develop) {
		
		logger.info(develop.toString());
		int result = developService.editDevelop(develop);
		if (result == 1) {
			return "1";
		}
		return "0";
	}
	
	/**
	 * 删除客户开发计划
	 */
	@RequestMapping(value="/deletedevelop",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteDevelop(int developId) {
		
		logger.info(developId);
		int result = developService.deleteById(developId);
		if (result == 1) {
			return "1";
		}
		return "0";
	}
	
	/**
	 * 客户开发成功
	 */
	@RequestMapping(value="/successdevelop",produces="application/json;charset=utf-8")
	@ResponseBody
	public String successDevelop(Sale sale) {
		
		logger.info(sale.toString());
		int result = developService.editResult(sale);
		if (result == 1) {
			return "1";
		}
		return "0";
	}

	
	
	
	
	
}
