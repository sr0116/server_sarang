package domain;

import lombok.Builder;
import lombok.Data;
import lombok.Setter;

@Data
@Builder
public class Attach {
		
	private String uuid;  
	private String path; 
	private boolean image;  
	private String origin;  
	private String bno;  
	private Long rno; 
	private int odr; 
	
	@Setter
	private String info;

	public String getInfo() {
		String[] strs = {"uuid=" + "uuid","path=" + path, "origin=" + origin};
		return String.join("&", strs);
	}
}
