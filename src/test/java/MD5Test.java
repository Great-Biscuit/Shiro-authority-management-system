import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

/**
 * Created by helen on 2018/3/5
 */
public class MD5Test {

    @Test
    public void testMD5(){

        //原始 密码
        String source = "123456";
        //盐
        String salt = "helen";
        //散列次数
        int hashIterations = 1024;

        //构造方法：
        //第一个参数：散列算法
        //第二个参数：明文，原始密码
        //第三个参数：盐，通过使用随机数
        //第四个参数：散列的次数，比如散列两次，相当 于md5(md5(''))
        //SimpleHash simpleHash = new Sha256Hash(source, salt, hashIterations);
        SimpleHash simpleHash = new SimpleHash("md5", source, salt, hashIterations);
        String md5 =  simpleHash.toString();
        System.out.println(md5);
    }


    @Test
    public void testMD52(){
        String password = "1";
        String salt = "admin";
        int hashIterations = 1024;
        password = new Md5Hash(password, salt, hashIterations).toHex();
        System.out.println(password);
    }

    @Test
    public void testSha256(){
        String password = "123456";
        String salt = "helen";
        int hashIterations = 1024;
        password = new Sha256Hash(password, salt, hashIterations).toHex();
        System.out.println(password);
    }
}
