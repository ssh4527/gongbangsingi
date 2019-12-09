package workclass.model.vo;

public class ClassFile {
	private String fsNo;
	private String originName;
	private String changeName;
	private String destination;
	
	public ClassFile() {}
	
	public ClassFile(String fsNo, String originName, String changeName, String destination) {
		super();
		this.fsNo = fsNo;
		this.originName = originName;
		this.changeName = changeName;
		this.destination = destination;
	}

	public String getFsNo() {
		return fsNo;
	}

	public void setFsNo(String fsNo) {
		this.fsNo = fsNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	@Override
	public String toString() {
		return "ClassFile [fsNo=" + fsNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", destination=" + destination + "]";
	}
	
	
	
}
