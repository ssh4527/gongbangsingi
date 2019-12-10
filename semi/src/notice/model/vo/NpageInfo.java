package notice.model.vo;

public class NpageInfo {
	
	private int NcurrentPage;
	private int NlistCount;
	private int NpageLimit;
	private int NmaxPage;
	private int NstartPage;
	private int NendPage;
	private int NLimit;
	
	public NpageInfo() {}

	public int getNcurrentPage() {
		return NcurrentPage;
	}

	public void setNcurrentPage(int ncurrentPage) {
		NcurrentPage = ncurrentPage;
	}

	public int getNlistCount() {
		return NlistCount;
	}

	public void setNlistCount(int nlistCount) {
		NlistCount = nlistCount;
	}

	public int getNpageLimit() {
		return NpageLimit;
	}

	public void setNpageLimit(int npageLimit) {
		NpageLimit = npageLimit;
	}

	public int getNmaxPage() {
		return NmaxPage;
	}

	public void setNmaxPage(int nmaxPage) {
		NmaxPage = nmaxPage;
	}

	public int getNstartPage() {
		return NstartPage;
	}

	public void setNstartPage(int nstartPage) {
		NstartPage = nstartPage;
	}

	public int getNendPage() {
		return NendPage;
	}

	public void setNendPage(int nendPage) {
		NendPage = nendPage;
	}

	public int getNLimit() {
		return NLimit;
	}

	public void setNLimit(int nLimit) {
		NLimit = nLimit;
	}

	public NpageInfo(int ncurrentPage, int nlistCount, int npageLimit, int nmaxPage, int nstartPage, int nendPage,
			int nLimit) {
		super();
		NcurrentPage = ncurrentPage;
		NlistCount = nlistCount;
		NpageLimit = npageLimit;
		NmaxPage = nmaxPage;
		NstartPage = nstartPage;
		NendPage = nendPage;
		NLimit = nLimit;
	}

	@Override
	public String toString() {
		return "NpageInfo [NcurrentPage=" + NcurrentPage + ", NlistCount=" + NlistCount + ", NpageLimit=" + NpageLimit
				+ ", NmaxPage=" + NmaxPage + ", NstartPage=" + NstartPage + ", NendPage=" + NendPage + ", NLimit="
				+ NLimit + "]";
	}

}