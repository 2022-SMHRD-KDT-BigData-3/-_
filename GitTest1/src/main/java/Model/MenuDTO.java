package Model;

public class MenuDTO {
	private String id;
	private int meal;
	private String dietday;
	private String fname;
	private float cal;
	private float pro;
	private float car;
	private float fat;
	
	
	public MenuDTO(String id, int meal, String fname, float cal, float pro, float car,float fat) {
		super();
		this.id = id;
		this.meal = meal;
		this.fname = fname;
		this.cal = cal;
		this.pro = pro;
		this.car = car;
		this.fat = fat;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMeal() {
		return meal;
	}
	public void setMeal(int meal) {
		this.meal = meal;
	}
	public String getDietday() {
		return dietday;
	}
	public void setDietday(String dietday) {
		this.dietday = dietday;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public float getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	public float getPro() {
		return pro;
	}
	public void setPro(int pro) {
		this.pro = pro;
	}
	public float getCar() {
		return car;
	}
	public void setCar(int car) {
		this.car = car;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	
	
	
	
}
