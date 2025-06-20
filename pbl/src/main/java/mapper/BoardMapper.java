package mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.Member;
import domain.dto.Criteria;
import util.MybatisUtil;

public interface BoardMapper {

	
	
	List<Board> list(Criteria cri);
  
	Board selectOne(Long bno);
	
	void insert(Board board);
	
	long getCount(Criteria cri);

	void update(Board board);
	
	void delete(Long bno);




}
