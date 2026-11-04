package com.codebreakers.darkpattern;
import java.security.*;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
public final class PasswordUtil {
 private PasswordUtil(){}
 public static String hash(String password) throws Exception {
  byte[] salt=new byte[16]; SecureRandom.getInstanceStrong().nextBytes(salt);
  PBEKeySpec spec=new PBEKeySpec(password.toCharArray(),salt,120000,256);
  byte[] key=SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256").generateSecret(spec).getEncoded();
  return "pbkdf2$120000$"+Base64.getEncoder().encodeToString(salt)+"$"+Base64.getEncoder().encodeToString(key);
 }
 public static boolean verify(String password,String stored) throws Exception {
  String[] p=stored.split("\\$"); if(p.length!=4||!p[0].equals("pbkdf2")) return false;
  byte[] salt=Base64.getDecoder().decode(p[2]), expected=Base64.getDecoder().decode(p[3]);
  PBEKeySpec spec=new PBEKeySpec(password.toCharArray(),salt,Integer.parseInt(p[1]),expected.length*8);
  byte[] actual=SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256").generateSecret(spec).getEncoded();
  return MessageDigest.isEqual(expected,actual);
 }
}
