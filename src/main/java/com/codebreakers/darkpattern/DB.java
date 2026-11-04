package com.codebreakers.darkpattern;
import java.sql.*;
public final class DB {
 private DB(){}
 public static Connection get() throws SQLException {
	 try { Class.forName("com.mysql.cj.jdbc.Driver");} catch (ClassNotFoundException e) {throw new SQLException(e);}
  String url=System.getenv().getOrDefault("DPA_DB_URL","jdbc:mysql://localhost:3306/darkpattern_assistant?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
  String user=System.getenv().getOrDefault("DPA_DB_USER","root");
  String pass=System.getenv().getOrDefault("DPA_DB_PASSWORD","");
  return DriverManager.getConnection(url,user,pass);
 }
}