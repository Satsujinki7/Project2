package vo;

public class BoardV2_VO {
	private int boardNum;
	private String boardDate;
	private String boardWriter;
	private String boardTitle;
	private String boardContents;
	private int status;
	private int boardHits;
	private int boardNomination;
	private String boardImage;
	private int groupNum;
	private int parentNum;
	private int depth;
	private int indent;
	
	public BoardV2_VO() {
		
	}

	public BoardV2_VO(int boardNum, String boardDate, String boardWriter, String boardTitle, String boardContents,
			int status, int boardHits, int boardNomination, String boardImage, int groupNum, int parentNum, int depth,
			int indent) {
		super();
		this.boardNum = boardNum;
		this.boardDate = boardDate;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.status = status;
		this.boardHits = boardHits;
		this.boardNomination = boardNomination;
		this.boardImage = boardImage;
		this.groupNum = groupNum;
		this.parentNum = parentNum;
		this.depth = depth;
		this.indent = indent;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}

	public int getBoardNomination() {
		return boardNomination;
	}

	public void setBoardNomination(int boardNomination) {
		this.boardNomination = boardNomination;
	}

	public String getBoardImage() {
		return boardImage;
	}

	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getParentNum() {
		return parentNum;
	}

	public void setParentNum(int parentNum) {
		this.parentNum = parentNum;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}
}
