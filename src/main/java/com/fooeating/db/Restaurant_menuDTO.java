package com.fooeating.db;

public class Restaurant_menuDTO {
	private int rest_menu_num;
	private String menu_name;
	private String menu_descriptions;
	private String price;
	private String rest_id;

	public int getRest_menu_num() {
		return rest_menu_num;
	}
	public void setRest_menu_num(int rest_menu_num) {
		this.rest_menu_num = rest_menu_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_descriptions() {
		return menu_descriptions;
	}
	public void setMenu_descriptions(String menu_descriptions) {
		this.menu_descriptions = menu_descriptions;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setRest_id(String rest_id) {
		this.rest_id = rest_id;
	}
	public String getRest_id() {
		return rest_id;
	}
	@Override
	public String toString() {
		return "Restaurant_menuDTO [rest_menu_num=" + rest_menu_num + ", menu_name=" + menu_name
				+ ", menu_descriptions=" + menu_descriptions + ", price=" + price + ", rest_id=" + rest_id + "]";
	}
	

}
