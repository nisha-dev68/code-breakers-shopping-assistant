package com.codebreakers.darkpattern;
public class PatternResult {
 private final String name,description,severity,icon;
 public PatternResult(String n,String d,String s,String i){name=n;description=d;severity=s;icon=i;}
 public String getName(){return name;} public String getDescription(){return description;}
 public String getSeverity(){return severity;} public String getIcon(){return icon;}
}
