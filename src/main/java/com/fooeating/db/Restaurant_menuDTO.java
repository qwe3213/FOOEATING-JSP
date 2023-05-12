package com.fooeating.db;

public class Restaurant_menuDTO {
	private int rest_menu_num;
	private String name;
	private String descriptions;
	private String price;
	private int rest_id;
	

	public int getRest_menu_num() {
		return rest_menu_num;
	}
	public void setRest_menu_num(int rest_nemu_num) {
		this.rest_menu_num = rest_nemu_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getRest_id() {
		return rest_id;
	}
	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}
}
