package service;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import util.MybatisUtil;
import util.PasswordEncoder;

@Slf4j
public class MemberService {

	public int register(Member member) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member.setPw(PasswordEncoder.encode(member.getPw()));
			return mapper.insert(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Member findByID(String id) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean login(String id, String pw) {
		Member member = findByID(id);
		if(member == null) {
			return false;
		}
		return PasswordEncoder.matches(pw, member.getPw());
	}

	public static void main(String[] args) {
		MemberService memberService = new MemberService();
		memberService.register(Member.builder().id("sae").pw("1234").name("새똥이").build());
		
		log.info("{}", memberService.login("sae", "1234"));
		log.info("{}", memberService.login("sae", "12345"));
	}

}
