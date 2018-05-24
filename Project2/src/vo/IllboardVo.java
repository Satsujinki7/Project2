package vo;

public class IllboardVo {
	private int iboardnum;
	private String iboarddate ;
	private String iboardtitle ;
	private String iboardwriter;
	private String iboardcontent;
	private String iboardimg;
	private int iboardhits;
	private int	iboardnomination;
	private int iboardtoday;
	private int iboardflag;
	
	public IllboardVo() {}
	
	public IllboardVo(int iboardnum, String iboarddate, String iboardtitle, String iboardwriter, String iboardcontent,
			String iboardimg, int iboardhits, int iboardnomination, int iboardtoday, int iboardflag) {
		super();
		this.iboardnum = iboardnum;
		this.iboarddate = iboarddate;
		this.iboardtitle = iboardtitle;
		this.iboardwriter = iboardwriter;
		this.iboardcontent = iboardcontent;
		this.iboardimg = iboardimg;
		this.iboardhits = iboardhits;
		this.iboardnomination = iboardnomination;
		this.iboardtoday = iboardtoday;
		this.iboardflag = iboardflag;
	}


	public int getIboardnum() {
		return iboardnum;
	}


	public void setIboardnum(int iboardnum) {
		this.iboardnum = iboardnum;
	}


	public String getIboarddate() {
		return iboarddate;
	}


	public void setIboarddate(String iboarddate) {
		this.iboarddate = iboarddate;
	}


	public String getIboardtitle() {
		return iboardtitle;
	}


	public void setIboardtitle(String iboardtitle) {
		this.iboardtitle = iboardtitle;
	}


	public String getIboardwriter() {
		return iboardwriter;
	}


	public void setIboardwriter(String iboardwriter) {
		this.iboardwriter = iboardwriter;
	}


	public String getIboardcontent() {
		return iboardcontent;
	}


	public void setIcoardcontent(String iboardcontent) {
		this.iboardcontent = iboardcontent;
	}


	public String getIboardimg() {
		return iboardimg;
	}


	public void setIboardimg(String iboardimg) {
		this.iboardimg = iboardimg;
	}


	public int getIboardhits() {
		return iboardhits;
	}


	public void setIboardhits(int iboardhits) {
		this.iboardhits = iboardhits;
	}


	public int getIboardnomination() {
		return iboardnomination;
	}


	public void setIboardnomination(int iboardnomination) {
		this.iboardnomination = iboardnomination;
	}


	public int getIboardtoday() {
		return iboardtoday;
	}


	public void setIboardtoday(int iboardtoday) {
		this.iboardtoday = iboardtoday;
	}


	public int getIboardflag() {
		return iboardflag;
	}


	public void setIboardflag(int iboardflag) {
		this.iboardflag = iboardflag;
	}
	
	
}
