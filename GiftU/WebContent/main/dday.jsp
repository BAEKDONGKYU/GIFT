<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">

.dday{
	position: absolute;
    background-color: #fff;
    top: 550px;
    left: 5px;
    width: 400px;
    height: auto;
    z-index: 3;
    border-radius: 5px;
    cursor: pointer;
    border: none;
    text-align: center;
}

</style>

<script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  var result1 = getCookie('dday');
	   if (result1 == 'end') {
	      $("#dday").css("display","none");
	      }
	   var result2 = getCookie('dday1');
	   if (result2 == 'end') {
	      $("#dday1").css("display","none");
	      }
	   var result3 = getCookie('dday2');
	   if (result3 == 'end') {
	      $("#dday2").css("display","none");
	      }
	   var result4 = getCookie('dday3');
	   if (result4 == 'end') {
	      $("#dday3").css("display","none");
	      }
});

//팝업창에서 '오늘 그만보기' 클릭시 종료하고 쿠키를 삽입하는 함수
function week(){
	setCookie("dday", "end", 7); 
	$("#dday").css("display", "none"); 
}

function dday1(){
	setCookie("dday1", "end", 1); 
	$("#dday1").css("display", "none"); 
}

function dday2(){
	setCookie("dday2", "end", 1); 
	$("#dday2").css("display", "none"); 
}
function dday3(){
	setCookie("dday3", "end", 1); 
	$("#dday3").css("display", "none"); 
}
</script>


