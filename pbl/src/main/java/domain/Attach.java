package domain;


import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;
import lombok.Setter;

@Data
@Builder
@Alias("attach")
public class Attach {
		
	private String uuid;  
	private String path; 
	private boolean image;  
	private String origin;  
	private Long bno;  
	private Long rno; 
	private int odr; 
	
	@Setter
	private String info;

	public String getInfo() {
		String[] strs = {"uuid=" + "uuid","path=" + path, "origin=" + origin};
		return String.join("&", strs);
	}
}
