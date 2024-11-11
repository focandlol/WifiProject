package org.example.wifiproject.db;

import java.sql.*;

public class Db {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlite:C:\\Users\\1\\Desktop\\ggit\\wifi\\src\\main\\wifi.db";
        Class.forName("org.sqlite.JDBC");
        return DriverManager.getConnection(url);
    }

    public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (pstmt != null && !pstmt.isClosed()) {
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
