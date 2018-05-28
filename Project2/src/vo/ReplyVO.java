package vo;

public class ReplyVO {
	private int replyNum;
	private int replyBoardNum;
	private String replyWriter;
	private String replyDate;
	private String replyComment;
	private int groupNum;
	private int depth;
	private int orderNum;
	private int parentReplyNum;
	
	public ReplyVO() {
		
	}

	public ReplyVO(int replyNum, int replyBoardNum, String replyWriter, String replyDate, String replyComment,
			int groupNum, int depth, int orderNum, int parentReplyNum) {
		super();
		this.replyNum = replyNum;
		this.replyBoardNum = replyBoardNum;
		this.replyWriter = replyWriter;
		this.replyDate = replyDate;
		this.replyComment = replyComment;
		this.groupNum = groupNum;
		this.depth = depth;
		this.orderNum = orderNum;
		this.parentReplyNum = parentReplyNum;
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

	public String getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getParentReplyNum() {
		return parentReplyNum;
	}

	public void setParentReplyNum(int parentReplyNum) {
		this.parentReplyNum = parentReplyNum;
	}
	
}
