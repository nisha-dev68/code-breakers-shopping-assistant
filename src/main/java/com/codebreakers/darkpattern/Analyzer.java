package com.codebreakers.darkpattern;
import java.net.*; import java.net.http.*; import java.time.Duration; import java.util.*;
import java.io.IOException;
public final class Analyzer {
 private Analyzer(){}
 public static AnalysisResult analyze(String raw) throws Exception {
  URI uri;
  try { uri=URI.create(raw.trim()); } catch(Exception e){throw new IllegalArgumentException("Enter a valid product URL.");}
  String scheme=uri.getScheme(), host=uri.getHost();
  if(host==null||(!"http".equalsIgnoreCase(scheme)&&!"https".equalsIgnoreCase(scheme))||uri.getUserInfo()!=null)
   throw new IllegalArgumentException("Only valid http/https product URLs are supported.");
  String h=host.toLowerCase(Locale.ROOT);
  if(h.equals("localhost")||h.equals("127.0.0.1")||h.equals("::1")||h.startsWith("10.")||h.startsWith("192.168.")||h.startsWith("169.254.")||h.equals("0.0.0.0"))
   throw new IllegalArgumentException("Local/private URLs cannot be analyzed.");
  HttpClient client=HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(8)).followRedirects(HttpClient.Redirect.NORMAL).build();
  HttpRequest req=HttpRequest.newBuilder(uri).timeout(Duration.ofSeconds(15)).header("User-Agent","Mozilla/5.0 (compatible; DarkPatternAssistant/1.0)").GET().build();
  HttpResponse<String> response;
  try { response=client.send(req,HttpResponse.BodyHandlers.ofString()); }
  catch(IOException e){throw new IllegalArgumentException("Could not fetch this page. The store may block automated requests; try another public product URL.");}
  if(response.statusCode()<200||response.statusCode()>=400) throw new IllegalArgumentException("Store returned HTTP "+response.statusCode()+". Try another product page.");
  String html=response.body(); if(html.length()>2_000_000) html=html.substring(0,2_000_000);
  String text=html.replaceAll("(?is)<script\\b.*?</script>"," ").replaceAll("(?is)<style\\b.*?</style>"," ").replaceAll("(?s)<[^>]+>"," ").replaceAll("&nbsp;"," ").replaceAll("&amp;","&").replaceAll("\\s+"," ");
  AnalysisResult a=new AnalysisResult(); a.productUrl=uri.toString();
  a.productName=meta(html,"og:title"); if(a.productName.isBlank()) a.productName=between(html,"<title","</title>"); if(a.productName.isBlank()) a.productName=host;
  add(a,text,"Fake Urgency","only \\d+ left|hurry|limited time|offer ends|ends in \\d|selling fast|last chance","Urgency or limited-stock wording appears on the page; its truth cannot be verified from one fetch.","high","⏰",20);
  add(a,text,"Misleading Discount","\\b(save|off)\\s*\\d{1,2}\\s*%|\\bwas\\s*₹?\\s*[\\d,]+|\\bmrp\\b|\\b(\\d{1,2})%\\s*off","Discount or reference-price claims were found; historical prices are needed to verify whether the discount is genuine.","medium","🏷️",20);
  add(a,text,"Hidden Charges","convenience fee|handling fee|platform fee|packaging charge|additional charges|shipping fee","The page mentions extra fees; final checkout totals were not available for comparison.","medium","💸",15);
  add(a,text,"Confirm-shaming","no,? i don.t want|no thanks,? i like|don.t want to save|i prefer paying more|miss out on savings","Language that may pressure users to accept an offer was found.","low","🙁",10);
  add(a,text,"Price changed often","price drop|price increased|price changed|price history|price tracker","Price-change wording was found; price history is required to establish repeated changes.","low","📈",10);
  add(a,text,"Countdown never expires","countdown|time left|deal expires|offer expires|ends in","A countdown was found, but a single request cannot establish whether it resets.","medium","⌛",15);
  int deductions=0; for(PatternResult p:a.patterns) deductions+=switch(p.getName()){case "Fake Urgency"->20;case "Misleading Discount"->20;case "Hidden Charges"->15;case "Confirm-shaming"->10;case "Price changed often"->10;case "Countdown never expires"->15;default->0;};
  a.score=Math.max(0,100-deductions);
  a.riskLevel=a.score>=80?"low":a.score>=50?"medium":"high";
  a.riskLabel=a.score>=80?"Low Risk":a.score>=50?"Moderate Risk":"High Risk";
  a.grade=a.score>=90?"A":a.score>=80?"B":a.score>=60?"C":"D";
  a.scoreDescription=a.patterns.isEmpty()?"No listed pattern keywords were detected in the fetched page. This is not a guarantee that the listing is safe.":"Detected "+a.patterns.size()+" possible pattern(s). This is a heuristic screen, not proof of deception.";
  return a;
 }
 private static void add(AnalysisResult a,String text,String name,String regex,String desc,String severity,String icon,int points){
  if(java.util.regex.Pattern.compile(regex,java.util.regex.Pattern.CASE_INSENSITIVE).matcher(text).find())
   a.patterns.add(new PatternResult(name,desc,severity,icon));
 }
 private static String meta(String html,String property){
  java.util.regex.Matcher m=java.util.regex.Pattern.compile("(?is)<meta[^>]*(?:property|name)=[\\\"']"+java.util.regex.Pattern.quote(property)+"[\\\"'][^>]*content=[\\\"']([^\\\"']*)[\\\"'][^>]*>").matcher(html);
  if(!m.find()) return ""; return clean(m.group(1));
 }
 private static String between(String html,String start,String end){
  int s=html.toLowerCase(Locale.ROOT).indexOf(start.toLowerCase(Locale.ROOT)); if(s<0)return "";
  s=html.indexOf('>',s); if(s<0)return ""; int e=html.toLowerCase(Locale.ROOT).indexOf(end.toLowerCase(Locale.ROOT),s);
  return e<0?"":clean(html.substring(s+1,e));
 }
 private static String clean(String s){return s.replaceAll("(?s)<[^>]*>"," ").replace("&amp;","&").replace("&quot;","\"").replaceAll("\\s+"," ").trim();}
}
