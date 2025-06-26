package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class BoardMapperTest {
	
	private BoardMapper boardMapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
	
	@Test
	public void addTest() {
		int result = 1 + 1;
		assertEquals(2, result);
	}
	
//	단일조회
	@Test
	public void testSelectOne() {
		Long bno = 538L;
		
		Board board = boardMapper.selectOne(bno);
		
		assertNotNull(board);
		
		
		log.info("{}", board);
	}
	
	
	@Test
	@DisplayName("목록 조회 3페이지 10개씩 2번 카테고리")
	public void testList() {
		
		Criteria cri = new Criteria(1, 20, 2);
		List<Board> list = boardMapper.list(cri);
		list.forEach(b->log.info("{} {} {}",b.getAttachCnt(), b.getReplyCnt(), b.getAttachs()));
		
	}
	
	@Test
	@DisplayName("목록 조회")
	public void testList2() {
		
		Criteria cri = new Criteria(1, 10, 2, "TI", "sr");
		log.info(Arrays.toString(cri.getTypes()));
		List<Board> list = boardMapper.list(cri);
//		list.forEach(b->log.info(b.getTitle()));
	}
	
	@Test
	@DisplayName("글수정 테스트")
	public void testUpdate() {
		
		Long bno = 100L;
		
		Board board = boardMapper.selectOne(bno);
		board.setTitle("제목만 수정하기");
		
		boardMapper.update(board);
		
		
	}

	
}
