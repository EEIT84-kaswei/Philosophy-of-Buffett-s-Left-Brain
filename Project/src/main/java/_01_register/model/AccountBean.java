package _01_register.model;

public class AccountBean {

	private Integer id;
	private String account;
	private String passw;
	private String name;
	private String idc;
	private String email;
	private String area_phone;
	private String phone;
	private String address;	
	
	
	@Override
	public String toString() {
		return "[" + id + "," + account + "," + passw + "," + name + ","
				+ idc + "," + email + "," + area_phone + "," + phone + "," + address + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassw() {
		return passw;
	}
	public void setPassw(String passw) {
		this.passw = passw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdc() {
		return idc;
	}
	public void setIdc(String idc) {
		this.idc = idc;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getArea_phone() {
		return area_phone;
	}
	public void setArea_phone(String area_phone) {
		this.area_phone = area_phone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
