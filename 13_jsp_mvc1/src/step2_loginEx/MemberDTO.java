package step2_loginEx;

import java.util.Date;

//DTO(Data Transfer Object): 데이터 전송 모델 객체 
public class MemberDTO {

	private String memberId;
	private String passwd;
	private String name;
	private Date joinDate;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	} 
	
}
