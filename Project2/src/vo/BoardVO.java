package vo;

public class BoardVO {
	private int boardNum;
	private String userID;
	private String title;
	private String contents;
	private int viewNum;
	private int nominationNum;
	
	public BoardVO() {
		
	}

	public BoardVO(int boardNum, String userID, String title, String contents, int viewNum, int nominationNum) {
		super();
		this.boardNum = boardNum;
		this.userID = userID;
		this.title = title;
		this.contents = contents;
		this.viewNum = viewNum;
		this.nominationNum = nominationNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public int getNominationNum() {
		return nominationNum;
	}

	public void setNominationNum(int nominationNum) {
		this.nominationNum = nominationNum;
	}
}
