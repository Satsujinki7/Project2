package vo;

public class EtcboardVo {
	private int eboardnum;
	private String eboarddate ;
	private String eboardtitle ;
	private String eboardwriter;
	private String eboardcontent;
	private String eboardimg;
	private int eboardhits;
	private int	eboardnomination;
	private int eboardtoday;
	private int eboardflag;
	private String etctag;
	
	public EtcboardVo() {	}
	
	public EtcboardVo(int eboardnum, String eboarddate, String eboardtitle, String eboardwriter, String eboardcontent,
			String eboardimg, int eboardhits, int eboardnomination, int eboardtoday, int eboardflag) {
		super();
		this.eboardnum = eboardnum;
		this.eboarddate = eboarddate;
		this.eboardtitle = eboardtitle;
		this.eboardwriter = eboardwriter;
		this.eboardcontent = eboardcontent;
		this.eboardimg = eboardimg;
		this.eboardhits = eboardhits;
		this.eboardnomination = eboardnomination;
		this.eboardtoday = eboardtoday;
		this.eboardflag = eboardflag;
	}
	
	
	
	
	public EtcboardVo(int eboardnum, String eboarddate, String eboardtitle, String eboardwriter, String eboardcontent,
			String eboardimg, int eboardhits, int eboardnomination, int eboardtoday, int eboardflag, String etctag) {
		super();
		this.eboardnum = eboardnum;
		this.eboarddate = eboarddate;
		this.eboardtitle = eboardtitle;
		this.eboardwriter = eboardwriter;
		this.eboardcontent = eboardcontent;
		this.eboardimg = eboardimg;
		this.eboardhits = eboardhits;
		this.eboardnomination = eboardnomination;
		this.eboardtoday = eboardtoday;
		this.eboardflag = eboardflag;
		this.etctag = etctag;
	}

	public int getEboardnum() {
		return eboardnum;
	}

	public void setEboardnum(int eboardnum) {
		this.eboardnum = eboardnum;
	}

	public String getEboarddate() {
		return eboarddate;
	}

	public void setEboarddate(String eboarddate) {
		this.eboarddate = eboarddate;
	}

	public String getEboardtitle() {
		return eboardtitle;
	}

	public void setEboardtitle(String eboardtitle) {
		this.eboardtitle = eboardtitle;
	}

	public String getEboardwriter() {
		return eboardwriter;
	}

	public void setEboardwriter(String eboardwriter) {
		this.eboardwriter = eboardwriter;
	}

	public String getEboardcontent() {
		return eboardcontent;
	}

	public void setEboardcontent(String eboardcontent) {
		this.eboardcontent = eboardcontent;
	}

	public String getEboardimg() {
		return eboardimg;
	}

	public void setEboardimg(String eboardimg) {
		this.eboardimg = eboardimg;
	}

	public int getEboardhits() {
		return eboardhits;
	}

	public void setEboardhits(int eboardhits) {
		this.eboardhits = eboardhits;
	}

	public int getEboardnomination() {
		return eboardnomination;
	}

	public void setEboardnomination(int eboardnomination) {
		this.eboardnomination = eboardnomination;
	}

	public int getEboardtoday() {
		return eboardtoday;
	}

	public void setEboardtoday(int eboardtoday) {
		this.eboardtoday = eboardtoday;
	}

	public int getEboardflag() {
		return eboardflag;
	}

	public void setEboardflag(int eboardflag) {
		this.eboardflag = eboardflag;
	}

	public String getEtctag() {
		return etctag;
	}

	public void setEtctag(String etctag) {
		this.etctag = etctag;
	}

	
	

	
}
