package com.neuedu.crm.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Service;
import com.neuedu.crm.bean.ServiceVo;
import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.service.ICustomerService;
import com.neuedu.crm.service.IListAuthorityService;
import com.neuedu.crm.service.IServiceService;
import com.neuedu.crm.service.IServiceVoService;
import com.neuedu.crm.service.IWordBookService;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	private IServiceService serviceService;
	
	@Autowired
	private IWordBookService wordBookService;
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IServiceVoService serviceVoService;
	
	@Autowired
	private IListAuthorityService listAuthorityService;
	
	private Logger logger = Logger.getRootLogger();
	
	//service和java本身的类相同
	@RequestMapping("/doinsert")
	@RequiresPermissions("service:insert")
	@ResponseBody
	public String insert(com.neuedu.crm.bean.Service service) {
		logger.info("service to string :" +service);
		serviceService.addService(service);
		return "{'code':'0'}";
	}
	/**
	 * 获取增加页面的服务类型
	 * @param model
	 * @param category
	 * @return
	 */
	@RequestMapping("/wordbook")
	@ResponseBody
	public String findcategory(Model model,Integer category) {
		//获取服务分类
		List<WordBook> listCategory = 
				wordBookService.findWordBookByCategory(category);
		String json = new Gson().toJson(listCategory);
		return json;
	}
	/**
	 * 获取增加页面的用户选项
	 * @return
	 */
	@RequestMapping("/customer")
	@ResponseBody
	public String findcustomer() {
		List<Customer> listCustomer = customerService.findAll();
		String json = new Gson().toJson(listCustomer);
		return json;
	}
	/**
	 * 获取指派人，即客户经理列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/customerDeal")
	public String findCustomerDeal() {
		List<ListAuthority> list = listAuthorityService.findAllCustomerDeal();
		String json = new Gson().toJson(list);
		return json;
	}
	
	/**
	 * 表格加载
	 * @param model
	 * @param serviceVo
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/listServiceVo")
	@ResponseBody
	public String findByPager(Model model,ServiceVo serviceVo,Integer pageNo,Integer pageSize,String sort) {
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 1;
		}
		logger.info("pageNo:"+pageNo+",pageSize:"+pageSize);
		//分页的页码和大小
		Pager<ServiceVo> pager = new Pager<ServiceVo>(pageNo, pageSize);
		if(serviceVo.getSummary() != null)
		
		//设置页面的example
		pager.setParam(serviceVo);
		pager.setSort(sort);
		//查询全部，value=-1,设置为空
		if(serviceVo.getServicecategoryId() == -1) {
			serviceVo.setServicecategoryId(null);
		}
		if(serviceVo.getStatusId() == -1) {
			serviceVo.setStatusId(null);
		}
		if(serviceVo.getServiceStyleId() == -1) {
			serviceVo.setServiceStyleId(null);
		}
		
		//获取sql语句的总数
		Integer total = serviceVoService.countForPager(pager);
		
		pager.setTotal(total);
		
		//执行查询
		List<ServiceVo> list = serviceVoService.findPagerByExample(pager);
		
		model.addAttribute("pager", pager);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 删除服务，传进来一个id
	 * @param service
	 * @return
	 */
	@RequestMapping("/delService")
	@RequiresPermissions("service:delete")
	@ResponseBody
	public String delService(com.neuedu.crm.bean.Service service,HttpServletRequest request) {
		serviceService.deleteById(service.getServiceId());
		return "{'msg':'1'}";
	}
	/**
	 * 编辑服务，传进来一个服务类
	 * @param service
	 * @return
	 */
	@RequestMapping("/editService")
	@RequiresPermissions("service:edit")
	@ResponseBody
	public String editService(com.neuedu.crm.bean.Service service,HttpServletRequest request) {
		
		serviceService.editService(service);
		return "{'code':'0'}";
	}
	/**
	 * 处理服务，传进来服务id，搜索服务传到相应页面
	 */
	@RequestMapping("/dealService")
	public String dealService(Model model,Integer id) {
	 	Service service = serviceService.findById(id);
	 	//logger.info(service.toString());
		model.addAttribute("service", service);
		return "service/dodealService";
	}
	
	/**
	 * 传进来id，查询服务，传到服务归档页面
	 * @return
	 */
	@RequestMapping("/onFileService")
	public String toOnFileService(Model model,Integer id) {
		Service service = serviceService.findById(id); 	
		model.addAttribute("service", service);
		return "service/doOnFileService";
	}
	
	/**
	 * 传进来id，查询服务，传到服务查看页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/seeOnFileService")
	public String seeOnFileService(Model model,Integer id) {
		Service service = serviceService.findById(id); 	
		model.addAttribute("service", service);
		return "service/seeOnFileService";
	}
	
	@RequestMapping("/delMoreService")
	@RequiresPermissions("service:delete")
	@ResponseBody
	public String delIds(HttpServletRequest request,Integer[] delIds) {
		serviceService.deleteByServiceIdList(delIds);
		return "{'msg':'1'}";
	}
}
