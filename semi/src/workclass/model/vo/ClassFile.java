package workclass.model.vo;

public class ClassFile {
	private String fsNo;
	private String originName;
	private String changeName;
	private String destination;
	private int fileLevel;
	private String filePath;	// 파일이 저장 된 경로
	
	public ClassFile() {}
	
	
	


	public ClassFile(String fsNo, String originName, String changeName, String destination, int fileLevel,
			String filePath) {
		super();
		this.fsNo = fsNo;
		this.originName = originName;
		this.changeName = changeName;
		this.destination = destination;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
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

	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public String getFilePath() {
		return filePath;
	}





	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}





	@Override
	public String toString() {
		return "ClassFile [fsNo=" + fsNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", destination=" + destination + ", fileLevel=" + fileLevel + ", filePath=" + filePath + "]"+"\n";
	}







	
	
	
}
