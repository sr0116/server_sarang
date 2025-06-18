package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Alias("board")
@Builder
public class Board {
//	게시글
	

	private Long bno; //  회원 번호
	private String title; // 제목
	private String content; // 게시글
	private String id; // 아이디
	private String regdate; // 작성일시
	private String moddate; // 
	private Integer cnt; // 
	private Integer cno; // 

}
