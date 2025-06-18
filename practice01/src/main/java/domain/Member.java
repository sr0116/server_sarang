package domain;

import java.util.Date;

import lombok.Builder;
import lombok.Data;



@Data
@Builder
public class Member {
//게시글
	
	private Long no; //  회원 번호
	private String id; // 아이디
	private String pw; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String regdate; // 작성일시


}
