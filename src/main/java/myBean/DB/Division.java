package myBean.DB;

public class Division {//This class contains information about division. Includes getter and setter functions.
	private int idx;
	private String code;
	private String dname;
	private String used;


	public Division() {}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	public int getIdx() {
		return idx;
	}

	public String getCode() {
		return code;
	}

	public String getDname() {
		return dname;
	}

	public String getUsed() {
		return used;
	}

}
