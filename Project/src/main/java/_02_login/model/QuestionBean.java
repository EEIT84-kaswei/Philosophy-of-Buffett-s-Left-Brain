package _02_login.model;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.crypto.Data;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

public class QuestionBean implements Serializable{
	private Integer id;
	private Timestamp QDate;//對應SQL的datetime型態
	private	Integer Risk_Tolerance ;
	private Integer scores;
	
	public QuestionBean(){
	}
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Timestamp getQDate() {
		return QDate;
	}
	public void setQDate(Timestamp QDate) {
		this.QDate = QDate;
	}
	public int getRisk_Tolerance() {
		return Risk_Tolerance;
	}
	public void setRisk_Tolerance(Integer risk_Tolerance) {
		Risk_Tolerance = risk_Tolerance;
	}
	public int getScores() {
		return scores;
	}
	public void setScores(Integer scores) {
		this.scores = scores;
	}
	@Override
	public String toString() {
		return "questionBean [id=" + id + ", QDate=" + QDate + ", Risk_Tolerance="
				+ Risk_Tolerance + ", scores=" + scores + "]";
	}
	public boolean equals(Object obj){
		if(obj == this){
		return true;
		}
		if(!(obj instanceof QuestionBean)){		
		return false;
		}
		QuestionBean bean = (QuestionBean) obj;
		return new EqualsBuilder().append(this.id, bean.getId()).append(this.QDate, bean.getQDate()).isEquals();
	}
	public int hashCode(){
		return new HashCodeBuilder().append(this.id).append(this.QDate).toHashCode();
	}
	
	
}
