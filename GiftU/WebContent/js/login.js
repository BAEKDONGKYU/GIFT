 	$(function () {
 		function getContextPath() {
 			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
 			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
 		}
 		
 		
		$("#login_button").click(function () {	
			var id = $("#id").val();
			var pass =  $("#pass").val();
			
			if ($("#f-option2").is(":checked"))
					var cookie = 1;
			else
					var cookie = 0;
		
			var contextPath = getContextPath();
			$.ajax({
				type : 'post',
				url : contextPath+'/member/checkLogin.do',
				dataType : 'text',
				data : {
						"id" : $("#id").val(),
						"pass" : $("#pass").val(),
						cookie : cookie
				},
				success : function (data) {
					if(data == 0) {
						// 비밀번호 틀림
						$("#login_check_message").text("비밀번호가 틀립니다. 다시입력해주세요");
						$("#login_check_message").css("color","red");
					}
					else if(data == 1) {
						// 아이디 비밀번호 전부 일치 
						// 로그인 체크 메시지 창 공백으로 만들기
						// index.jsp로 이동
						$("#login_check_message").text("");
						location.href = contextPath+'/member/successLogin.do';
					}
					else if(data == -1) {
						// 아이디 틀림
						$("#login_check_message").text("아이디가 틀립니다. 다시입력해주세요");
						$("#login_check_message").css("color","red");
					}
				},
				error : function(request,status,error) {
					
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});  // ajax end
			
		}); //login button end
	}); 
 