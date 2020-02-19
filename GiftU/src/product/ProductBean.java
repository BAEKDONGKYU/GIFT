package product;

import java.sql.Timestamp;

public class ProductBean {
   private int num; 
   private String name;  
   private int price; 
   private String event; 
   private String gender; 
   private int age; 
   private int inventory; 
   private String content; 
   private String filename; 
   private String filename1;
   private String filename2;
   private int readcount; 
   private Timestamp date; 
   private int sell;
   private int review_count;
   
   public int getReview_count() {
	return review_count;
}

public void setReview_count(int review_count) {
	this.review_count = review_count;
}

public ProductBean() {}
   
   public ProductBean(int num, String name, int price, String event, String gender, int age, int inventory, String content,
		String filename) {
	this.num = num;
	this.name = name;
	this.price = price;
	this.event = event;
	this.gender = gender;
	this.age = age;
	this.inventory = inventory;
	this.content = content;
	this.filename = filename;
}




   
public String getFilename1() {
	return filename1;
}

public void setFilename1(String filename1) {
	this.filename1 = filename1;
}

public String getFilename2() {
	return filename2;
}

public void setFilename2(String filename2) {
	this.filename2 = filename2;
}

public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getEvent() {
      return event;
   }
   public void setEvent(String event) {
      this.event = event;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public int getInventory() {
      return inventory;
   }
   public void setInventory(int inventory) {
      this.inventory = inventory;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   public int getReadcount() {
      return readcount;
   }
   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }
   public Timestamp getDate() {
      return date;
   }
   public void setDate(Timestamp date) {
      this.date = date;
   }
   public int getSell() {
      return sell;
   }
   public void setSell(int sell) {
      this.sell = sell;
   }
   
   
   
   
}