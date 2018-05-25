package vo;

public class PrdboardVo {
	private int pboardnum;
	private String pboarddate ;
	private String pboardtitle ;
	private String pboardwriter;
	private String pboardcontent;
	private String pboardimg;
	private int pboardhits;
	private int pboardnomination;
	private int pboardtoday;
	private int pboardflag;
	
	public PrdboardVo() {	}

	public PrdboardVo(int pboardnum, String pboarddate, String pboardtitle, String pboardwriter, String pboardcontent,
			String pboardimg, int pboardhits, int pboardnomination, int pboardtoday, int pboardflag) {
		super();
		this.pboardnum = pboardnum;
		this.pboarddate = pboarddate;
		this.pboardtitle = pboardtitle;
		this.pboardwriter = pboardwriter;
		this.pboardcontent = pboardcontent;
		this.pboardimg = pboardimg;
		this.pboardhits = pboardhits;
		this.pboardnomination = pboardnomination;
		this.pboardtoday = pboardtoday;
		this.pboardflag = pboardflag;
	}

	public int getPboardnum() {
		return pboardnum;
	}

	public void setPboardnum(int pboardnum) {
		this.pboardnum = pboardnum;
	}

	public String getPboarddate() {
		return pboarddate;
	}

	public void setPboarddate(String pboarddate) {
		this.pboarddate = pboarddate;
	}

	public String getPboardtitle() {
		return pboardtitle;
	}

	public void setPboardtitle(String pboardtitle) {
		this.pboardtitle = pboardtitle;
	}

	public String getPboardwriter() {
		return pboardwriter;
	}

	public void setPboardwriter(String pboardwriter) {
		this.pboardwriter = pboardwriter;
	}

	public String getPboardcontent() {
		return pboardcontent;
	}

	public void setPboardcontent(String pboardcontent) {
		this.pboardcontent = pboardcontent;
	}

	public String getPboardimg() {
		return pboardimg;
	}

	public void setPboardimg(String pboardimg) {
		this.pboardimg = pboardimg;
	}

	public int getPboardhits() {
		return pboardhits;
	}

	public void setPboardhits(int pboardhits) {
		this.pboardhits = pboardhits;
	}

	public int getPboardnomination() {
		return pboardnomination;
	}

	public void setPboardnomination(int pboardnomination) {
		this.pboardnomination = pboardnomination;
	}

	public int getPboardtoday() {
		return pboardtoday;
	}

	public void setPboardtoday(int pboardtoday) {
		this.pboardtoday = pboardtoday;
	}

	public int getPboardflag() {
		return pboardflag;
	}

	public void setPboardflag(int pboardflag) {
		this.pboardflag = pboardflag;
	}
	
	
	
}
