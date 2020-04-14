package com.cyf.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	    private static String url = "jdbc:mysql://localhost:3306/webstore?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true"; //���ݿ��ַ
	    private static String userName = "root"; //���ݿ��û���
	    private static String passWord = "111111"; // ���ݿ�����
	    private static Connection conn = null;

	    /**
	     * ���ݿ�����
	     *
	     * @return
	     */
	    public static Connection getConnection() {
	        if (null == conn) {
	            try {
	                Class.forName("com.mysql.cj.jdbc.Driver");
	                conn = DriverManager.getConnection(url, userName, passWord);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return conn;
	    }

	    /**
	     * �������ݿ�����
	     *
	     * @param args
	     */
	    public static void main(String[] args) {
	        System.err.println(getConnection());
	    }

}
