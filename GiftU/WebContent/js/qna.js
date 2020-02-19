
function  qna_check(){
	
	var Exp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	// 이메일 입력여부 체크
	if(email.value==""){
		$("#qna_check_message").text("이메일을 입력해주세요");
		$("#qna_check_message").css("color","red");
		
	}else if(subject.value == ""){
		
		$("#qna_check_message").text("제목을 입력해주세요");
		$("#qna_check_message").css("color","red");
		
	}else if(message.value == ""){
		
		$("#qna_check_message").text("문의 내용을 입력해주세요");
		$("#qna_check_message").css("color","red");
		
	}else if(Exp.test(email.value) == false) {
		
		$("#qna_check_message").text("이메일을 형식에 맞게 입력해주세요");
		$("#qna_check_message").css("color","red");
		
	}else{
		$("#QnAForm").submit();
	}
}
