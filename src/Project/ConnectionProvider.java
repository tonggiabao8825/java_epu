/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Project;
import java.sql.*;
import java.sql.DriverManager;
/**
 *
 * @author nguyenbanhan
 */
public class ConnectionProvider {
    public static Connection getCon()
    {
        try 
        {
          
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel","root","MySql@808205");
            return con;
        } catch (SQLException e) 
        {
            System.out.println("Err"+ e.getMessage());
            return null;
        }
    }
}
