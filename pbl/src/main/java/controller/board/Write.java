package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.module.ModuleDescriptor.Builder;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import domain.Attach;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.AlertUtil;

@Slf4j
@WebServlet("/board/write")
public class Write extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// session 내의 member attr 조회 후 null
		Criteria cri = Criteria.init(req);
		if (req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?" + cri.getQs2(), req, resp, true);
			return;
		}
		req.setAttribute("cri", cri);
		req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 체크
		Criteria cri = Criteria.init(req);
		if (req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?" + cri.getQs2(), req, resp, true);
			return;
		}
		// 파라미터 수집

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getParameter("id");
		Integer cno = Integer.valueOf(req.getParameter("cno"));//
		
		// 첨부파일 내영 수집 
		
		String encodedStr = req.getParameter("encodedStr");
		Type type =new  TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);
		log.info("{}", list);
		
		
		// board 인스턴스 생성
		Board board = Board.builder().title(title).content(content).id(id).cno(cno).attachs(list). build();

		log.info("{}", board);
		
		//서비스 호출
		new BoardService().write(board);
		
		//리디렉션(board/list)
		AlertUtil.alert("글이 등록되었습니다","/board/list?cno=" + cri.getCno() + "&amount" + cri.getAmount(), req, resp);
//		AlertUtil.alert("글이 등록되었습니다","/board/list?page=1&" + cri.getQs() , req, resp);
	}

}
