package demo;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by mingfei.net@gmail.com
 * 2016/5/22.
 */
public class EncryptTest {

    private static final String SALT = "abc123!@#";

    public static void main(String[] args) {
        String password = "123"; // salt
        String encryptedPassword = DigestUtils.md5Hex(password.concat(SALT));
        System.out.println(encryptedPassword);
        System.out.println(encryptedPassword.length());
    }
}

// 撞库
