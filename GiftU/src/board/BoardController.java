package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boarde/*") //  /viewArticle.do
public class BoardController extends HttpServlet {
	BoardBean boardBean;
	BoardService boardService;

	@Override
	public void init(ServletConfig config) throws ServletException {
		boardBean = new BoardBean();
		boardService = new BoardService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		try {
			List<BoardBean> boardList = new ArrayList<BoardBean>();
			if (action == null || action.equals("/listBoard.do")) { //게시판 메인화면
				
				int count = boardService.countBoard();
				
				int pageSize = 10;
				String pageNum = request.getParameter("pageNum");
				String searchText = request.getParameter("searchText");
				if(pageNum==null){
					pageNum="1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage -1) * pageSize;

				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);

				int pageBlock = 3;
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				boardList = boardService.listArticles(startRow, pageSize, searchText);
				
				request.setAttribute("boardList", boardList);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("count", count);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				nextPage = "/qna_notice/QnA.jsp";
				
			} else if (action.equals("/addQuestion.do")) { //게시물 추가

				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String subject = request.getParameter("subject");
				String message = request.getParameter("message");
				int secret = 0;
				if(request.getParameter("secret")!=null){
					secret = 1;
				}
				System.out.println(secret);
				
				boardBean.setName(name);
				boardBean.setEmail(email);
				boardBean.setSubject(subject);
				boardBean.setMessage(message);
				boardBean.setSecret(secret);
				boardBean.setIp(request.getRemoteAddr());
				boardBean.setDate(new Timestamp(System.currentTimeMillis()));
				
				boardService.addArticle(boardBean);
				

				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				         +" alert('등록되었습니다.');" 
						 +" location.href='"+request.getContextPath()+"/boarde/listBoard.do';"
				         +"</script>");
				return;
				
			}else if(action.equals("/viewboard.do")){ //게시물 1개 보여주는 화면
				
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				String searchText = request.getParameter("searchText");
				int count = boardService.countBoard();				
				int pageSize = 10;
				if(pageNum==null){pageNum="1";}				
				int currentPage = Integer.parseInt(pageNum);				
				int startRow = (currentPage -1) * pageSize;				
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;				
				int endPage = startPage + pageBlock -1;				
				if(endPage > pageCount){endPage = pageCount;}
				
				boardList = boardService.listArticles(startRow, pageSize, searchText);
				boardBean = boardService.viewArticle(Integer.parseInt(num));
				
				String message = boardBean.getMessage().replace("\r\n","<br/>");
				String answer = boardBean.getAnswer();
				
				
				
				request.setAttribute("message", message);
				request.setAttribute("answer", answer);
				request.setAttribute("board", boardBean);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("boardList", boardList);
				request.setAttribute("count", count);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				nextPage = "/qna_notice/content.jsp";	
				
			}else if(action.equals("/addAnswer.do")){
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				String answer = request.getParameter("answer");
				
				boardBean.setAnswer(answer);
				
				boardService.addAnswer(boardBean,Integer.parseInt(num));
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('답글 작성 완료');" 
				+" location.href='"+request.getContextPath()+"/boarde/viewboard.do?num="+num+"&pageNum="+pageNum+"';"
				+"</script>");
				
				return;
				
			}else if(action.equals("/updateBoard.do")){	//게시물 수정
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				
				boardBean = boardService.viewUpdate(Integer.parseInt(num));
				
				request.setAttribute("board", boardBean);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/qna_notice/update.jsp";	
				
			}else if(action.equals("/updateProBoard.do")){
				
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				String subject = request.getParameter("subject");
				String message = request.getParameter("message");
				
				boardBean.setSubject(subject);
				boardBean.setMessage(message);

				boardService.updateBoard(boardBean);
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('수정 완료');" 
				+" location.href='"+request.getContextPath()+"/boarde/viewboard.do?num="+num+"&pageNum="+pageNum+"';"
				+"</script>");
			
				return;
				
			}else if(action.equals("/deleteBoard.do")){	//게시물 삭제
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
				boardService.deleteBoard(num);
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('삭제 완료');" 
				+" location.href='"+request.getContextPath()+"/boarde/listBoard.do?pageNum="+pageNum+"';"
				+"</script>");
				
				return;
			}else if(action.equals("/updateAnswer.do")){ //답글 수정
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				String answer = request.getParameter("answer");
				boardBean.setAnswer(answer);
				
				boardService.updateAnswer(boardBean, Integer.parseInt(num));
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('답글 수정 완료');" 
				+" location.href='"+request.getContextPath()+"/boarde/viewboard.do?num="+num+"&pageNum="+pageNum+"';"
				+"</script>");
				
				return;
				
			}else if(action.equals("/deleteAnswer.do")){ //답글 삭제
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				
				boardService.deleteAnswer(Integer.parseInt(num));
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('답글 삭제 완료');" 
				+" location.href='"+request.getContextPath()+"/boarde/viewboard.do?num="+num+"&pageNum="+pageNum+"';"
				+"</script>");
				
				return;		
			}

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}