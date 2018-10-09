package com.neuedu.crm.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Role;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.bean.UserRole;
import com.neuedu.crm.service.IListAuthorityService;
import com.neuedu.crm.service.IRoleService;
import com.neuedu.crm.service.IUserRoleService;
import com.neuedu.crm.service.IUserService;


@Controller
@RequestMapping("/authority")
public class ListAuthorityController {
	
	@Autowired
	private IListAuthorityService listAuthorityService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IUserRoleService userRoleSerivce;
	
	@RequestMapping("/listAuthority")
	@ResponseBody
	public String listAuthoriy(ListAuthority listAuthority,Integer pageNo,Integer pageSize,Model model) {
		if(pageNo == null) {
			pageNo = 1;
		}
		if(pageSize == null) {
			pageSize = 1;
		}
		Pager<ListAuthority> pager = new Pager<ListAuthority>(pageNo, pageSize);
		pager.setParam(listAuthority);
		int total = listAuthorityService.countForPager(pager);
		pager.setTotal(total);
		List<ListAuthority> list  = listAuthorityService.findBypagerExample(pager);
		model.addAttribute("pager", pager);
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	public String delUser(Integer id) {
		userService.deleteById(id);
		return "{msg:1}";
	}
	
	@RequestMapping("/findListUser")
	@ResponseBody
	public String findListUser(Integer[] more) {
		List<Integer> list = new ArrayList<>();
		for (Integer integer : more) {
			list.add(integer);
		}
		return new Gson().toJson(listAuthorityService.findByIdList(list));
	}
	@RequestMapping("/findAllRole")
	@ResponseBody
	public String findAllRole() {
		return new Gson().toJson(roleService.findAll());
	}
	
	@RequestMapping("/doChangeRole")
	@ResponseBody
	public String doChange(Integer[] list,Integer roleId) {
		
		/**
		 * 0.查询user_role表，传入接受参数，获取参数中，那个id在数据库已经有了
		 * 1.从数据库中获取到的数据，进行对比找出需要插入和需要修改的数组。
		 * 
		 */
		List<Integer> lists = new ArrayList<>();
		for (Integer integer : list) {
			System.out.println("参数:" + integer);
			lists.add(integer);
		}
		int updateList[] = new int[list.length],i=0,insertList[] = new int[list.length],j=0,temp=0;
		List<UserRole> listUserRole = userRoleSerivce.findByUserRoleIdList(lists);
		//传进来的参数，在数据库角色表中，谁已经分配过权限，放在updateList里面做修改操作，剩下放在insertList的做插入操作。
		for (UserRole userRole : listUserRole) {
			updateList[i++] = userRole.getUser().getId();
		}
		
		for(Integer integer : list) {
			//标志在数据库查询出来的数字，是否在传入参数的数组中，如果不在则是插入操作
			boolean flag = false;
			for(Integer update: updateList) {
				if(update == integer) {
					flag = true;
					break;
				}
			}
			if(flag == false) {
				//当标志位false时，证明不在数据库查询里面，把该值作为update数组一员。
				insertList[j++] = integer;
			}
		}
		
		/**
		 * 进行update和insert 用户角色
		 * 1.先进行update操作
		 * 2.在进行insert操作
		 */
		//首先把角色和id绑定在userrole实体里面,再添加到list里面，mybatis不支持多参数，只能这样，然后进行批量更新
		listUserRole = new ArrayList<UserRole>();
		for(int k = 0 ; k<i;k++) {
			Integer integer = updateList[k];
			UserRole userRole =new UserRole();
			User user = new User();
			user.setId(integer);
			Role role = new Role();
			role.setRoleId(roleId);
			userRole.setRole(role);
			userRole.setUser(user);
			listUserRole.add(userRole);
			System.out.println("updatelist:"+integer);
		}
		if(i>0) { //防止，没有数据也操作
		userRoleSerivce.editUserRoles(listUserRole);
		}
		listUserRole = new ArrayList<UserRole>();
		//把需要插入的，进行插入
		for(int k = 0 ; k<j;k++) {
			Integer integer = insertList[k];
			UserRole userRole =new UserRole();
			User user = new User();
			user.setId(integer);
			Role role = new Role();
			role.setRoleId(roleId);
			userRole.setRole(role);
			userRole.setUser(user);
			listUserRole.add(userRole);
			System.out.println("insertlist:"+integer);
		}
		if(j>0) { //防止，没有数据也操作
		userRoleSerivce.addUserRoles(listUserRole);
		}
		return "{'msg':'1'}";
	}
}
