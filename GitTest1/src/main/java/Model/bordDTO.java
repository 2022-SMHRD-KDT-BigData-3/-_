package Model;

public class bordDTO {
	
	private int num;
	

	private String title;
	private String data;
	public bordDTO(String title, String date) {
		super();
		this.title = title;
		this.data = data;
	}
	public bordDTO(int num, String title, String data) {
		super();
		this.num = num;
		this.title = title;
		this.data = data;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getData() {
		return data;
	}

	public void setDate(String data) {
		this.data = data;
	}
	
	


}
