package board;

import java.sql.Timestamp;
import java.util.List;


public class NoticeBoardService {

	NoticeBoardDAO noticeDAO;
	
	public NoticeBoardService() {
		noticeDAO = new NoticeBoardDAO();
	}
	
	////////////////////////////////////////////////////////////////////
	//게시판 메인 화면
	public List<NoticeBoardBean> listNotice(int startRow, int pageSize, String searchText) {
		List<NoticeBoardBean> noticeList = noticeDAO.getNoticeList(startRow, pageSize, searchText);
		return noticeList;
	}
	
	//게시물 갯수 몇개인지 알려주는 역할
	public int countNotice(){
		int count = noticeDAO.getNoticeCount();
		return count;
	}
	/////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////
	//이벤트만 보는 화면
	public List<NoticeBoardBean> listEvent(int startRow, int pageSize, String searchText, int a) {
		List<NoticeBoardBean> noticeList = noticeDAO.getEventList(startRow, pageSize, searchText, a);
		return noticeList;
	}

	//이벤트갯수
	public int countEvent(String searchText, int a){
		int count = noticeDAO.getEventCount(searchText ,a);
		return count;
	}
	/////////////////////////////////////////////////////////////////////
	
	
	
	//게시물 클릭 시 게시물 보여주고 조회수 하나 올리는 역할
	public NoticeBoardBean viewNotice(int num) {
		NoticeBoardBean notice = null;
		notice = noticeDAO.getNotice(num);
		noticeDAO.updateReadCount(num);
			
		return notice;
	}
	
	//게시물 추가
	public int addNotice(NoticeBoardBean noticeBoardBean){
		return noticeDAO.insertNotice(noticeBoardBean);
	}

	
	
	//게시물 수정할 때 불러오는 역할
	public NoticeBoardBean viewUpdate(int num){
		NoticeBoardBean notice = null;
		notice = noticeDAO.getNotice(num);
		return notice;
	}

	//게시물 수정
	public void updateNotice(NoticeBoardBean nBean){
		noticeDAO.updateNotice(nBean);
	}
	
	//게시물 삭제
	public void deleteNotice(int num){
		noticeDAO.deleteNotice(num);
	}

}
