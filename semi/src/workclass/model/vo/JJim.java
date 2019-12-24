package workclass.model.vo;

public class JJim {
	private String c_id;
	private String wc_no;
	
	public JJim() {}

	public JJim(String c_id, String wc_no) {
		super();
		this.c_id = c_id;
		this.wc_no = wc_no;
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
		return "JJim [c_id=" + c_id + ", wc_no=" + wc_no + "]";
	}
	
}
