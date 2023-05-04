package com.fooeating.javabean;

/** 
 * javadoc 주석 (설명)
 * 
 *  id정보를 저장하는 객체
 *  id정보는 직접접근 불가
 *  get/set 메서드 사용해서 호출가능
 */

public class JavaBeanpt1 {
	
	// id 정보를 저장하기 위해서 생성한 객체(자바빈)
	
//	private String id;
//	
//	//public JavaBean1() { } -> 생략 되어 있는 것이지 없는 것X
//
//	// alt shift s -> r
//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}
//
//	// alt shift s -> s
//	@Override
//	public String toString() {
//		return "JavaBean1 [id=" + id + "]";
//	}
	private int rest_id;
	private String name;
	private String category;
	private String addr_city;
	private String addr_district;
	private String addr_etc;
	private String rest_tel;
	private String runtime;
	private String dayoff;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRest_id() {
		return rest_id;
	}
	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRest_tel() {
		return rest_tel;
	}
	public void setRest_tel(String rest_tel) {
		this.rest_tel = rest_tel;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getDayoff() {
		return dayoff;
	}
	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}
	
	public String getAddr_city() {
		return addr_city;
	}
	public void setAddr_city(String addr_city) {
		this.addr_city = addr_city;
	}
	public String getAddr_district() {
		return addr_district;
	}
	public void setAddr_district(String addr_district) {
		this.addr_district = addr_district;
	}
	public String getAddr_etc() {
		return addr_etc;
	}
	public void setAddr_etc(String addr_etc) {
		this.addr_etc = addr_etc;
	}
	@Override
	public String toString() {
		return "JavaBeanpt1 [rest_id=" + rest_id + ", name=" + name + ", category=" + category + ", addr_city="
				+ addr_city + ", addr_district=" + addr_district + ", addr_etc=" + addr_etc + ", rest_tel=" + rest_tel
				+ ", runtime=" + runtime + ", dayoff=" + dayoff + "]";
	}
	
}
