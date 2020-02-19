package board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import coupon.ListCouponBean;
import coupon.ListCouponDAO;

@WebServlet("/notice/*")
public class NoticeBoardController extends HttpServlet {
	NoticeBoardBean noticeboardBean;
	NoticeBoardService noticeboardService;
	ListCouponBean listcouponBean;
	ListCouponDAO ListcouponDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		noticeboardBean = new NoticeBoardBean();
		noticeboardService = new NoticeBoardService();
		listcouponBean = new ListCouponBean();
		ListcouponDAO = new ListCouponDAO();
		
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
			List<NoticeBoardBean> noticeList = new ArrayList<NoticeBoardBean>();
			List<ListCouponBean> ListCouponList = new ArrayList<ListCouponBean>();
			if (action == null || action.equals("/listAllNotice.do")) { //게시판 메인화면
				
				int count = noticeboardService.countNotice();
				
				int pageSize = 5;
				String pageNum = request.getParameter("pageNum");
				String searchText = request.getParameter("searchText");
				if(pageNum==null){pageNum="1";}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage -1) * pageSize;
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount){endPage = pageCount;}
				
				noticeList = noticeboardService.listNotice(startRow, pageSize, searchText);
				
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("count", count);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("action", action);
				
				nextPage = "/qna_notice/notice.jsp";
				
			} else if(action.equals("/listEvent.do")){	//이벤트만 보여줌
				
				int a = 1;
				String searchText = request.getParameter("searchText");
				int count = noticeboardService.countEvent(searchText, a);
				int pageSize = 5;
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null){pageNum="1";}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage -1) * pageSize;
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount){endPage = pageCount;}

				noticeList = noticeboardService.listEvent(startRow, pageSize, searchText, a);
				
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("count", count);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("action", action);
				
				nextPage = "/qna_notice/notice.jsp";
				
				
			}else if(action.equals("/listNotice.do")){	//공지만 보여줌
				
				int a = 0;
				String searchText = request.getParameter("searchText");
				int count = noticeboardService.countEvent(searchText, a);
				
				int pageSize = 5;
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null){pageNum="1";}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage -1) * pageSize;
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount){endPage = pageCount;}

				noticeList = noticeboardService.listEvent(startRow, pageSize, searchText, a);
				
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("count", count);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("action", action);
				
				nextPage = "/qna_notice/notice.jsp";
				
				
			}else if(action.equals("/viewNotice.do")){ //게시물 1개 보여주는 화면
				
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
				
				noticeboardBean = noticeboardService.viewNotice(Integer.parseInt(num));
				NoticeBoardBean noticeboardBean1 = noticeboardService.viewNotice(Integer.parseInt(num)+1);
				NoticeBoardBean noticeboardBean2 = noticeboardService.viewNotice(Integer.parseInt(num)-1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
				
				String time = sdf.format(noticeboardBean.getDate());

				request.setAttribute("time", time);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("notice", noticeboardBean);
				request.setAttribute("notice1", noticeboardBean1);
				request.setAttribute("notice2", noticeboardBean2);
				
				nextPage = "/qna_notice/noticeView.jsp";	
				
			}else if(action.equals("/add.do")){
					
				ListCouponList = ListcouponDAO.getCouponList();
				
				request.setAttribute("ListCouponList", ListCouponList);
				
				nextPage = "/qna_notice/addNotice.jsp";	
				
			}else if (action.equals("/addNotice.do")) { //게시물 추가
				
				Map<String, String> proMap = upload(request, response);

				int num = 0;
				String subject = proMap.get("subject");
				String message = proMap.get("message");
				String msg = proMap.get("msg");
				if(Integer.parseInt(proMap.get("multi")) == 1){
					message = msg;
				}
				String file = proMap.get("file");
				int multi = Integer.parseInt(proMap.get("multi"));
				String banner = proMap.get("banner");
				String coupon = proMap.get("coupon");
				String ARTICLE_IMAGE_REPO = request.getRealPath("/upload");
				
				noticeboardBean.setSubject(subject);
				noticeboardBean.setMessage(message);
				noticeboardBean.setFile(file);
				noticeboardBean.setMulti(multi);
				noticeboardBean.setDate(new Timestamp(System.currentTimeMillis()));
				noticeboardBean.setBanner(banner);
				noticeboardBean.setCoupon(coupon);
				

				num = noticeboardService.addNotice(noticeboardBean);
				
				if (file != null && file.length() != 0) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + file);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				if (banner != null && banner.length() != 0) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + banner);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}

				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
						+" alert('등록되었습니다.');"
						+" location.href='"+request.getContextPath()+"/notice/listAllNotice.do';"
						+"</script>");
				return;

			}else if(action.equals("/updateNotice.do")){	//게시물 수정
				
				int num = Integer.parseInt(request.getParameter("num"));
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				
				noticeboardBean = noticeboardService.viewUpdate(num);
				
				request.setAttribute("notice", noticeboardBean);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("num", num);
				
				nextPage = "/qna_notice/updateNotice.jsp";	
				
			}else if(action.equals("/updateProNotice.do")){
				Map<String, String> proMap = upload(request, response);
				
				String num = request.getParameter("num");
				String pageNum = request.getParameter("pageNum");
	
				String subject = proMap.get("subject");
				String message = proMap.get("message");
				String file = proMap.get("file");
				if(file == null || file == ""){
					file = proMap.get("refile");
				}
				int multi = Integer.parseInt(proMap.get("multi"));
				
				String banner = proMap.get("banner");
				if(banner == null || banner == ""){
					banner = proMap.get("rebanner");
				}
				String ARTICLE_IMAGE_REPO = request.getRealPath("/upload");

				noticeboardBean.setSubject(subject);
				noticeboardBean.setMessage(message);
				noticeboardBean.setFile(file);
				noticeboardBean.setMulti(multi);
				noticeboardBean.setBanner(banner);

				noticeboardService.updateNotice(noticeboardBean);
				
				if (file != proMap.get("refile")) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + file);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				if (banner != proMap.get("rebanner")) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + banner);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				+" alert('수정 완료');" 
				+" location.href='"+request.getContextPath()+"/notice/viewNotice.do?num="+num+"&pageNum="+pageNum+"';"
				+"</script>");
			
				return;
				
			}else if(action.equals("/deleteNotice.do")){	//게시물 삭제
				
				int num = Integer.parseInt(request.getParameter("num"));
				String pageNum = request.getParameter("pageNum");
				
				noticeboardService.deleteNotice(num);
				
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
						+" alert('삭제되었습니다.');" 
						+" location.href='"+request.getContextPath()+"/notice/listAllNotice.do?pageNum="+pageNum+"';"
						+"</script>");
				return;
				
			}

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      Map<String, String> productMap = new HashMap<String, String>();
	      String path = request.getRealPath("/upload");
	      String encoding = "UTF-8";
	      
	      File currentDirPath = new File(path);

	      DiskFileItemFactory factory = new DiskFileItemFactory();

	      factory.setSizeThreshold(1 * 1024 * 1024);

	      factory.setRepository(currentDirPath);

	      ServletFileUpload upload = new ServletFileUpload(factory);

	      try {
	         List items = upload.parseRequest(request);

	         for (int i = 0; i < items.size(); i++) {
	            FileItem fileItem = (FileItem) items.get(i);

	            if (fileItem.isFormField()) {

	               productMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
	               
	            } else {

	               productMap.put(fileItem.getFieldName(), fileItem.getName());

	               if (fileItem.getSize() > 0) {
	                  int idx = fileItem.getName().lastIndexOf("\\");
	                  if (idx == -1) {
	                     idx = fileItem.getName().lastIndexOf("/");
	                  }

	                  String fileName = fileItem.getName().substring(idx + 1);

	                  File uploadFile = new File(currentDirPath + "\\" + fileName);

	                  fileItem.write(uploadFile);
	               }

	            }
	         }

	      } catch (Exception e) {
	         System.out.println("error map" + e);
	      }

	      return productMap;
	   }
}