/**
*  Copyright 2018 shuzai.crm.com, Inc. All rights reserved.
*/

package com.neuedu.crm.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/**
 * <p>Date : 2018/07/19</p>
 * <p>Title: 控制器</p>
 * <p>Description: 客户信息管理模块（增删查改），联系人子模块（增删查改）
 *                 交往记录子模块（增删查改），   历史订单子模块（查），订单详细子模块（查）
 *                 客户流失管理模块（查，改）
 * </p>
 * <p>Copyright: Copyright (c) 2018</p>
 * @author WYY
 * @version 1.0
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.neuedu.crm.bean.Communicate;
import com.neuedu.crm.bean.Contacts;
import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.Loss;
import com.neuedu.crm.bean.Orderitem;
import com.neuedu.crm.bean.Orders;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.service.ICommunicateService;
import com.neuedu.crm.service.IContactsService;
import com.neuedu.crm.service.ICustomerService;
import com.neuedu.crm.service.ILossService;
import com.neuedu.crm.service.IOrderitemService;
import com.neuedu.crm.service.IOrdersService;
import com.neuedu.crm.service.IUserService;
import com.neuedu.crm.service.IWordBookService;
import com.neuedu.crm.utils.LeadingInExcel;

@Controller
@RequestMapping("/customers")
public class CustomerController {
	//日志器
	private Logger logger = Logger.getRootLogger();
	
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IWordBookService wordservice;
	@Autowired
	private IContactsService contactsService;
	@Autowired
	private ICommunicateService communicateService;
	@Autowired
	private IOrdersService ordersService;
	@Autowired
	private IOrderitemService orderitemService;
	@Autowired
	private ILossService lossService;
	
	//1、客户模块
	
	/**
	 * 没有分页功能的查询所有客户
	 * @param model 视图
	 * @return 目标jsp页面
	 */
	@RequestMapping("/list")
	public String listCustomer(Model model) {
		List<Customer> list = customerService.findAll();
		List<User> users = userService.findAll(); // 客户经理
		List<WordBook> custcategoryIds = wordservice.findWordBookByCategory(4); //客户分类
		List<WordBook> creditIds = wordservice.findWordBookByCategory(2); // 信用度
		List<WordBook> custfromIds = wordservice.findWordBookByCategory(3); //客户来源
		List<WordBook> satisfiedIds = wordservice.findWordBookByCategory(1); //满意度
		
		//将视图传到jsp页面，类似于以前的request.setAttribute()
		model.addAttribute("list", list);
		model.addAttribute("users", users);
		model.addAttribute("custcategorys", custcategoryIds);
		model.addAttribute("credits", creditIds);
		model.addAttribute("custfroms", custfromIds);
		model.addAttribute("satisfieds", satisfiedIds);
		for (Customer customer : list) {
			logger.info(customer.toString());
		}
		return "customer/listCustomer";  //返回目标页面
	}
	
	/**
	 * 执行插入数据之前，先去查出所有需要到页面提供显示的信息
	 * @return view
	 */
	@RequestMapping("/add")
	public ModelAndView addCustomer() {
		// 查询客户经理，客户来源，信用度，满意度，客户等级等信息，并传递到页面显示
		List<User> users = userService.findAll();
		List<WordBook> custcategoryIds = wordservice.findWordBookByCategory(4);
		List<WordBook> creditIds = wordservice.findWordBookByCategory(2);
		List<WordBook> custfromIds = wordservice.findWordBookByCategory(3);
		List<WordBook> satisfiedIds = wordservice.findWordBookByCategory(1);
		ModelAndView view = new ModelAndView("customer/addCustomer");
		view.getModel().put("users", users);
		view.getModel().put("custcategorys", custcategoryIds);
		view.getModel().put("credits", creditIds);
		view.getModel().put("custfroms", custfromIds);
		view.getModel().put("satisfieds", satisfiedIds);
		return view;
	}
	
	/**
	 * 执行插入客户
	 * @param customer 对象里面封装好了页面传回来的数据
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败) 这是json数据的写法
	 */
	@RequestMapping(value="/doadd",produces = "text/plain;charset=utf-8")
	@ResponseBody  // 用ResponseBody来自身返回json数据与传输
	public String doAddCustomer(Customer customer) {
		
		int ret = customerService.addCustomer(customer);
		if (ret != 0){
			return "{'code':'0'}"; //从页面来的customer的对象数据，返回封装好的json数据给自身页面
		}
		else {
			return "{'code':'1'}"; //哪个页面在js里通过ajax调用了这个action，就将数据返回给哪个页面的ajax里面
		}
	}
	
	/**
	 * 更改客户前的查询，客户经理，客户等级，信用度，满意度，客户来源等信息再传到目标页面
	 * @param customerId 通过id找出这个客户的所有信息
	 * @return view 
	 */
	@RequestMapping("/edit")
	public ModelAndView toEditCustomer(Integer customerId) {
		ModelAndView view = new ModelAndView("customer/updateCustomer");
		Customer customer = customerService.findById(customerId);
		System.out.println(customer.toString());
		List<User> users = userService.findAll();
		List<WordBook> custcategoryIds = wordservice.findWordBookByCategory(4);
		List<WordBook> creditIds = wordservice.findWordBookByCategory(2);
		List<WordBook> custfromIds = wordservice.findWordBookByCategory(3);
		List<WordBook> satisfiedIds = wordservice.findWordBookByCategory(1);
		view.getModel().put("customer", customer);
		view.getModel().put("users", users);
		view.getModel().put("custcategorys", custcategoryIds);
		view.getModel().put("credits", creditIds);
		view.getModel().put("custfroms", custfromIds);
		view.getModel().put("satisfieds", satisfiedIds);
		return view;
	}
	
	/**
	 * 执行更新客户操作
	 * @param customer
	 * @param request
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doedit",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditCustomer(Customer customer,HttpServletRequest request) {

		int ret = customerService.editCustomer(customer);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 执行删除客户操作
	 * @param customerId
	 * @param request
	 * @return {'msg':'1'}(成功) 或  {'msg':'0'}(失败)
	 */
	@RequestMapping(value="/del",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doDelCustomer(Integer customerId,HttpServletRequest request) {
		int ret = customerService.deleteById(customerId);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	/**
	 * 客户模糊查询前的查出需要的信息，封装成json数据传回jsp页面进行追加下拉框
	 * @return json数据（users，custcategoryIds，creditIds，custfromIds，satisfiedIds）
	 */
	@RequestMapping(value="/listSelection",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findSelection() {
		List<User> users = userService.findAll();
		List<WordBook> custcategoryIds = wordservice.findWordBookByCategory(4);
		List<WordBook> creditIds = wordservice.findWordBookByCategory(2);
		List<WordBook> custfromIds = wordservice.findWordBookByCategory(3);
		List<WordBook> satisfiedIds = wordservice.findWordBookByCategory(1);
		Map<String, Object> map = new HashMap<>();
		map.put("users", users);
		map.put("custcategoryIds", custcategoryIds);
		map.put("creditIds", creditIds);
		map.put("custfromIds", custfromIds);
		map.put("satisfiedIds", satisfiedIds);
		return new Gson().toJson(map);
	}
	
	/**
	 * 分页模糊查询——客户
	 * @param  customer  里面封装好了jsp页面ajax传回来的数据
	 * @param  pageNo    页数
	 * @param  pageSize  页码
	 * @return json数据     （list(customers),pager）
	 */
	@RequestMapping(value="/listCustomer",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByPager(Customer customer,Integer pageNo,Integer pageSize) {
		//System.out.println(customer.toString());
		//System.out.println("----------------------------"+pageNo + pageSize);
		if(pageNo == null) {
			pageNo = 1;  //默认设置第一次的页数为1，因为页数不能为0或从0开始
		}
		if(pageSize == null) {
			pageSize = 10;  //设置每一页的记录条数
		}
		Pager<Customer> pager = new Pager<>(pageNo, pageSize);
		//如果jsp页面某属性的值为-1，就要设空，这样这些属性就不会作为条件去到sql里面，而添加此属性的条件
		if (customer.getName() == null) {
			customer.setName(null);
		}
		if (customer.getUser().getId() == -1) {
			customer.setUser(null);
		}
		if (customer.getCreditId().getId() == -1) {
			customer.setCreditId(null);
		}
		if (customer.getSatisfiedId().getId() == -1) {
			customer.setSatisfiedId(null);
		}
		if (customer.getCustcategoryId().getId() == -1) {
			customer.setCustcategoryId(null);
		}
		if (customer.getCustfromId().getId() == -1) {
			customer.setCustfromId(null);
		}
		pager.setParam(customer);  //设置分页查询的条件
		Integer total = customerService.countForPager(pager);  //查询总页数
		pager.setTotal(total);
		List<Customer> customers = customerService.findByPager(pager); //执行分页模糊查询方法
		//model.addAttribute("pager", pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", customers);
		map.put("pager", pager); //将分页模糊查询出来的结果用map封装好，然后Gson.toJson方法json化数据并传回到页面
		return new Gson().toJson(map);
	}
	
	/**
	 * 批量删除客户
	 * @param request
	 * @param delIds 多个id的数组
	 * @return {'msg':'1'}(成功) {'msg':'1'}(失败)
	 */
	@RequestMapping("/delMoreCustomer")
	@ResponseBody
	public String delIds(HttpServletRequest request,Integer[] delIds) {
		int ret = customerService.deleteByCustomerIdList(delIds);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	//2、联系人子模块
	
	/**
	 * 插入联系人前的查询信息，传到页面进行显示
	 * @param customerId 通过customerId查询某个客户的联系人，并且将此客户的customerId传到页面
	 * @return view
	 */
	@RequestMapping("/addContacts")
	public ModelAndView addContacts(Integer customerId) {
		ModelAndView view = new ModelAndView("customer/addContacts");
		List<Contacts> list = contactsService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("customerId", customerId);
		return view;
	}
	
	/**
	 * 执行插入某个客户的联系人操作
	 * @param contacts 里面封装好了联系人的属性，然后执行addContacts方法进行插入
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doaddContacts",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doAddContacts(Contacts contacts) {
		
		int ret = contactsService.addContacts(contacts);
		if (ret != 0){
			return "{'code':'0'}";
		}
		else {
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 执行更新某个客户联系人前的查询
	 * @param contactsId 通过contactsId查询这条记录的信息，并传到目标jsp页面
	 * @return view(list contacts)
	 */
	@RequestMapping("/editContacts")
	public ModelAndView toEditContacts(Integer contactsId) {
		ModelAndView view = new ModelAndView("customer/updateContacts");
		Contacts contacts = contactsService.findById(contactsId);
		List<Contacts> list = contactsService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("contacts", contacts);
		return view;
	}
	
	/**
	 * 执行更新某个客户联系人的操作
	 * @param contacts 里面封装好了联系人需要更改的属性信息
	 * @param request
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doeditContacts",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditContacts(Contacts contacts,HttpServletRequest request) {

		int ret = contactsService.editContacts(contacts);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 执行删除客户联系人操作
	 * @param contactsId
	 * @param request
	 * @return {'msg':'1'}(成功) 或  {'msg':'0'}(失败)
	 */
	@RequestMapping(value="/delContacts",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doDelContacts(Integer contactsId,HttpServletRequest request) {
		int ret = contactsService.deleteById(contactsId);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	/**
	 * 联系人分页模糊查询前的下拉框填充查询
	 * return json数据(contacts)
	 */
	@RequestMapping(value="/listContactsJob",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findContactsJob() {
		List<Contacts> contacts = contactsService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("contacts", contacts);
		return new Gson().toJson(map);
	}
	
	/**
	 * 联系人分页模糊查询前的查询，传到目标jsp页面进行显示
	 * @param contacts
	 * @return view(contactss)
	 */
	@RequestMapping(value="/toListContacts",produces = "text/plain;charset=utf-8")
	public ModelAndView toFindByContactsPager(Contacts contacts){
		ModelAndView view = new ModelAndView("customer/contactsList");
		Customer customer = customerService.findById(contacts.getCustomer().getCustomerId());
		contacts.setCustomer(customer);
		view.getModel().put("contactss", contacts);
		return view;
	}
	
	/**
	 * 执行联系人分页模糊查询操作
	 * @param contacts 里面封装好了要分页模糊查询的数据
	 * @param pageNo   当前页数
	 * @param pageSize 页码
	 * @return json数据(list(contactss),pager)
	 */
	@RequestMapping(value="/listContacts",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByContactsPager(Contacts contacts,Integer pageNo,Integer pageSize) {
		//System.out.println(contacts.toString());
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 10;
		}
		Pager<Contacts> pager = new Pager<>(pageNo, pageSize);
		if (contacts.getName() == null) {
			contacts.setName("");
		}
		if (contacts.getGender().equals("-1")) {
			contacts.setGender(null);
		}
		if (contacts.getJob().equals("-1")) {
			contacts.setJob(null);
		}
		if(contacts.getRemark().equals("null")){
			contacts.setRemark(null);
		}
		pager.setParam(contacts);
		Integer total = contactsService.countForPager(pager);
		pager.setTotal(total);
		List<Contacts> contactss = contactsService.findByPager(pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", contactss);
		map.put("pager", pager);
		return new Gson().toJson(map);
	}
	
	/**
	 * 批量删除联系人
	 * @param request
	 * @param delIds 多个id的数组
	 * @return {'msg':'1'}(成功) {'msg':'1'}(失败)
	 */
	@RequestMapping("/delMoreContacts")
	@ResponseBody
	public String delContactsIds(HttpServletRequest request,Integer[] delIds) {
		int ret = contactsService.deleteByContactsList(delIds);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	//3、交往记录子模块
	
	/**
	 * 插入交往记录前的查询
	 * @param customerId 传回到页面作为参数的必需
	 * @return view(list(communcates),customerId)
	 */
	@RequestMapping("/addCommunicate")
	public ModelAndView addCommunicate(Integer customerId) {
		ModelAndView view = new ModelAndView("customer/addCommunicate");
		List<Communicate> list = communicateService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("customerId", customerId);
		return view;
	}
	
	/**
	 * 执行插入联系人操作
	 * @param communicate 里面封装好了要插入的联系人的数据
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doaddCommunicate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doAddCommunicate(HttpServletRequest request,Communicate communicate,@RequestParam("file1") MultipartFile file1) throws IllegalStateException, IOException {
		
		if(!file1.isEmpty()) {
            //上传文件路径
            String path = request.getServletContext().getRealPath("/pages/customer/upload/");
            //上传文件名
            String filename = file1.getOriginalFilename();
            //String fileExt = filename.substring(filename.lastIndexOf("."));
            //String uuid = UUID.randomUUID().toString();//随机UUID文件名
            //String newFile  = uuid+fileExt;
            String newFile  = filename;
            File filepath = new File(path,newFile);
            logger.info(newFile);
            logger.info(filepath.getAbsolutePath());
            
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file1.transferTo(new File(path + File.separator + newFile));
            //上传成功,保存上传后的文件路径到communicate对象中,再调用业务类保存都数据库中
            communicate.setFile("pages/customer/upload/"+newFile);
        } 
		
		int ret = communicateService.addCommunicate(communicate);
		if (ret != 0){
			//插入成功
			return "{'code':'0'}";
		}
		else {
			//插入失败
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 更新某个客户的交往记录前的查询
	 * @param communicateId 通过communicateId查询这条交往记录的信息
	 * @return view(list(communicates),communicate)
	 */
	@RequestMapping("/editCommunicate")
	public ModelAndView toEditCommunicate(Integer communicateId) {
		ModelAndView view = new ModelAndView("customer/updateCommunicate");
		Communicate communicate = communicateService.findById(communicateId);
		List<Communicate> list = communicateService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("communicate", communicate);
		return view;
	}
	
	/**
	 * 执行更新某个客户交往记录操作
	 * @param communicate 里面封装装好了需要更改的交往记录的信息
	 * @param request
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doeditCommunicate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditCommunicate(Communicate communicate,HttpServletRequest request,@RequestParam("file1") MultipartFile file1) throws IllegalStateException, IOException {
		
		if(!file1.isEmpty()) {
            //上传文件路径
            String path = request.getServletContext().getRealPath("/pages/customer/upload/");
            //上传文件名
            String filename = file1.getOriginalFilename();
            String newFile  = filename;
            File filepath = new File(path,newFile);
            logger.info(newFile);
            logger.info(filepath.getAbsolutePath());
            
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) { 
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file1.transferTo(new File(path + File.separator + newFile));
            //上传成功,保存上传后的文件路径到communicate对象中,再调用业务类保存都数据库中
            communicate.setFile("pages/customer/upload/"+newFile);
        } 

		int ret = communicateService.editCommunicate(communicate);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 执行删除某个客户的交往记录操作
	 * @param communicateId 
	 * @param request
	 * @return {'msg':'1'}(成功) 或 {'msg':'0'}(失败)
	 */
	@RequestMapping(value="/delCommunicate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doDelCommunicate(Integer communicateId,HttpServletRequest request) {
		int ret = communicateService.deleteById(communicateId);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	/**
	 * 查询交流日期并返回页面进行信息显示
	 * @return json数据(communicates)
	 */
	@RequestMapping(value="/listCommunicateDate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findCommunicateDate() {
		List<Communicate> communicates = communicateService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("communicates", communicates);
		return new Gson().toJson(map);
	}

	/**
	 * 交往记录分页模糊查询前的查询
	 * @param communicate
	 * @return view(communicates)
	 */
	@RequestMapping(value="/tolistCommunicate",produces = "text/plain;charset=utf-8")
	public ModelAndView toFindByCommunicate(Communicate communicate){
		ModelAndView view = new ModelAndView("customer/communicateList");
		Customer customer = customerService.findById(communicate.getCustomer().getCustomerId());
		communicate.setCustomer(customer);
		view.getModel().put("communicates", communicate);
		return view;
	}
	
	/**
	 * 交往记录分页模糊查询
	 * @param communicate
	 * @param pageNo 当前页数
	 * @param pageSize 页码
	 * @return json数据(list(communicates),pager)
	 */
	@RequestMapping(value="/listCommunicate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByCommunicate(Communicate communicate,Integer pageNo,Integer pageSize) {
		System.out.println(communicate.toString());
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 10;
		}
		if(communicate.getDetail() == null) {
			communicate.setDetail("");
		}
		if (communicate.getRemark() == null) {
			communicate.setRemark("");
		}
		Pager<Communicate> pager = new Pager<>(pageNo, pageSize);
		pager.setParam(communicate);
		Integer total = communicateService.countForPager(pager);
		pager.setTotal(total);
		List<Communicate> communicates = communicateService.findByPager(pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", communicates);
		map.put("pager", pager);
		return new Gson().toJson(map);
	}
	
	/**
	 * 批量删除交往记录
	 * @param request
	 * @param delIds 多个id的数组
	 * @return {'msg':'1'}(成功) {'msg':'1'}(失败)
	 */
	@RequestMapping("/delMoreCommunicate")
	@ResponseBody
	public String delCommunicateIds(HttpServletRequest request,Integer[] delIds) {
		int ret = communicateService.deleteByCommunicateList(delIds);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}
	
	/**
	 * 文件下载模块
	 * @param fileName 传入一个fileName，通过这个fileName去找到文件所在路径，创建输入输出流，最终以输出流格式输出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/download")
	public String download(String fileName, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(fileName);
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ fileName);
		try {
			String path = request.getSession().getServletContext().getRealPath("/")+File.separator;
			InputStream inputStream = new FileInputStream(new File(path
					+ fileName));
 
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
 
			 // 这里主要关闭。
			os.close();
 
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
            //  返回值要注意，要不然就出现下面这句错误！
            //java+getOutputStream() has already been called for this response
		return null;
	}
	
	/**
	 * 批量插入客户
	 * 读取Excel中的用户信息插入数据库
	 * @param request
	 * @param file1
	 * @return {'code':'0'}(成功) 或 {'code':'1'}(失败)
	 */
	@RequestMapping(value="/batchimport",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String batchImportMethod(HttpServletRequest request,@RequestParam(value="file1") MultipartFile file1) {
        //局部变量
        LeadingInExcel<Customer> testExcel=null;
        List<Customer> uploadAndRead=null;
        boolean judgement = false;
        String code =null;
        String error = "";
        
        
        //定义需要读取的数据
        String formart = "yyyy-MM-dd";
        //String propertiesFileName = "config";
        //String kyeName = "file_path";
        int sheetIndex = 0;
        Map<String, String> titleAndAttribute=null;
        Class<Customer> clazz=Customer.class;
            //定义对应的标题名与对应属性名
            titleAndAttribute=new HashMap<String, String>();
            titleAndAttribute.put("customer_id", "customerId");
            titleAndAttribute.put("name", "name");
            titleAndAttribute.put("contacts", "contacts");
            titleAndAttribute.put("tel", "tel");
            titleAndAttribute.put("user_id", "user");
            titleAndAttribute.put("custcategory_id", "custcategoryId");
            titleAndAttribute.put("credit_id", "creditId");
            titleAndAttribute.put("satisfied_id", "satisfiedId");
            titleAndAttribute.put("address", "address");
            titleAndAttribute.put("postal", "postal");
            titleAndAttribute.put("fax", "fax");
            titleAndAttribute.put("url", "url");
            titleAndAttribute.put("legal_person", "legalPerson");
            titleAndAttribute.put("license", "license");
            titleAndAttribute.put("fund", "fund");
            titleAndAttribute.put("turnover", "turnover");
            titleAndAttribute.put("bank", "bank");
            titleAndAttribute.put("bank_number", "bankNumber");
            titleAndAttribute.put("state_tax", "stateTax");
            titleAndAttribute.put("land_tax", "landTax");
            titleAndAttribute.put("custfrom_id", "custfromId");
            titleAndAttribute.put("changes", "changes");
        //调用解析工具包
        testExcel=new LeadingInExcel<Customer>(formart);
        //解析excel，获取客户信息集合
        try {
            uploadAndRead = testExcel.uploadAndRead(request,file1, sheetIndex, titleAndAttribute, clazz);
        } catch (Exception e) {
        	logger.error("读取Excel文件错误！",e);
        }
        if(uploadAndRead != null && !"[]".equals(uploadAndRead.toString()) && uploadAndRead.size()>=1){
            judgement = true;
        }
        if(judgement){
            
            //把客户信息分为每10条数据为一组迭代添加客户信息（注：将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
            //int count=0;
            int listSize=uploadAndRead.size();
            int toIndex=10;
            for (int i = 0; i < listSize; i+=10) {
                if(i+10>listSize){
                    toIndex=listSize-i;
                }
                List<Customer> customerList = uploadAndRead.subList(i, i+toIndex);
                for (Customer customer : customerList) {
					System.out.println(customer.toString());
				}
                /** 此处执行集合添加 */
                int ret = customerService.addCustomers(customerList);
                if (ret == 1) {
                	code ="0";
				}else {
					code ="1";
				}
            }
        }else{
             code ="1";
        }
        
        String res = "{ error:'" + error + "', code:'" + code + "'}";
        return res;
    }
	
	//4、历史订单子模块
	//   此系统对订单模块仅限于查询，而不能插入，更新和删除，如果需要，要在产品系统里面实现
	
	/**
	 * 添加订单前的查询
	 * @param customerId
	 * @return
	 */
	/*@RequestMapping("/addOrders")
	public ModelAndView addOrders(Integer customerId) {
		ModelAndView view = new ModelAndView("customer/addOrder");
		List<Orders> list = ordersService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("customerId", customerId);
		return view;
	}*/
	
	/**
	 * 执行插入订单
	 * @param orders
	 * @return
	 */
	/*@RequestMapping(value="/doaddOrders",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doAddOrders(Orders orders) {
		
		int ret = ordersService.addOrder(orders);
		if (ret != 0){
			//插入成功
			return "{'code':'0'}";
		}
		else {
			//插入失败
			return "{'code':'1'}";
		}
	}*/
	
	/**
	 * 更新订单前的查询
	 * @param orderId
	 * @return
	 */
	/*@RequestMapping("/editOrders")
	public ModelAndView toEditOrders(Integer orderId) {
		ModelAndView view = new ModelAndView("customer/updateOrder");
		Orders orders = ordersService.findById(orderId);
		List<Orders> list = ordersService.findAll();
		view.getModel().put("list", list);
		view.getModel().put("orders", orders);
		return view;
	}*/
	
	/**
	 * 执行更新订单
	 * @param orders
	 * @param request
	 * @return
	 */
	/*@RequestMapping(value="/doeditOrders",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditOrders(Orders orders,HttpServletRequest request) {

		int ret = ordersService.editOrder(orders);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}*/
	
	/**
	 * 删除订单
	 * @param orderId
	 * @param request
	 * @return
	 */
	/*@RequestMapping(value="/delOrders",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doDelOrders(Integer orderId,HttpServletRequest request) {
		int ret = ordersService.deleteById(orderId);
		if (ret != 0) {
			// 删除成功
			return "{'msg':'1'}";
		} else {
			// 删除失败
			return "{'msg':'0'}";
		}
	}*/
	
	/**
	 * 分页模糊查询订单前的查询，将地址查出来填充到jsp页面的下拉框
	 * @return json数据(orderss)
	 */
	@RequestMapping(value="/listOrdersAddress",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findOrdersAddress() {
		List<Orders> orderss = ordersService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("orderss", orderss);
		return new Gson().toJson(map);
	}

	/**
	 * 分页模糊查询订单前的查询，将此条订单的信息在jsp页面显示出来
	 * @param orders
	 * @return view(orders)  url:customer/orderList.jsp
	 */
	@RequestMapping(value="/tolistOrders",produces = "text/plain;charset=utf-8")
	public ModelAndView toFindByOrders(Orders orders){
		ModelAndView view = new ModelAndView("customer/orderList");
		Customer customer = customerService.findById(orders.getCustomer().getCustomerId());
		orders.setCustomer(customer);
		view.getModel().put("orders", orders);
		return view;
	}
	
	/**
	 * 订单分页模块查询
	 */
	@RequestMapping(value="/listOrders",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByOrders(Orders orders,Integer pageNo,Integer pageSize) {
		System.out.println(orders.toString());
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 10;
		}
		if(orders.getAddress().equals("-1")) {
			orders.setAddress(null);
		}
		if (orders.getState().equals("-1")) {
			orders.setState(null);
		}
		Pager<Orders> pager = new Pager<>(pageNo, pageSize);
		pager.setParam(orders);
		Integer total = ordersService.countForPager(pager);
		pager.setTotal(total);
		List<Orders> orderss = ordersService.findByPager(pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", orderss);
		map.put("pager", pager);
		return new Gson().toJson(map);
	}
	
	//5、订单详细信息子模块
	
	/**
	 * 分页模糊查询前的查询，将某条订单的信息传到jsp页面进行显示
	 * @param orderitem
	 * @return view(ordes)  url:customer/orderitemList.jsp
	 */
	@RequestMapping(value="/tolistOrderitem",produces = "text/plain;charset=utf-8")
	public ModelAndView toFindByOrderitem(Orderitem orderitem){
		ModelAndView view = new ModelAndView("customer/orderitemList");
		Orders orders = ordersService.findById(orderitem.getOrder().getOrderId());
		Customer customer = orders.getCustomer();
		//List<Orderitem> orderitems = orderitemService.findByOrderId(orderitem.getOrder().getOrderId());
		view.getModel().put("orders", orders);
		view.getModel().put("customer", customer);
		//view.getModel().put("orderitems", orderitems);
		return view;
	}
	
	/**
	 * 订单详细分页模糊查询
	 * @param orderitem
	 * @param pageNo
	 * @param pageSize
	 * @return json数据(list(orderitems),pager)
	 */
	@RequestMapping(value="/listOrderItem",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByOrderItem(Orderitem orderitem,Integer pageNo,Integer pageSize) {
		System.out.println(orderitem.toString());
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 10;
		}
		
		Pager<Orderitem> pager = new Pager<>(pageNo, pageSize);
		pager.setParam(orderitem);
		Integer total = orderitemService.countForPager(pager);
		pager.setTotal(total);
		List<Orderitem> orderitems = orderitemService.findByPager(pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", orderitems);
		map.put("pager", pager);
		return new Gson().toJson(map);
	}
	
	//6、客户流失模块
	
	/**
	 * 分页模糊查询前的查询，将客户和客户经理传回jsp页面进行下拉框填充
	 * @return
	 */
	@RequestMapping(value="/tolistLossUser",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findLossUser() {
		List<User> users = userService.findAll();
		List<Customer> customers = customerService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("users", users);
		map.put("customers", customers);
		return new Gson().toJson(map);
	}
	
	/**
	 * 流失信息分页模糊查询
	 * @param loss
	 * @param pageNo
	 * @param pageSize
	 * @return json数据(list(losss),pager)
	 */
	@RequestMapping(value="/listLoss",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findByLoss(Loss loss,Integer pageNo,Integer pageSize) {
		//System.out.println(loss.toString());
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 10;
		}
		if(loss.getUser().getId() == -1) {
			loss.setUser(null);
		}
		if (loss.getCustomer().getCustomerId() == -1) {
			loss.setCustomer(null);
		}
		if(loss.getState().equals("-1")) {
			loss.setState(null);
		}
		if (loss.getMeasure().equals("")) {
			loss.setMeasure(null);
		}
		Pager<Loss> pager = new Pager<>(pageNo, pageSize);
		pager.setParam(loss);
		Integer total = lossService.countForPager(pager);
		pager.setTotal(total);
		List<Loss> losss = lossService.findByPager(pager);
		Map<String, Object> map = new HashMap<>();
		map.put("list", losss);
		map.put("pager", pager);
		return new Gson().toJson(map);
	}
	
	/**
	 * 暂缓流失更新前的查询
	 * @param lossId
	 * @return view(list(loss))
	 */
	@RequestMapping("/editLossTemp")
	public ModelAndView toEditLossTemp(Integer lossId) {
		ModelAndView view = new ModelAndView("customer/tempLoss");
		Loss loss = lossService.findById(lossId);
		view.getModel().put("list", loss);
		return view; 
	}
	
	/**
	 * 确认流失更新前的查询
	 * @param lossId
	 * @return view(list(loss))
	 */
	@RequestMapping("/editLossComfirm")
	public ModelAndView toEditLossComfirm(Integer lossId) {
		ModelAndView view = new ModelAndView("customer/comfirmLoss");
		Loss loss = lossService.findById(lossId);
		System.out.println(loss.toString());
		view.getModel().put("list", loss);
		return view;
	}
	
	/**
	 * 暂缓流失
	 * @param loss
	 * @param request
	 * @return {'code':'0'}(成功) {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doeditLoTemp",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditLossTemp(Loss loss,HttpServletRequest request) {

		System.out.println(loss.toString());
		int ret = lossService.editLoss(loss);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}
	
	/**
	 * 确认流失
	 * @param loss
	 * @param request
	 * @return {'code':'0'}(成功) {'code':'1'}(失败)
	 */
	@RequestMapping(value="/doeditLoComfirm",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doEditLossComfirm(Loss loss,HttpServletRequest request) {

		int ret = lossService.editLoss(loss);

		if (ret != 0) {
			// 更新成功
			return "{'code':'0'}";
		} else {
			// 更新失败
			return "{'code':'1'}";
		}
	}
	
}
