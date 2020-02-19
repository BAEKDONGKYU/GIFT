$(function () {
	//찾기 버튼 클릭시 이벤트 실행
	var blank_pattern = /[\s]/g;
	$("#findButton").click(function (){
		//id 입력창의 값을 가져옴
		var id = $("#p_id").val();
		
		//id의 값이 입력되지 않았을 경우
		if(id == "" || id == null) {
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		//값이 입력되었을 경우
		else {
			// 공백 유무 체크 유효성 검사
			var blank_pattern = /[\s]/g;
			
			// 공백이 있을 경우 
			if(blank_pattern.test(id) == true) {
				// id입력란 초기화
				$("#id").val("");
				alert("공백은 사용할 수 없습니다.");
				$("#id").focus();
				return false;
			}
			// 공백이 없을 경우
			else {
				//findPwPro.jsp로 전송
				$("#findPwForm").submit();
			}
			
		}
		
	});
});