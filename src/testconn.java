/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author barodev
 */
import java.sql.*;

import Project.ConnectionProvider;
import java.sql.Connection;

public class testconn {
    public static void main(String[] args) {
        Connection con= ConnectionProvider.getCon();
    }
    
}

