package com.codebreakers.darkpattern;

import java.sql.*;
import java.util.*;

public final class HistoryDAO {

 public static long save(Integer userId, AnalysisResult a) throws SQLException {
  try (Connection c = DB.get()) {
   long productId;
   try (PreparedStatement p = c.prepareStatement("INSERT INTO products(name,url) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS)) {
    p.setString(1, a.productName);
    p.setString(2, a.productUrl);
    p.executeUpdate();
    try (ResultSet r = p.getGeneratedKeys()) { r.next(); productId = r.getLong(1); }
   }
   try (PreparedStatement p = c.prepareStatement("INSERT INTO analysis_history(user_id,product_id,score,risk_level,risk_label,created_at) VALUES(?,?,?,?,?,CURRENT_TIMESTAMP)", Statement.RETURN_GENERATED_KEYS)) {
    if (userId == null) p.setNull(1, Types.INTEGER); else p.setInt(1, userId);
    p.setLong(2, productId);
    p.setInt(3, a.score);
    p.setString(4, a.riskLevel);
    p.setString(5, a.riskLabel);
    p.executeUpdate();
    try (ResultSet r = p.getGeneratedKeys()) { r.next(); return r.getLong(1); }
   }
  }
 }

 private static Map<String,Object> row(ResultSet r) throws SQLException {
  Map<String,Object> m = new HashMap<>();
  m.put("id", r.getLong("id"));
  m.put("name", r.getString("name"));
  m.put("url", r.getString("url"));
  m.put("score", r.getInt("score"));
  m.put("riskLevel", r.getString("risk_level"));
  m.put("riskLabel", r.getString("risk_label"));
  m.put("createdAt", r.getTimestamp("created_at"));
  return m;
 }
 
 public static boolean deleteOwn(long historyId, int userId) throws SQLException {
	  try (Connection c = DB.get()) {
	   long productId;
	   try (PreparedStatement p = c.prepareStatement("SELECT product_id FROM analysis_history WHERE id=? AND user_id=?")) {
	    p.setLong(1, historyId);
	    p.setInt(2, userId);
	    try (ResultSet r = p.executeQuery()) {
	     if (!r.next()) return false;
	     productId = r.getLong(1);
	    }
	   }
	   try (PreparedStatement p = c.prepareStatement("DELETE FROM analysis_history WHERE id=? AND user_id=?")) {
	    p.setLong(1, historyId);
	    p.setInt(2, userId);
	    p.executeUpdate();
	   }
	   try (PreparedStatement p = c.prepareStatement("DELETE FROM products WHERE id=? AND NOT EXISTS (SELECT 1 FROM analysis_history WHERE product_id=?)")) {
	    p.setLong(1, productId);
	    p.setLong(2, productId);
	    p.executeUpdate();
	   }
	   return true;
	  }
	 }

 public static List<Map<String,Object>> list(Integer userId) throws SQLException {
  List<Map<String,Object>> out = new ArrayList<>();
  String sql = "SELECT h.id,p.name,p.url,h.score,h.risk_level,h.risk_label,h.created_at FROM analysis_history h JOIN products p ON p.id=h.product_id WHERE h.user_id=? ORDER BY h.created_at DESC LIMIT 100";
  try (Connection c = DB.get(); PreparedStatement p = c.prepareStatement(sql)) {
   p.setInt(1, userId);
   try (ResultSet r = p.executeQuery()) { while (r.next()) out.add(row(r)); }
  }
  return out;
 }

 public static List<Map<String,Object>> recent() throws SQLException {
  List<Map<String,Object>> out = new ArrayList<>();
  String sql = "SELECT h.id,p.name,p.url,h.score,h.risk_level,h.risk_label,h.created_at FROM analysis_history h JOIN products p ON p.id=h.product_id ORDER BY h.created_at DESC LIMIT 30";
  try (Connection c = DB.get(); PreparedStatement p = c.prepareStatement(sql); ResultSet r = p.executeQuery()) {
   while (r.next()) out.add(row(r));
  }
  return out;
 }
}