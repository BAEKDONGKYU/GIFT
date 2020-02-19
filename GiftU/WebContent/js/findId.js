
$(function () {
	//유효성 체크
	//findId.jsp에서 찾기 버튼 눌렸을 떄..
	//입력란에 입력한 이메일을 먼저 유효성 체크 하고
	//유효성 체크를 통과한 이메일은 db에 해당 이메일이 있는지 확인후 
	//db에 해당 이메일이 있을 경우에만 입력한 이메일로 메일 전송
	
	
	// 이메일 유효성 
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	//찾기 버튼시 이벤트 실행
	$("#findButton").click(function () {
		
		// 입력한 이메일의 값을 가져옴
		var email = $("#email").val();
		// 유효성 체크를 실시
		var result = regExp.test(email);
		
		
		//유효성 통과를 하지 못했을 경우에는 경고 메세지 표시
		if(result == false) {
			//경고 메세지 표시
			$("#resultMessage").text("이메일을 형식에 맞게 입력해주세요");
			$("#resultMessage").css("color","red");
		}
		else {
			//경고 메세지 숨김
			$("#resultMessage").hide();
			$("#findIdForm").submit();
			
		}
		
		
		//유효성을 통과 했을 경우에는 DB에 해당 이메일이 있는 지 체크
	});
});