import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.search.FromStringTerm;

public class SendMail {
	//发送失败返回的消息
	public static String errorMsg;
	public static String from = "chenjiaman000@qq.com";//发件人,默认为我
	public static String key = "ouubgfqabsiybhhh";//密码，默认值
	public static void sendEasyMail(String from,String key,String to,String head,String context) {
		 /**
		  * 设置默认值
		  */
		
		if("".equals(from) || from == null) {
			from = SendMail.from;
		}
		if("".equals("key")|| key == null) {
			key = SendMail.key;
		}
		String fString = from;
		String kString = key;
		//发送邮件的主机,qq的服务器，以后要改就设置为参数输入。
		  String host = "smtp.qq.com";
		
		 // 获取系统属性
	      Properties properties = System.getProperties();
	 
	      // 设置邮件服务器
	      properties.setProperty("mail.smtp.host", host);
	 
	      properties.put("mail.smtp.auth", "true");
	      // 获取默认session对象
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
	        public PasswordAuthentication getPasswordAuthentication()
	        {
		         //发件人邮件用户名、密码
		         //密码在qq邮箱设置里面，如果有需要换发送方，可以
		         //使用参数来输入
	         return new PasswordAuthentication(fString, kString); 
	        }
	       });
	 
	      try{
	         // 创建默认的 MimeMessage 对象
	         MimeMessage message = new MimeMessage(session);
	 
	         // Set From: 头部头字段
	         message.setFrom(new InternetAddress(from));
	 
	         // Set To: 头部头字段
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));
	 
	         // Set Subject: 头部头字段
	         message.setSubject(head);
	 
	         // 设置消息体
	         message.setText(context);
	         
	 
	         // 发送消息
	         Transport.send(message);
	         System.out.println("hhhhhhhhhsuccessfully");
	      }catch (SendFailedException e) {
				errorMsg="请检查是否存在邮件，或者格式是否正确。";
		  }catch (MessagingException mex) {
	        	errorMsg="发送失败，未知错误！！";
	      }

	}
	public static void main(String[] args) {
		//传入参数为收件人
		/**使用手册
		 * 1.设置发送人的邮箱和授权码，授权码自行百度。默认使用在下废渣的from--key---,传入null
		 * 2.设置收件人的邮箱--to
		 * 3.设置邮件标题---head
		 * 4.设置邮件的内容---context
		 */
		String from = null;
		String key = null;
		String to = "chenjiaman000@qq.com";
		String head = "薯仔crm系统服务反馈中心";
		String context = "感谢贵公司使用本系统，现在需要您宝贵的意见，使用本系统如果觉得满意请发送1，非常满意请发送2，不满意请发送3";
		
		SendMail.sendEasyMail(from,key,to,head,context);
		
	}
}
