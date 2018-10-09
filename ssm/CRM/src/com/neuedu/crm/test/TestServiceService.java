package com.neuedu.crm.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Role;
import com.neuedu.crm.bean.Service;
import com.neuedu.crm.bean.ServiceVo;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.bean.UserRole;
import com.neuedu.crm.bean.WordBook;
import com.neuedu.crm.service.IListAuthorityService;
import com.neuedu.crm.service.ILogService;
import com.neuedu.crm.service.IServiceService;
import com.neuedu.crm.service.IServiceVoService;
import com.neuedu.crm.service.IUserRoleService;
import com.neuedu.crm.service.impl.AuthorityServiceImpl;
import com.neuedu.crm.service.impl.ListAuthorityImpl;
import com.neuedu.crm.service.impl.LogServiceImpl;
import com.neuedu.crm.service.impl.ServiceServiceImpl;
import com.neuedu.crm.service.impl.ServiceVoServiceImpl;
import com.neuedu.crm.service.impl.UserRoleServiceImpl;
import com.neuedu.crm.service.impl.UserServiceImpl;

public class TestServiceService {
	private ApplicationContext Context;
	private Logger logger = Logger.getLogger(TestServiceService.class);
	private IServiceService serviceService;
	private IServiceVoService serviceVoService;
	private IListAuthorityService listAuthorityService;
	private ILogService logService;
	private IUserRoleService userRoleSERVICE;
	
	@Before
	public void init() {
		String location="applicationContext.xml";
		Context = new ClassPathXmlApplicationContext(location);
		serviceService = Context.getBean(ServiceServiceImpl.class);
		serviceVoService = Context.getBean(ServiceVoServiceImpl.class);
		listAuthorityService = Context.getBean(ListAuthorityImpl.class);
		logService = Context.getBean(LogServiceImpl.class);
		userRoleSERVICE = Context.getBean(UserRoleServiceImpl.class);
	}

	//@Test
	public void findall() {
		List<Service> list = serviceService.findAll();
		for (Service service : list) {
			logger.info(service.getCreateId() + " xx" + service.getEvaluateId());
		}
	}
	//@Test 
	public void update() {
		Service service = new Service();
		
		User createId = new User();
		createId.setId(4);
		
		service.setServiceId(2);
		service.setSummary("weqweqweqwe");
		service.setDealDate(new Date());
		service.setCreateId(createId);
		boolean ref  =  serviceService.editService(service);
		if(ref) {
			logger.info("成功");
		}
	}
	//@Test
	public void findPager() {
		Pager<ServiceVo> pager = new Pager<>(1, 1);
		ServiceVo serviceVo = new ServiceVo();
		//serviceVo.setAccount("陈");
		pager.setParam(serviceVo);
		Integer total = serviceVoService.countForPager(pager);
		logger.info("总数" + total);
		pager.setTotal(total);
		List<ServiceVo> list = serviceVoService.findPagerByExample(pager);
		for (ServiceVo serviceVo2 : list) {
			logger.info(serviceVo2.toString());
		}
	}
	
	//@Test
	public void findCustomerDeal() {
		ListAuthority listAuthority = new ListAuthority();
		listAuthority.setAccount("楚子航");
		List<ListAuthority> list = listAuthorityService.findByExample(listAuthority);
		for (ListAuthority listAuthority2 : list) {
			logger.info(listAuthority2.getAuthorityMark());
		}
	}
	
	//@Test
	public void editService() {
		Service service = new Service();
		User user = new User();
		user.setId(7);
		service.setDealId(user);
		user.setId(1);
		service.setPrincipalId(user);
		service.setPrincipalDate(new Date());
		service.setServiceId(3);
		WordBook wordBook = new WordBook();
		wordBook.setId(73);
		service.setStatusId(wordBook);
		serviceService.editService(service);
	}
	
	//@Test
	public void findService() {
		List<Service> list = serviceService.findAll();
		for (Service service : list) {
			logger.info(service.getServicecategoryId());
		}
	}
	
	//@Test
	public void addLog() {
		Log log = new Log("xxx", "ddd", "deal", "中国兴盛", new Date());
		logService.addLog(log);
	}
	
	@Test
	public void RoleUser() {
		List<UserRole> userRoles = new ArrayList<>();
		UserRole userRole = new UserRole();
		User user = new User();
		Role role = new Role();
		user.setId(11);
		role.setRoleId(4);
		userRole.setUser(user);
		userRole.setRole(role);
		userRoles.add(userRole);
		UserRole userRole1 = new UserRole();
		user = new User();
		role = new Role();
		user.setId(12);
		role.setRoleId(4);
		userRole1.setUser(user);
		userRole1.setRole(role);
		userRoles.add(userRole1);
		UserRole userRole2 = new UserRole();
		user = new User();
		role = new Role();
		user.setId(13);
		role.setRoleId(4);
		userRole2.setUser(user);
		userRole2.setRole(role);
		userRoles.add(userRole2);
		userRoleSERVICE.addUserRoles(userRoles);
	}
}
