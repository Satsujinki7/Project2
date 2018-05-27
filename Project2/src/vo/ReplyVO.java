package vo;

public class ReplyVO {
	private int replyNum;
	private int replyBoardNum;
	private String replyWriter;
	private String replyDate;
	private int replyParent;
	private String replyComment;
	
	public ReplyVO() {
		
	}

	public ReplyVO(int replyNum, int replyBoardNum, String replyWriter, String replyDate, int replyParent,
			String replyComment) {
		super();
		this.replyNum = replyNum;
		this.replyBoardNum = replyBoardNum;
		this.replyWriter = replyWriter;
		this.replyDate = replyDate;
		this.replyParent = replyParent;
		this.replyComment = replyComment;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getReplyBoardNum() {
		return replyBoardNum;
	}

	public void setReplyBoardNum(int replyBoardNum) {
		this.replyBoardNum = replyBoardNum;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public int getReplyParent() {
		return replyParent;
	}

	public void setReplyParent(int replyParent) {
		this.replyParent = replyParent;
	}

	public String getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}
}
