package com.neuedu.crm.test;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.crm.bean.Pager;
import com.neuedu.crm.bean.Sale;
import com.neuedu.crm.bean.SaleVo;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.ISaleService;
import com.neuedu.crm.service.impl.SaleServiceImpl;

public class TestSaleService {
	
	ApplicationContext context;
	ISaleService saleService;
	Logger logger = Logger.getLogger(TestSaleService.class);
	
	@Before
	public void init() {
		String config = "applicationContext.xml";
		context = new ClassPathXmlApplicationContext(config);
		saleService =  context.getBean(SaleServiceImpl.class);
	}
	
	@Test
	public void testFindAll() {
		List<SaleVo> list = saleService.findAll();
		for (SaleVo saleVo : list) {
			logger.info(saleVo);
		}
	}
	
	@Test
	public void testDeleteByExample() {
		Sale sale = new Sale(3,"鼠哥薯条有限公司","小渣子有购入大批量薯条的想法","电话获取",0.99,"喳喳辉","15768172275","买买买",new User(),null,0,null,null,0);
		int result = saleService.deleteSaleByExample(sale);
		if (result == 1) {
			logger.info("-------------success");
		}else {
			logger.info("-------------faild");
		}
	}
	

	public void testAdd(int id,double pro,String tel,String cname,String cway) {
		User createUser = new User();
		createUser.setId(id);
		
		Sale sale = new Sale(0,cname,"小渣子有购入大批量薯条的想法",cway,pro,"喳喳辉",tel,"买买买",createUser,null,0,null,null,0);
		int result = saleService.addSale(sale);
		if (result == 1) {
			logger.info("----------------success");
		}else {
			logger.info("----------------faild");
		}
	}
	
	@Test	//随机生成userid,tel,概率
	public void addmuch() {
		Random random = new Random();
		DecimalFormat df = new DecimalFormat("#.0");
		for(int i=0;i<50;i++) {			
			int id = random.nextInt(6)+1;
			double pro = Math.random();
			if (pro < 0.40) {
				pro+=0.40;
			}
			String pro1 = df.format(pro);
			pro = Double.parseDouble(pro1);
			int tel1 = random.nextInt(55535)+10000;
			int tel2 = random.nextInt(55535)+10000;
			String tel = 1+""+tel1+tel2;
//			System.out.println(id+"\t"+"\t"+pro+"\t"+tel);
			int name = random.nextInt(10);
			String cname = "";
			switch (name) {
				case 0:cname="鼠哥薯条有限公司";break;
				case 1:cname="老巫在线卖唱公司";break;
				case 2:cname="淘宝假货有限公司";break;
				case 3:cname="615周杰伦卖唱公司";break;
				case 4:cname="京东二手有限公司";break;
				case 5:cname="小米抢货有限公司";break;
				case 6:cname="华为优化有限公司";break;
				case 7:cname="魅族洗牌有限公司";break;
				case 8:cname="美帝联想有限公司";break;
				case 9:cname="CEO制造器有限公司";break;
				default:break;
			}
			int way = random.nextInt(4);
			String cway = "";
			if (way == 0) cway = "网络沟通";
			else if(way == 1) cway = "电话沟通";
			else if(way == 2) cway = "客户介绍";
			else cway = "当面洽谈";
			testAdd(id,pro,tel,cname,cway);
		}
	}
	
	@Test
	public void testFindById() {
		SaleVo saleVo = saleService.findById(2);
		logger.info(saleVo.toString());
	}
	
	@Test
	public void testUpdate() {
		User createUser = new User();
		createUser.setId(2);
		User dealUser = new User();
		dealUser.setId(1);
		Sale sale = new Sale(50,"dong哥薯条有限公司","有购入大批量薯条的想法","网络获取",0.99,"古天乐","13333XXXXX","剁剁剁",createUser,null,1,null,null,0);
		int result = saleService.modifyByExample(sale);
		if (result == 1) {
			logger.info("----------------------success");
		}else {
			logger.info("----------------------faild");
		}
	}
	
	@Test
	public void testChangeDealUser() {
		User user = new User();
		user.setId(2);
		Sale sale = new Sale();
		sale.setSaleId(50);
		sale.setDealId(user);
		int result = saleService.changeDealUser(sale);
		if (result == 1) {
			logger.info("----------------------success");
		}else {
			logger.info("----------------------faild");
		}
	}
	
	@Test
	public void testFindByExampleWithConfident() {
		Sale sale = new Sale();
		sale.setCustomerName("鼠哥");
		List<Sale> list = saleService.findByExampleWithConf(sale);
		logger.info("找到"+list.size()+"条记录");
		for (Sale sale2 : list) {
			logger.info(sale2.toString());
			logger.info("https://blog.csdn.net/qq_33912978/article/details/79838709");
		}
	}
	
	@Test
	public void testFindByPagerWithCond(){
		Pager<SaleVo> pager = new Pager<SaleVo>(1, 2);
		SaleVo saleVo = new SaleVo();
		saleVo.setCustomerName("淘宝");
		saleVo.setProbability(0.5);
		pager.setParam(saleVo);
		//先查记录总数
		int count = saleService.countForPagerWithCond(pager);
		//将记录总数传递给pager进行计算总页数等数据
		pager.setTotal(count);
		//查询数据
		List<SaleVo> list = saleService.findByPagerWithCond(pager);
		logger.info("找到"+count+"条记录");
		for (SaleVo sale2 : list) {
			logger.info(sale2.toString());
			//logger.info("https://blog.csdn.net/qq_33912978/article/details/79838709");
		}
	}
	
	//查找所有客户经理
	@Test
	public void testFindAllCustomerManager() {
		List<User> list = saleService.findAllCustomerManager();
		for (User user : list) {
			System.out.println(user.getId()+user.getAccount());
		}
	}
	
	/**
	 * 批量删除
	 */
	@Test
	public void testDeleteByIdList() {
		int[] a = {149,156};
		int result = saleService.deleteByIdList(a);
		if (result == a.length) {
			System.out.println("success");
		}
	}
	
	/**
	 * 通过用户id查找角色
	 */
	@Test
	public void testFindRoleByUserId() {
		int userId = 4;
		int role = saleService.findRoleById(userId);
		System.out.println(role);
	}
	
	
	
	
}
