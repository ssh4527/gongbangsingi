package jjim.model.vo;

public class Jjim {

	private String c_id;
	private String wc_no;
	private String wc_name;

	public Jjim() {}

	public Jjim(String c_id, String wc_no, String wc_name) {
		super();
		this.c_id = c_id;
		this.wc_no = wc_no;
		this.wc_name = wc_name;
	}

	public Jjim(String wc_no, String wc_name) {
		super();
		this.wc_no = wc_no;
		this.wc_name = wc_name;
	}


	public String getWc_name() {
		return wc_name;
	}

	public void setWc_name(String wc_name) {
		this.wc_name = wc_name;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getWc_no() {
		return wc_no;
	}

	public void setWc_no(String wc_no) {
		this.wc_no = wc_no;
	}

	@Override
	public String toString() {
		return "Jjim [c_id=" + c_id + ", wc_no=" + wc_no + "]";
	}
	
	
}
