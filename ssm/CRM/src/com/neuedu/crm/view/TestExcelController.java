package com.neuedu.crm.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neuedu.crm.bean.Customer;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.IUserService;
import com.neuedu.crm.utils.LeadingInExcel;

@Controller
@RequestMapping("/excel")
public class TestExcelController {
	
	private Logger logger = Logger.getRootLogger();
	
	@Autowired
	private IUserService userservice;
	
	
	/**
     * 读取Excel中的用户信息插入数据库
     * @param multipart
     * @param session
     * @return
     */
    @RequestMapping(value="/batchimport",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String batchImportMethod(HttpServletRequest request,@RequestParam(value="file1") MultipartFile file1) {
        //局部变量
        LeadingInExcel<User> testExcel=null;
        List<User> uploadAndRead=null;
        boolean judgement = false;
        String code =null;
        String error = "";
        
        
        //定义需要读取的数据
        String formart = "yyyy-MM-dd";
        //String propertiesFileName = "config";
        //String kyeName = "file_path";
        int sheetIndex = 0;
        Map<String, String> titleAndAttribute=null;
        Class<User> clazz=User.class;
            //定义对应的标题名与对应属性名
            titleAndAttribute=new HashMap<String, String>();
            titleAndAttribute.put("id", "id");
            titleAndAttribute.put("account", "account");
            titleAndAttribute.put("tel", "tel");
            titleAndAttribute.put("head", "head");
            titleAndAttribute.put("password", "password");
        //调用解析工具包
        testExcel=new LeadingInExcel<User>(formart);
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
                List<User> userList = uploadAndRead.subList(i, i+toIndex);
                for (User user2 : userList) {
					System.out.println(user2.toString());
				}
                /*
                 * 测试数据：
                     count=count+subList.size();
                    System.out.println("subList长度："+subList.size()+"\t总长度："+count);
                 * 
                     for (UserJHDX userJHDX : subList) {
                        System.out.println("手机号："+userJHDX.getPhone()+"截止日期:"+userJHDX.getUptodate()+"流量值"+userJHDX.getFlux()+"总次数"+userJHDX.getTotal());
                    }
                 */
                
                /** 此处执行集合添加 */
                //userWhiteListService.batchInport(userList, gameId);
            }
            
             code ="0";
        }else{
             code ="1";
        }
        
        String res = "{ error:'" + error + "', code:'" + code + "'}";
        return res;
    }
    
    @RequestMapping(value="/batchimport1",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String batchImportMethod1(HttpServletRequest request,@RequestParam(value="file1") MultipartFile file1) {
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
                /*
                 * 测试数据：
                     count=count+subList.size();
                    System.out.println("subList长度："+subList.size()+"\t总长度："+count);
                 * 
                     for (UserJHDX userJHDX : subList) {
                        System.out.println("手机号："+userJHDX.getPhone()+"截止日期:"+userJHDX.getUptodate()+"流量值"+userJHDX.getFlux()+"总次数"+userJHDX.getTotal());
                    }
                 */
                
                /** 此处执行集合添加 */
                //userWhiteListService.batchInport(userList, gameId);
            }
            
             code ="0";
        }else{
             code ="1";
        }
        
        String res = "{ error:'" + error + "', code:'" + code + "'}";
        return res;
    }
}
