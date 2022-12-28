package myBean.DB;

public class Worker {//This is a class that contains information about employee information. Includes getter and setter functions.
	private String workernum;
	private String name;
	private String nickname;
	private String birth;
	private String gender;
	private String entrydate;
	private String entrysection;
	private String rank;
	private String division;
	private String retiredate;
	private String retirereason;
	private String phonenum;
	private String cellphonenum;
	private String email;
	private String address;
	private String bankname;
	private String bankaccount;
	private String bankown;
	private String exc;
	private String photo;
	
	public Worker(){}
	
	public void setWorkernum(String workernum){this.workernum=workernum;}
	public void setName(String name){this.name=name;}
	public void setNickname(String nickname){this.nickname=nickname;}
	public void setBirth(String birth){this.birth=birth;}
	public void setGender(String gender){this.gender=gender;}
	public void setEntrydate(String entrydate){this.entrydate=entrydate;}
	public void setEntersection(String entrysection){this.entrysection=entrysection;}
	public void setRank(String rank){this.rank=rank;}
	public void setDivision(String division){this.division=division;}
	public void setRetiredate(String retiredate){this.retiredate=retiredate;}
	public void setRetirereason(String retirereason){this.retirereason=retirereason;}
	public void setPhonenum(String phonenum){this.phonenum=phonenum;}
	public void setCellphonenum(String cellphonenum){this.cellphonenum=cellphonenum;}
	public void setEmail(String email){this.email=email;}
	public void setAddress(String address){this.address=address;}
	public void setBankname(String bankname){this.bankname=bankname;}
	public void setBankaccount(String bankaccount){this.bankaccount=bankaccount;}
	public void setBankown(String bankown){this.bankown=bankown;}
	public void setExc(String exc){this.exc=exc;}
	public void setPhoto(String photo){this.photo=photo;}
	
	public String getWorkernum(){return workernum;}
	public String getName(){return name;}
	public String getNickname(){return nickname;}
	public String getBirth(){return birth;}
	public String getGender(){return gender;}
	public String getEntrydate(){return entrydate;}
	public String getEntrysection(){return entrysection;}
	public String getRank(){return rank;}
	public String getDivision(){return division;}
	public String getRetiredate(){return retiredate;}
	public String getRetirereason(){return retirereason;}
	public String getPhonenum(){return phonenum;}
	public String getCellphonenum(){return cellphonenum;}
	public String getEmail(){return email;}
	public String getAddress(){return address;}
	public String getBankname(){return bankname;}
	public String getBankaccount(){return bankaccount;}
	public String getBankown(){return bankown;}
	public String getExc(){return exc;}
	public String getPhoto(){return photo;}

}
