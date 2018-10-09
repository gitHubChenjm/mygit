package com.neuedu.crm.shiro;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.bean.User;
import com.neuedu.crm.service.impl.ListAuthorityImpl;
import com.neuedu.crm.service.impl.UserServiceImpl;
import com.neuedu.crm.utils.SaltEncrypt;

public class UserRealm extends AuthorizingRealm{
	@Autowired
	private ListAuthorityImpl listAuthorityImpl = new ListAuthorityImpl();
	@Autowired
	private UserServiceImpl userServiceImpl = new UserServiceImpl();
	
	private SaltEncrypt saltEncrypt = new SaltEncrypt();
	Logger logger = Logger.getRootLogger();
	/**
	 * 提供用户信息返回权限信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user = (User) principals.getPrimaryPrincipal();
		String account = user.getAccount();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		//设置当前用户用户名
		ListAuthority listAuthority = new ListAuthority();
		listAuthority.setAccount(account);
		
		// 根据用户角色与权限
        List<ListAuthority> listAuthorities = listAuthorityImpl.findByExample(listAuthority);
        //存放角色名字
        Set<String> roleNames = new HashSet<String>();
        for (ListAuthority listAuthoritie2 : listAuthorities) {
        	//经理还是高管
			String name = listAuthoritie2.getRoleName();
			if(!roleNames.contains(name)) {
				roleNames.add(name);
				//logger.info("role " + name);
			}
		}
        // 将角色名称提供给info
        authorizationInfo.setRoles(roleNames);
        //存放权限
        Set<String> permissionNames = new HashSet<String>();
        for (ListAuthority listAuthoritie2 : listAuthorities) {
			String name = listAuthoritie2.getAuthorityMark();
			if(!permissionNames.contains(name)) {
				//logger.info(name);
				permissionNames.add(name);
			}
		}
        // 将权限名称提供给info
        authorizationInfo.setStringPermissions(permissionNames);
        
        return authorizationInfo;
	}
	
	/**
     * 提供账户信息返回认证信息
     */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		/*SecurityUtils.getSubject().logout();*/
		UsernamePasswordToken  token = (UsernamePasswordToken) authcToken;
		String account = (String) token.getUsername();
		String password =  token.getPassword().toString();
		//logger.info("account:"+account + "password:" + password);
        User user = userServiceImpl.findAcount(account);
        if (user == null) {
            // 用户名不存在抛出异常
            throw new UnknownAccountException();
        }
        //logger.info("userRealm:"+user);
        String salt=saltEncrypt.generate(password, account);//数据库密码
        ByteSource byteSource =  ByteSource.Util.bytes(user.getPassword());
        return new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
	}
}
