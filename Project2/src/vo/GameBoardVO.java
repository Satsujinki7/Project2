package vo;

public class GameBoardVO {
	private int gameNum;
	private String gameDate;
	private String gameWriter;
	private String gameTitle;
	private String gameImage;
	private String gameContents;
	private int status;
	private int gameHits;
	private int gameNomination;
	
	public GameBoardVO() {
		
	}

	public GameBoardVO(int gameNum, String gameDate, String gameWriter, String gameTitle, String gameImage,
			String gameContents, int status, int gameHits, int gameNomination) {
		super();
		this.gameNum = gameNum;
		this.gameDate = gameDate;
		this.gameWriter = gameWriter;
		this.gameTitle = gameTitle;
		this.gameImage = gameImage;
		this.gameContents = gameContents;
		this.status = status;
		this.gameHits = gameHits;
		this.gameNomination = gameNomination;
	}

	public int getGameNum() {
		return gameNum;
	}

	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}

	public String getGameDate() {
		return gameDate;
	}

	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}

	public String getGameWriter() {
		return gameWriter;
	}

	public void setGameWriter(String gameWriter) {
		this.gameWriter = gameWriter;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public String getGameImage() {
		return gameImage;
	}

	public void setGameImage(String gameImage) {
		this.gameImage = gameImage;
	}

	public String getGameContents() {
		return gameContents;
	}

	public void setGameContents(String gameContents) {
		this.gameContents = gameContents;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getGameHits() {
		return gameHits;
	}

	public void setGameHits(int gameHits) {
		this.gameHits = gameHits;
	}

	public int getGameNomination() {
		return gameNomination;
	}

	public void setGameNomination(int gameNomination) {
		this.gameNomination = gameNomination;
	}
}
