package com.neuedu.crm.view;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.IUserRoleService;
import com.neuedu.crm.service.IUserService;
import com.neuedu.crm.utils.SaltEncrypt;
import com.neuedu.crm.utils.SendSmsDemo;

@Controller

public class LoginController {
	private Logger logger = Logger.getRootLogger();
	
	private SaltEncrypt saltEncrypt = new SaltEncrypt();
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IUserRoleService userRoleService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/login")
	@ResponseBody
	public String UserLogin(User user,@RequestParam(value="loc") Integer[] loc){
		//logger.info(user);
		for (int i = 0; i < loc.length; i++) {
			System.out.println(loc[i]);
		}
		int[][] location = (int[][])request.getSession().getAttribute("location");//正确的坐标
		//将用户点击得到的坐标(一维数组)转为二维数组方便和session里的正确坐标比较
		int[][] loc2 = {{loc[0],loc[1]},{loc[2],loc[3]},{loc[4],loc[5]},{loc[6],loc[7]}};
		//开始比较用户点击的坐标和正确的坐标
		int flag = 0;
		for (int i = 0; i < 4; i++) {
			int X = location[i][0];	//正确的坐标
			int Y = location[i][1];
			int x = loc2[i][0];//待验证的坐标
			int y = loc2[i][1];
			if (x>(X+20) || x<(X-20) || y<(Y-20) || y>(Y+20)) {
				flag = 1;
				break;
			}
		}		
		HttpSession session = request.getSession();
		if(flag == 0) {
			try {
				//将密码先加密传进user，再配对
				Subject currentUser = SecurityUtils.getSubject();  
				
				String saltPW = saltEncrypt.generate(user.getPassword(),user.getAccount());
				user.setPassword(saltPW);
				UsernamePasswordToken token = new UsernamePasswordToken
						(user.getAccount(),saltPW);  
				if(!currentUser.isAuthenticated()) {
					  
		              currentUser.login(token);//验证角色和权限  
		              User user2 = userService.findAcount(user.getAccount());
		              logger.info(user);
		              session.setAttribute("user", user2);
		              return "{'code':'0'}";
				}
			} catch (Exception e) {
				return "{'msg':'用户名或密码错误1'}";
			}
		}else {
			return "{'msg':'验证码错误'}";
		}
		return "{'msg':'重复登录'}";
	}
	
	@RequestMapping("/quit")
	public String UserQuit(HttpServletRequest request) {
		Subject currentUser = SecurityUtils.getSubject();  
		currentUser.logout(); 
		/*HttpSession session = request.getSession();
		session.removeAttribute("user");*/
		return "redirect:login.jsp";
	}
	
	@RequestMapping("/repeat")
	@ResponseBody
	public String findAcount(String account) {
		User user = userService.findAcount(account);
		if(user == null) {
			return "{'code':'1'}";
		}else {
			return "{'code':'2','tel':'" + user.getTel() +"'}";
		}
		
	}
	/**
	 * 插入一个user，，通过验证码后，密码加密，再插入
	 * @param request
	 * @param user
	 * @param code
	 * @return
	 */
	@RequestMapping("/insertUser")
	@ResponseBody
	public String insertUser(HttpServletRequest request,User user,String code) {
		HttpSession session = request.getSession();
		Integer temp;
		logger.info("session code :" + session.getAttribute("code") + "put code:" + code);
		if(session.getAttribute("code").equals(code) ) {
			//先将密码加密
			String saltPW = saltEncrypt.generate(user.getPassword(),user.getAccount());
			user.setPassword(saltPW);
			temp = userService.addUser(user);
			//删除session里面的验证码，防止下次还在
			session.removeAttribute("code");
			if(temp > 0) {
				return "{'code':'1'}";
			}else{
				return "{'code':'2'}";
			}
		}else {
			//删除session里面的验证码，防止下次还在
			session.removeAttribute("code");
			return "{'code':'2'}";
		}
	}
	
	/**
	 * 产生4位随机数，然后以短信的方式发送
	 * @param request
	 * @param phone
	 * @param sms
	 * @return
	 */
	@RequestMapping("/createCode")
	@ResponseBody
	public String sendCode(HttpServletRequest request,String phone,String sms) {
		Random random = new Random();
		// 取随机产生的认证码(4位数字)  
		String code = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			code += rand;
				}
		// 将认证码存入SESSION  
		HttpSession session = request.getSession();
		session.setAttribute("code", code);
		//sms 设置为注册的编号
		SendSmsDemo.SendCode(phone, code, sms);
		return "{'code':'1'}";
	}
	
	@RequestMapping("/codeCheck")
	@ResponseBody
	public String codeCheck(HttpServletRequest request,String code) {
		HttpSession session = request.getSession();
		if(session.getAttribute("code").equals(code) ) {
			//将验证码删除，防止下次同样验证码进入
			session.removeAttribute("code");
			return "{'code':'1'}";
		}else {
			session.removeAttribute("code");
			return "{'code':'2'}";
		}
	}
	
	@RequestMapping("/changePW")
	@ResponseBody
	public String changePW(User user) {
		String saltPW = saltEncrypt.generate(user.getPassword(),user.getAccount());
		user.setPassword(saltPW);
		boolean ref = userService.changePW(user);
		if(ref) {
			return "{'code':'1'}";
		}else {
			return "{'code':'0'}";
		}
	}
	//根据用户id查找用户资料，例如头像，电话等,角色
	@RequestMapping("/findUserRole")
	@ResponseBody
	public String findUserRole(User user) {
		return new Gson().toJson(userRoleService.findById(user.getId()));
	}
	
	//上传头像
	@RequestMapping("/editUser")
	public String editUser(HttpServletRequest request,MultipartFile pictureFile,User user) throws IllegalStateException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date()).substring(0,6);//获取年月
        String name = UUID.randomUUID().toString().replaceAll("-", "");//获取随机名字
        //获取文件扩展名
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        logger.info("ext："+ ext);
        /*
         * 
         * 1.设置相对路径
         * 2.设置文件存放绝对路径
         * 3.设置文件名+后缀 
         * 4.最后将文件上传到绝对路径，然后相对路径加文件名存放到数据库
         */
        String postion = "statics/uploads/head/"+ res;
        logger.info(postion);
        String url = request.getSession().getServletContext().getRealPath(postion);
		
        File newFile = new File(url + "/" + name + "." + ext);
        if(!newFile.getParentFile().exists()) {
        	newFile.getParentFile().mkdir();
        }
        pictureFile.transferTo(newFile);
        user.setHead(postion + "/"+ name + "." + ext);
        logger.info(user);
        userService.editUser(user);
        HttpSession session = request.getSession();
       
        session.setAttribute("user", user);
        return "userInfo";
	}
}
