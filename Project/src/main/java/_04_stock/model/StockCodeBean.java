package _04_stock.model;

import java.io.Serializable;

import javax.transaction.Synchronization;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

public class StockCodeBean implements Serializable{
	private Integer stock_Code;
	private String stock_Name;
	private String stock_TypeCode; 
	private String cs_Code;
	private String commend;
	public String getCommend() {
		return commend;
	}
	public void setCommend(String commend) {
		this.commend = commend;
	}
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	public String getStock_Name() {
		return stock_Name;
	}
	public void setStock_Name(String stock_Name) {
		this.stock_Name = stock_Name;
	}
	public String getStock_TypeCode() {
		return stock_TypeCode;
	}
	public void setStock_TypeCode(String stock_TypeCode) {
		this.stock_TypeCode = stock_TypeCode;
	}
	public String getCs_Code() {
		return cs_Code;
	}
	public void setCs_Code(String cs_Code) {
		this.cs_Code = cs_Code;
	}
	@Override
	public String toString() {
		return "StockCodeBean [stock_Code=" + stock_Code + ", stock_Name="
				+ stock_Name + ", stock_TypeCode=" + stock_TypeCode
				+ ", cs_Code=" + cs_Code + ", commend=" + commend + "]";
	}
	
}
