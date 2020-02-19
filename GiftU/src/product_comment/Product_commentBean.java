package product_comment;

import java.sql.Timestamp;

public class Product_commentBean {
   private int num_c; 
   private String name;  
   private String content;
   private Timestamp date;
   private int num;
   private int ref;
   private int lev;
   private int seq;
   private int starcount;
   private int comment_num;
   private String filename;

   

public int getStarcount() {
	return starcount;
}



public void setStarcount(int starcount) {
	this.starcount = starcount;
}



public int getComment_num() {
	return comment_num;
}



public void setComment_num(int comment_num) {
	this.comment_num = comment_num;
}



public String getFilename() {
	return filename;
}



public void setFilename(String filename) {
	this.filename = filename;
}



public int getRef() {
	return ref;
}



public void setRef(int ref) {
	this.ref = ref;
}



public Product_commentBean(int num_c, String name, String content, Timestamp date, int num,int ref) {
	super();
	this.num_c = num_c;
	this.name = name;
	this.content = content;
	this.date = date;
	this.num = num;
	this.ref=ref;
}



public int getNum_c() {
	return num_c;
}



public void setNum_c(int num_c) {
	this.num_c = num_c;
}



public String getName() {
	return name;
}



public void setName(String name) {
	this.name = name;
}



public String getContent() {
	return content;
}



public void setContent(String content) {
	this.content = content;
}



public Timestamp getDate() {
	return date;
}



public void setDate(Timestamp date) {
	this.date = date;
}



public int getNum() {
	return num;
}



public void setNum(int num) {
	this.num = num;
}



public Product_commentBean() {}
   
  
public int getLev() {
	return lev;
}



public void setLev(int lev) {
	this.lev = lev;
}



public int getSeq() {
	return seq;
}



public void setSeq(int seq) {
	this.seq = seq;
}



}