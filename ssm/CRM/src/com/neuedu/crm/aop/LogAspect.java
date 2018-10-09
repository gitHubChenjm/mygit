package com.neuedu.crm.aop;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.ClassClassPath;
import org.apache.ibatis.javassist.ClassPool;
import org.apache.ibatis.javassist.CtClass;
import org.apache.ibatis.javassist.CtMethod;
import org.apache.ibatis.javassist.Modifier;
import org.apache.ibatis.javassist.bytecode.CodeAttribute;
import org.apache.ibatis.javassist.bytecode.LocalVariableAttribute;
import org.apache.ibatis.javassist.bytecode.MethodInfo;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.neuedu.crm.bean.Log;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.bean.Service;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.ILogService;

@Aspect
@Component 
public class LogAspect {
	
	@Autowired
	private ILogService logService; 
	
	private Logger logger = Logger.getRootLogger();
	
	public LogAspect() {
		logger.info("你有被扫描到码?？");
	}
	
	
	/**
	 * 服务controller的切面
	 * @param joinPoint
	 * @return
	 */
	@Around("execution(* com.neuedu.crm.view.*.*(..))")
	public Object args(ProceedingJoinPoint joinPoint) {  
		 Object[] args = joinPoint.getArgs();	
		 String classType = joinPoint.getTarget().getClass().getName();  
		 Class<?> clazz;
		 Object result=null;
		try {
			//继续页面业务
			result = joinPoint.proceed();
			clazz = Class.forName(classType);
			 String clazzName = clazz.getName();    
			 String methodName = joinPoint.getSignature().getName(); //获取方法名称 
			 logger.info(clazzName);
			 Map<String,Object > nameAndArgs = this.getFieldsName(this.getClass(), clazzName, methodName,args);   
			
			/**
			 * 1.根据类名判断是执行哪个controller
			 * 2.根据方法名判断执行哪个方法
			 * 3.对操作这个方法需要记录什么信息。
			 */
			 
			 //服务的controller
			 if("com.neuedu.crm.view.ServiceController".equals(clazzName)) {
				 if("delService".equals(methodName) || "editService".equals(methodName)) {
					 HttpServletRequest request = (HttpServletRequest) nameAndArgs.get("request");
					 Service service = (Service)nameAndArgs.get("service");
					 HttpSession session = request.getSession();
					 User user = (User) session.getAttribute("user");
					 Log log = new Log();
					 log.setAccount(user.getAccount());
					 log.setTel(user.getTel());
					 log.setDate(new Date());
					 log.setAction(methodName + ".action");
					 if("delService".equals(methodName)) {
						 log.setExplains(user.getAccount() + "对服务id为:" + service.getServiceId() + " 进行了删除");
					 }else if("editService".equals(methodName)) {
						 log.setExplains(user.getAccount() + "对服务id为:" + service.getServiceId() + " 进行了更新");
					 }else if("delIds".equals(methodName)) {
						 Integer[] ids = (Integer[])nameAndArgs.get("delIds");
						 String string = "删除了id为";
						 for(Integer integer : ids) {
							 string += integer+"、";
						 }
						 string+="的服务id";
						 log.setExplains(string);
					 }
					 logService.addLog(log);
				 }
			 }else if("com.neuedu.crm.view.SaleController".equals(clazzName)) {
				 if("deleteSale".equals(methodName) || "editSale".equals(methodName)) {
					 HttpServletRequest request = (HttpServletRequest) nameAndArgs.get("request");
					 HttpSession session = request.getSession();
					 User user = (User) session.getAttribute("user");
					 Sale sale = (Sale)nameAndArgs.get("sale");
					 Log log = new Log();
					 log.setAccount(user.getAccount());
					 log.setTel(user.getTel());
					 log.setDate(new Date());
					 
					 if("deleteSale".equals(methodName)) {
						 log.setAction("dodel.action");
						 log.setExplains(user.getAccount() + "对销售id为:" + sale.getSaleId() + " 进行了删除");
					 }else if("editSale".equals(methodName)) {
						 log.setAction("edit.action");
						 log.setExplains(user.getAccount() + "对销售id为:" + sale.getSaleId() + " 进行了更改");
					 }
					 logService.addLog(log);
				 }
				 
			 }else if("com.neuedu.crm.view.CustomerController".equals(clazzName)) {
				 if("doEditCustomer".equals(methodName) || "doEditContacts".equals(methodName) ||
						 "doDelContacts".equals(methodName) || "doDelBook".equals(methodName)) {
					 HttpServletRequest request = (HttpServletRequest) nameAndArgs.get("request");
					 HttpSession session = request.getSession();
					 User user = (User) session.getAttribute("user");
					 Log log = new Log();
					 log.setAccount(user.getAccount());
					 log.setTel(user.getTel());
					 log.setDate(new Date());
					 
					 if("doEditCustomer".equals(methodName)) {
						 log.setAction("doedit.action");
						 log.setExplains("进行了更新客户的操作!");
					 }else if("doEditContacts".equals(methodName)) {
						 log.setAction("doeditContacts.action");
						 log.setExplains("进行了更新客户联系人的操作!");
					 }else if("doDelContacts".equals(methodName)) {
						 log.setAction("delContacts.action");
						 log.setExplains("进行了删除客户联系人的操作!");
					 }else if("doDelBook".equals(methodName)) {
						 log.setAction("del.action");
						 log.setExplains("进行了删除客户的操作!");
					 }
					 logService.addLog(log);
				 }
			 }
			 return  result;
		} catch (ClassNotFoundException e) {		
			e.printStackTrace();
		} catch (Exception e) {		
			e.printStackTrace();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			 return  result;
		}
		
		
	}
	
	
	/**
	 * 获取字段名和字段值
	 */
	private Map<String,Object> getFieldsName(Class cls, String clazzName, String methodName, Object[] args) throws Exception {   
        Map<String,Object > map=new HashMap<String,Object>(); 


        ClassPool pool = ClassPool.getDefault();    
        ClassClassPath classPath = new ClassClassPath(cls);    
        pool.insertClassPath(classPath);    
            
        CtClass cc = pool.get(clazzName);    
        CtMethod cm = cc.getDeclaredMethod(methodName);    
        MethodInfo methodInfo = cm.getMethodInfo();  
        CodeAttribute codeAttribute = methodInfo.getCodeAttribute();    
        LocalVariableAttribute attr = (LocalVariableAttribute) codeAttribute.getAttribute(LocalVariableAttribute.tag);    
        if (attr == null) {    
            // exception    
        }    
        int pos = Modifier.isStatic(cm.getModifiers()) ? 0 : 1;    
        for (int i = 0; i < cm.getParameterTypes().length; i++){    
            map.put( attr.variableName(i + pos),args[i]);//paramNames即参数名    
        }    
        return map;    
    }    
	
}
