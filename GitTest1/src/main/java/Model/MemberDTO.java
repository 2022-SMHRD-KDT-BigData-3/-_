package Model;

public class MemberDTO {
	private int seq ;
	private String id;
	private String pw;
	private String nick;
	public MemberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public MemberDTO(String id, String pw, String nick) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}

	public MemberDTO(int seq, String id, String pw, String nick) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
}
