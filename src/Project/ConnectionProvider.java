package Project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getCon() {
        try {
            // Nạp driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Kết nối MySQL
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hostel", // tên CSDL
                "root",                               // user
                "123456"                              // mật khẩu
            );

            return con;
        } catch (ClassNotFoundException e) {
            System.out.println("⚠️ Lỗi: Không tìm thấy driver MySQL JDBC!");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.out.println("⚠️ Lỗi kết nối CSDL: " + e.getMessage());
            return null;
        }
    }
}
