package demo;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by mingfei.net@gmail.com
 * 2016/5/14.
 */

//JDBC Java DataBase Connectivity
public class DBTest {

    private static  final  String URL = "jdbc:mysql://localhost:3306/demo";
    private static  final  String USER = "root";
    private static  final  String PASSWORD = "system";

    public static void main(String[] args) throws SQLException {
        new Driver(); // 加载驱动
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD); // 连接数据库
        String sql = "INSERT INTO demo.user VALUES (NULL, '张三', '123', 'F', 20, 1.6, 6000, '1996-1-2')"; // SQL语句
        PreparedStatement preparedStatement = connection.prepareStatement(sql); // 预编译语句
        preparedStatement.executeUpdate(); // 执行一次更新
    }
}
