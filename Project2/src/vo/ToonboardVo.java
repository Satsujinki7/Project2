package vo;

public class ToonboardVo {
	private int tboardnum;
	private String tboarddate ;
	private String tboardtitle ;
	private String tboardwriter;
	private String tboardcontent;
	private String tboardimg;
	private int tboardhits;
	private int	tboardnomination;
	private int tboardtoday;
	private int tboardflag;
	
	public ToonboardVo() {	}

	public int getTboardnum() {
		return tboardnum;
	}

	public void setTboardnum(int tboardnum) {
		this.tboardnum = tboardnum;
	}

	public String getTboarddate() {
		return tboarddate;
	}

	public void setTboarddate(String tboarddate) {
		this.tboarddate = tboarddate;
	}

	public String getTboardtitle() {
		return tboardtitle;
	}

	public void setTboardtitle(String tboardtitle) {
		this.tboardtitle = tboardtitle;
	}

	public String getTboardwriter() {
		return tboardwriter;
	}

	public void setTboardwriter(String tboardwriter) {
		this.tboardwriter = tboardwriter;
	}

	public String getTboardcontent() {
		return tboardcontent;
	}

	public void setTboardcontent(String tboardcontent) {
		this.tboardcontent = tboardcontent;
	}

	public String getTboardimg() {
		return tboardimg;
	}

	public void setTboardimg(String tboardimg) {
		this.tboardimg = tboardimg;
	}

	public int getTboardhits() {
		return tboardhits;
	}

	public void setTboardhits(int tboardhits) {
		this.tboardhits = tboardhits;
	}

	public int getTboardnomination() {
		return tboardnomination;
	}

	public void setTboardnomination(int tboardnomination) {
		this.tboardnomination = tboardnomination;
	}

	public int getTboardtoday() {
		return tboardtoday;
	}

	public void setTboardtoday(int tboardtoday) {
		this.tboardtoday = tboardtoday;
	}

	public int getTboardflag() {
		return tboardflag;
	}

	public void setTboardflag(int tboardflag) {
		this.tboardflag = tboardflag;
	}

	public ToonboardVo(int tboardnum, String tboarddate, String tboardtitle, String tboardwriter, String tboardcontent,
			String tboardimg, int tboardhits, int tboardnomination, int tboardtoday, int tboardflag) {
		super();
		this.tboardnum = tboardnum;
		this.tboarddate = tboarddate;
		this.tboardtitle = tboardtitle;
		this.tboardwriter = tboardwriter;
		this.tboardcontent = tboardcontent;
		this.tboardimg = tboardimg;
		this.tboardhits = tboardhits;
		this.tboardnomination = tboardnomination;
		this.tboardtoday = tboardtoday;
		this.tboardflag = tboardflag;
	}
	
	
}
