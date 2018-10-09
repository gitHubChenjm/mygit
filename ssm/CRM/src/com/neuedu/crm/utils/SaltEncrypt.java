package com.neuedu.crm.utils;

import java.security.MessageDigest;
import org.apache.commons.codec.binary.Hex;
import org.apache.log4j.Logger;
import org.junit.Test;
 
public class SaltEncrypt {
	
	Logger logger = Logger.getLogger(SaltEncrypt.class);
	
	String saltPassword = "";
	
	/**
	 * 生成含有随机盐的密码
	 */
	public String generate(String password,String username) {

 		//logger.info("salt:"+username);
 		//logger.info("password:"+password);
 		saltPassword = md5Hex(password + username);
 		//logger.info("saltPassword:"+saltPassword);
		return new String(saltPassword);
	}
 
	/**
	 * 校验密码是否正确
	 */
	public boolean verify(String password, String username) {
 		
		return md5Hex(password + username).equals(saltPassword);
	}
 
	/**
	 * 获取十六进制字符串形式的MD5摘要,生成密码
	 */
	public String md5Hex(String src) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] bs = md5.digest(src.getBytes());
			return new String(new Hex().encode(bs));
		} catch (Exception e) {
			return null;
		}
	}
 
	/*//@Test
	public void start() {
		String salt = "楚子航";		
		String password = "123456";
		saltPassword = generate(password,salt);
		System.out.println(verify(password, salt));
	}*/
	public static void main(String[] args) {
		SaltEncrypt saltEncrypt = new SaltEncrypt();
		String salt = "ddd";		
		String password = "123456";
		String saltPassword = saltEncrypt.generate(password,salt);
		System.out.println(saltPassword);
		System.out.println(saltEncrypt.verify("123456", salt));
	}
}

