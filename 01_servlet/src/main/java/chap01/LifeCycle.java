package chap01;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle")
public class LifeCycle extends HttpServlet {
	private int initCnt, serCnt, destCnt;

	@Override
	public void init() throws ServletException {
		initCnt++;
		System.out.println("init()");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		serCnt++;
		System.out.println("service()");
		prinCnts();
	}

	@Override
	public void destroy() {
		destCnt++;
		System.out.println("destory(얌얌)");
		}
	
	void prinCnts() {
		System.out.printf("%d %d %d\n", initCnt, serCnt, destCnt);
	}
	
}
