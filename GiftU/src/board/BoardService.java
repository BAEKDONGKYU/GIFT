package board;

import java.sql.Timestamp;
import java.util.List;


public class BoardService {

	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}
	
	//게시판 메인 화면
	public List<BoardBean> listArticles(int startRow, int pageSize, String searchText) {
		List<BoardBean> boardList = boardDAO.getBoardList(startRow, pageSize, searchText);
		return boardList;
	}
	
	//게시물 추가
	public void addArticle(BoardBean boardBean){
		boardDAO.insertBoard(boardBean);
	}
	
	//게시물 갯수 몇개인지 알려주는 역할
	public int countBoard(){
		int count = boardDAO.getBoardCount();
		return count;
	}
	
	//게시물 클릭 시 게시물 보여주는 역할
	public BoardBean viewArticle(int num) {
		BoardBean board = null;
		board = boardDAO.getBoard(num);
		boardDAO.updateReadCount(num);
		
		return board;
	}
	
	//게시물 수정할 때 불러오는 역할
	public BoardBean viewUpdate(int num){
		BoardBean board = null;
		board = boardDAO.getBoard(num);
		return board;
	}
	
	//게시물 삭제
	public void deleteBoard(int num){
		boardDAO.deleteBoard(num);
	}
	
	//게시물 수정
	public void updateBoard(BoardBean boardBean){
		boardDAO.updateBoard(boardBean);
	}
	
	//답글 추가
	public void addAnswer(BoardBean boardBean, int num){
		boardDAO.editAnswer(boardBean,num);
	}

	//답글 수정
	public void updateAnswer(BoardBean boardBean, int num){
		boardDAO.updateAnswer(boardBean,num);
	}
	
	//답글 삭제
	public void deleteAnswer(int num){
		boardDAO.deleteAnswer(num);
	}

}
