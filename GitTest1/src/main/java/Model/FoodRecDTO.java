package Model;

public class FoodRecDTO {

	private String fname;
	private int cal;
	private int pro;
	private int fat;
	private int car;
	private int sug;
	
	
	public FoodRecDTO(String fname, int cal, int pro, int fat, int car, int sug) {
		this.fname = fname;
		this.cal = cal;
		this.pro = pro;
		this.fat = fat;
		this.car = car;
		this.sug = sug;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public int getCal() {
		return cal;
	}


	public void setCal(int cal) {
		this.cal = cal;
	}


	public int getPro() {
		return pro;
	}


	public void setPro(int pro) {
		this.pro = pro;
	}


	public int getFat() {
		return fat;
	}


	public void setFat(int fat) {
		this.fat = fat;
	}


	public int getCar() {
		return car;
	}


	public void setCar(int car) {
		this.car = car;
	}


	public int getSug() {
		return sug;
	}


	public void setSug(int sug) {
		this.sug = sug;
	}
	
	
	
}