<!--================ 기념일 알람창 =================-->
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	
	//로그인이 되어있다면 등록된 기념일 유무를 파악하여 dday1에 해당하는 값을 불러온다. 
	if(id!=null){
		
		MemberDAO dao = new MemberDAO();
		MemberBean bean = dao.findMember(id); 
		
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul"); 
		Calendar today = Calendar.getInstance();
		
		
		String ddate1 = bean.getDdate_1(); 
		String ddate2 = bean.getDdate_2(); 
		String ddate3 = bean.getDdate_3(); 
		
		
		
		String dday1 = bean.getDday_1(); 
		String dday2 = bean.getDday_2(); 
		String dday3 = bean.getDday_3(); 
		System.out.println("dday1: " + dday1);
		
		//만약에 등록된 dday1에 해당하는 값이 존재하지 않는다면, 
		//아직 기념일 알람 서비스를 이용하지 않는 고객이기 때문에
		//이러한 서비스가 있다는 것을 팝업창을 통해 알려준다. 
		
		if(dday1==null||dday1.equals("")){
	%>
<div id="dday" class="dday" style="background-color: beige;">
	<div>
		<a href="${contextPath}/Team/member/memberInfo.do?id=<%=id%>"><img
			src="../img/popup3.png" id="pop1" width="100%"></a>
	</div>
	<div id="green" onclick="week()">
		<input type="checkbox">일주일동안 그만보기
	</div>
</div>
<% 	
		//만약에 dday1에 해당하는 값이 존재한다면 다음 서비스를 
		//이용중인 고객이므로 알람을 띄워야하는지 조건을 검색한다. 
		
		/*참고: 알람 서비스는 해당 기념일의 일주일 전부터 하루전까지 팝업창을 통해 기념일이 다가왔음을 알려준다. */
		}else{ 
			
			if(ddate1.length()>=8){
			
			
			int getMonth1 = Integer.parseInt(ddate1.substring(5, 7));
			int getDay1 = Integer.parseInt(ddate1.substring(8));	
			Calendar dday_1 = Calendar.getInstance(); 
			dday_1.set(2020, getMonth1-1, getDay1); 
				
			long l_dday1 = dday_1.getTimeInMillis();
			long l_today1 = today.getTimeInMillis();
			long substract1 = (l_dday1-l_today1)/(60*60*24*1000);
			
				if(substract1 <= 7 & substract1 >= 1){
	%>
<!-- (기념일 등록이 되어 있을경우엔 등록된 기념일 일주일전 부터 알람창이 뜨도록 설정) -->
<div id="dday1" class="dday" style="background-color: #ebfff0;">
	<MARQUEE scrollamount="3">
		<span id="event_span" style="color: #f75b3b;">♥기념일 알람이 도착했습니다♥</span>
	</MARQUEE>
	<div id="memo">
		<%=id %>님! <span class="purple"><%=dday1%></span>이/가<br> <span
			class="purple"><%=substract1%>일</span> 앞으로 다가왔습다. <br>
		<div>
			<a href="${contextPath}/Team/product/listProducts.do"><img
				src="../img/popup4.png" id="pop1" width="95%"></a>
		</div>
	</div>
	<div id="green" onclick="dday1()">
		<input type="checkbox">오늘 그만보기
	</div>
</div>
<%
				}
			}
			if(ddate2.length()>=8){
			System.out.println("dday2: " + dday2);	
			

			int getMonth2 = Integer.parseInt(ddate2.substring(5, 7));
			int getDay2 = Integer.parseInt(ddate2.substring(8));	
			Calendar dday_2 = Calendar.getInstance(); 
			dday_2.set(2020, getMonth2-1, getDay2); 
				
			long l_dday2 = dday_2.getTimeInMillis();
			long l_today2 = today.getTimeInMillis();
			long substract2 = (l_dday2-l_today2)/(60*60*24*1000);
			
			if(substract2 <= 7 & substract2 >= 2){
	%>
<!-- (기념일 등록이 되어 있을경우엔 등록된 기념일 일주일전 부터 알람창이 뜨도록 설정) -->
<div id="dday2" class="dday" style="background-color: #ebfff0;">
	<MARQUEE scrollamount="3">
		<span id="event_span" style="color: #f75b3b;">♥기념일 알람이 도착했습니다♥</span>
	</MARQUEE>
	<div id="memo">
		<%=id %>님! <span class="purple"><%=dday2%></span>이/가<br> <span
			class="purple"><%=substract2%>일</span> 앞으로 다가왔습다. <br>
		<div>
			<a href="${contextPath}/Team/product/listProducts.do"><img
				src="../img/popup4.png" id="pop1" width="95%"></a>
		</div>
	</div>
	<div id="green" onclick="dday2()">
		<input type="checkbox">오늘 그만보기
	</div>
</div>
<%
				}
			}
			if(ddate3.length()>=8){
			System.out.println("dday3: " + dday3);	
			
			
			int getMonth3 = Integer.parseInt(ddate3.substring(5, 7));
			int getDay3 = Integer.parseInt(ddate3.substring(8));	
			Calendar dday_3 = Calendar.getInstance(); 
			dday_3.set(2020, getMonth3-1, getDay3); 
				
			long l_dday3 = dday_3.getTimeInMillis();
			long l_today3 = today.getTimeInMillis();
			long substract3 = (l_dday3-l_today3)/(60*60*24*1000);
			
			if(substract3 <= 7 & substract3 >= 1){
	%>
<!-- (기념일 등록이 되어 있을경우엔 등록된 기념일 일주일전 부터 알람창이 뜨도록 설정) -->
<div id="dday3" class="dday" style="background-color: #ebfff0;">
	<MARQUEE scrollamount="3">
		<span id="event_span" style="color: #f75b3b;">♥기념일 알람이 도착했습니다♥</span>
	</MARQUEE>
	<div id="memo">
		<%=id %>님! <span class="purple"><%=dday3%></span>이/가<br> <span
			class="purple"><%=substract3%>일</span> 앞으로 다가왔습다. <br>
		<div>
			<a href="${contextPath}/Team/product/listProducts.do"><img
				src="../img/popup4.png" id="pop1" width="95%"></a>
		</div>
	</div>
	<div id="green" onclick="dday3()">
		<input type="checkbox">오늘 그만보기
	</div>
</div>
<%
			}
			}
			}
		}
%>
<!--================ 기념일 알람창 끝!=================-->
