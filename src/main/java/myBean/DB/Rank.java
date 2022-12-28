package myBean.DB;

public class Rank {//This is a class that contains information about the position. Includes getter and setter functions.
	private int idx;
	private String code;
	private String rname;
	private String used;


	public Rank() {}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setRname(String rname) {
		this.rname = rname;
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

	public String getRname() {
		return rname;
	}

	public String getUsed() {
		return used;
	}

}
