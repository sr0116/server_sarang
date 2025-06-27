package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import domain.Category;

public interface CategoryMapper {
	
	@Select("SELECT * FROM  tbl_category tc where tc.status = 'ACTIVE' ORDER by odr")
	List<Category> list();
	

}
