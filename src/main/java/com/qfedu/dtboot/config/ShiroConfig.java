package com.qfedu.dtboot.config;


import com.qfedu.dtboot.shiro.UserRealm;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by helen on 2018/3/6
 * Shiro配置
 *
 */
@Configuration
public class ShiroConfig {

    //@Autowired
    //private SysConfigService sysConfigService;

    /**
     * session管理器
     * @return
     */
    @Bean(name = "sessionManager")
    public SessionManager sessionManager(){
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        //设置session过期时间为1小时(单位：毫秒)，默认为30分钟
        sessionManager.setGlobalSessionTimeout(60 * 60 * 1000);
        //扫描session线程,负责清理超时会话
        sessionManager.setSessionValidationSchedulerEnabled(true);
        //去掉URL中的JSESSIONID
        sessionManager.setSessionIdUrlRewritingEnabled(false);
        return sessionManager;
    }

    @Bean(name = "securityManager")
    public SecurityManager securityManager(UserRealm userRealm, SessionManager sessionManager){

        //密码加密规则
        /*HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("md5");
        credentialsMatcher.setHashIterations(1024);
        userRealm.setCredentialsMatcher(credentialsMatcher);*/

        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm);
        securityManager.setSessionManager(sessionManager);

        //记住我
        CookieRememberMeManager rememberMeManager = new CookieRememberMeManager();
        Cookie cookie = rememberMeManager.getCookie();
        cookie.setMaxAge(60000);//秒
        rememberMeManager.setCookie(cookie);
        securityManager.setRememberMeManager(rememberMeManager);

        //缓存
        EhCacheManager cacheManager = new EhCacheManager();
        cacheManager.setCacheManagerConfigFile("classpath:ehcache.xml");
        securityManager.setCacheManager(cacheManager);

        return securityManager;
    }

    /**
     * 过滤器
     * @param securityManager
     * @return
     */
    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);
        shiroFilter.setLoginUrl("/login.html");//登录
        shiroFilter.setSuccessUrl("/index.html");//认证成功
        //shiroFilter.setUnauthorizedUrl("/unauthorized.html");//未授权
        shiroFilter.setUnauthorizedUrl("/unauthorized.json");//未授权

        //anon：它对应的过滤器里面是空的,什么都没做,这里.do和.jsp后面的*表示参数,比方说login.jsp?main -->
        //authc：该过滤器下的页面必须验证后才能访问,它是Shiro内置的一个拦截器org.apache.shiro.web.filter.authc.FormAuthenticationFilter
        Map<String, String> filterMap = new LinkedHashMap<>();
        filterMap.put("/public/**", "anon");

        filterMap.put("/login.html", "anon");
        filterMap.put("/sys/login", "anon");
        filterMap.put("/captcha.jpg", "anon");

        //具有admin角色的用户才能访问 /sys/menu/del
        //filterMap.put("/sys/menu/del", "roles[admin]");
        //具有sys:menu:update权限的用户才能访问 /sys/menu/update

        //资源权限验证
       /* filterMap.put("/sys/menu/list", "perms[sys:menu:list]");
        filterMap.put("/sys/menu/del", "perms[sys:menu:delete]");
        filterMap.put("/sys/menu/save", "perms[sys:menu:save]");
        filterMap.put("/sys/menu/update", "perms[sys:menu:update]");
        filterMap.put("/sys/menu/select", "perms[sys:menu:select]");
        filterMap.put("/sys/menu/info/**", "perms[sys:menu:info]");*/

        /*System.out.println(sysConfigService);
        List<SysConfig> sysConfigList = sysConfigService.queryByKeyPrefix("SHIRO_FILTER_CONFIG_%");
        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
        for (SysConfig sysConfig : sysConfigList) {
            String value = sysConfig.getValue();
            String[] array = value.split("=");
            filterMap.put(array[0], array[1]);
        }*/

        //记住我
        filterMap.put("/**", "user");

        //Map<String, String> filterMap = new FilterChainDefinitionMapBuilder().buildFilter();
        shiroFilter.setFilterChainDefinitionMap(filterMap);

        return shiroFilter;
    }

    /**
     * 保证实现了Shiro内部lifecycle函数的bean执行
     * @return
     */
    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     *开启Shiro的注解,需借助SpringAOP扫描使用Shiro注解的类,并在必要时进行安全逻辑验证
     *配置以下两个bean即可实现此功能
     * @return
     */
    @Bean(name = "defaultAdvisorAutoProxyCreator")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator proxyCreator = new DefaultAdvisorAutoProxyCreator();
        proxyCreator.setProxyTargetClass(true);
        return proxyCreator;
    }

    @Bean(name = "authorizationAttributeSourceAdvisor")
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager);
        return advisor;
    }

}
