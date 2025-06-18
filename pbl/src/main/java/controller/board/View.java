package controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.Border;

import domain.Board;
import domain.Member;
import mapper.BoardMapper;
import service.BoardService;
import util.AlertUtil;

@WebServlet("/board/view")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("bno") == null) {
			AlertUtil.alert("잘못된 접근입니다","/board/list" ,req, resp);
			return;
		}

		
		BoardService service = new BoardService();
		Board board = service.findBy(Long.parseLong(req.getParameter("bno")));
		req.setAttribute("board", board);
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
	}

}
