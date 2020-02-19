$(function(){

 


 //-----------------------------------------------------------------------------------------------------

  /*옆쪽 퀵 메뉴*/
	var defaultTop= parseInt($("#quick_menu").css("top"));
	$(window).on("scroll",function(){
		var scv= $(window).scrollTop();
		
		//스크롤막대바를 여러번 움직이면 애니매이트 메서드가 여러번 작동되어 큐공간에 쌓이는것을 방지하기 위해 stop메소드를 적용하여 애니매이트를 일시정지시킴
		$("#quick_menu").stop().animate({top:defaultTop+scv+"px"},1000);
		
		
		
	});

	
});
