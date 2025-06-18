package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.module.ModuleDescriptor.Builder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Board;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.AlertUtil;

@Slf4j
@WebServlet("/board/write")
public class Write extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// session 내의 member attr 조회 후 null

		if (req.getSession().getAttribute("member") == null) {
//            AlertUtil.alert("로그인 후 글 작성하슈", String.format("%s%s%s", req.getContextPath(), 
//                    "/member/login?url=", URLEncoder.encode(req.getRequestURL().toString(), "utf-8")), req, resp);
			AlertUtil.alert("로그인 후 글 작성하슈", "/member/login", req, resp, true);
			return;
		}

		req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 체크
		if (req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성하슈", "/member/login", req, resp, true);
			return;
		}
		// 파라미터 수집

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getParameter("id");
		Integer cno = Integer.valueOf(req.getParameter("cno"));//

		// board 인스턴스 생성
		Board board = Board.builder().title(title).content(content).id(id).cno(cno).build();

		log.info("{}", board);
		
		//서비스 호출
		new BoardService().write(board);
		
		//리디렉션(board/list)
		AlertUtil.alert("글이 등록되었습니다","/board/list?cno=2" , req, resp);
	}

}
