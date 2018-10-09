package com.neuedu.crm.shiro;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ThreadContext;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.neuedu.crm.bean.ListAuthority;
import com.neuedu.crm.service.IListAuthorityService;

/**
 * 用于登录后获取用户导航栏，并将其存入session范围
 * @author admin
 *
 */
public class WithNavibarFormAuthenticationFilter extends FormAuthenticationFilter {

    @Autowired
    private IListAuthorityService listAuthorityServiceImpl;
    Logger logger = Logger.getRootLogger();
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
            ServletResponse response) throws Exception {
        HttpServletRequest httpReq=(HttpServletRequest)request;
       

       String account=(String)SecurityUtils.getSubject().getPrincipal();
        //查找该用户所有权限
        ListAuthority listAuthority = new ListAuthority();
        listAuthority.setAccount(account);
        List<ListAuthority> listAuthorities = listAuthorityServiceImpl.findByExample(listAuthority);
        
       logger.info("权限filter:");
        httpReq.getSession().setAttribute("listAuthorities", listAuthorities);
        return super.onLoginSuccess(token, subject, request, response);
    }

}
