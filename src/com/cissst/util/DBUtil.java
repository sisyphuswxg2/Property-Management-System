package com.cissst.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {
	private static String username;
	private static String password;
	private static String url;
	private static String driver;
	
	static{
		Properties prop = new Properties();
		InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("database.properties");
		try {
			prop.load(is);
			if(prop != null){
				username = prop.getProperty("username");
				password = prop.getProperty("password");
				url = prop.getProperty("url");
				driver = prop.getProperty("driver");
				Class.forName(driver);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void close(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt){
		if(stmt != null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs){
		if(rs != null){
			 try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
