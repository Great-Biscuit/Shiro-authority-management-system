package com.qfedu.dtboot.shiro;

import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.service.SysMenuService;
import com.qfedu.dtboot.service.SysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * Created by helen on 2018/3/6
 */
@Component
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysMenuService sysMenuService;
    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("认证。。。。。。");

        //用户输入
        String usernameInput = (String)token.getPrincipal();
        String passwordInput = new String((char[])token.getCredentials());

        //查询用户是否存在
        SysUser user = sysUserService.queryByUserName(usernameInput);
        if(user == null){
            throw new UnknownAccountException("账号或密码不正确");
        }

        //数据库中存储
        String username = user.getUsername();
        String password = user.getPassword();

        //判断密码是否正确
        if(!passwordInput.equals(password)){
            throw new IncorrectCredentialsException("账号或密码不正确");
        }

        //账号是否被锁定
        if(user.getStatus() == 0){
            throw new LockedAccountException("账号已被锁定，请联系管理员");
        }

        /*ByteSource byteSalt = ByteSource.Util.bytes(username);*/
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, /*byteSalt, */getName());

        return info;
    }

    /**
     * 授权
     * @param principals
     * @return
     */
    /*@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("授权。。。。。。");

        //用户角色列表
        List<String> roleList = Arrays.asList("admin");
        //角色授权
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roleList);

        //用户权限列表
        List<String> permList = Arrays.asList("sys:menu:update");
        //资源授权
        info.addStringPermissions(permList);

        return info;
    }*/


    /**
     * 授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        System.out.println("授权。。。。。。");

        SysUser user = (SysUser)principals.getPrimaryPrincipal();
        Long userId = user.getUserId();

        //用户权限列表
        Set<String> permsSet = sysMenuService.getUserPermissions(userId);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(permsSet);
        return info;
    }
}
