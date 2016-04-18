package rest.restfulService.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;


/* 陳姵吟 Carley Chen, 01-04-2016 */
@XmlRootElement(name="custFavorite")
public class CustFavoriteBean implements Serializable{
	private String account;
	private Integer stock_Code;
	
	@Override
	public String toString() {
		return "[ " + account + " , " + stock_Code	+ " ]";
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	@Override
	public int hashCode() {
		return  stock_Code ^ account.hashCode();
	}
	@Override
	public boolean equals(Object obj) {

		if(obj!=null && obj instanceof CustFavoriteBean){
			CustFavoriteBean bean = (CustFavoriteBean)obj;
			if(this.account==bean.account && this.stock_Code.equals(bean)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
}
