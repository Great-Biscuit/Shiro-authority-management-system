package com.qfedu.dtboot.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.qfedu.dtboot.utils.R;
import com.qfedu.dtboot.utils.ShiroUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

/**
 * 登录相关
 */
@Controller
public class SysLoginController {

    @Autowired
    private Producer producer;

    /**
     * 生成验证码
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping("/captcha.jpg")
    public void captcha(HttpServletResponse response)throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        //生成文字验证码
        String text = producer.createText();
        //生成图片验证码
        BufferedImage image = producer.createImage(text);
        //保存到shiro session（注意：如果没有securityManager配置，则暂时无法工作，测试时先注释掉）
        ShiroUtils.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        out.flush();
    }


    /**
     * 登录
     */
    @ResponseBody
    @PostMapping("/sys/login")
    public R login(@RequestBody Map<String, String> map)throws IOException {

        String username = map.get("username");
        String password = map.get("password");
        String captcha = map.get("captcha");
        String rememberMe = map.get("rememberMe");

        String kaptcha = ShiroUtils.getKaptcha(Constants.KAPTCHA_SESSION_KEY);
        if(!captcha.equalsIgnoreCase(kaptcha)){
            return R.error("验证码不正确");
        }


        Boolean remember = false;
        if(rememberMe != null) {
            remember = true;
        }

        try{
            Subject subject = ShiroUtils.getSubject();

            //加密用户输入的密码
            password = new Md5Hash(password, username, 1024).toHex();
            System.out.println("password："+ password);
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(remember);
            subject.login(token);

        }catch (UnknownAccountException e) {
            return R.error(e.getMessage());
        }catch (IncorrectCredentialsException e) {
            return R.error(e.getMessage());
        }catch (LockedAccountException e) {
            return R.error(e.getMessage());
        }catch (AuthenticationException e) {
            return R.error("账户验证失败");
        }

        return R.ok();
    }

    /**
     * 退出
     */
    @GetMapping("logout")
    public String logout() {
        ShiroUtils.logout();
        return "redirect:login.html";
    }
}
