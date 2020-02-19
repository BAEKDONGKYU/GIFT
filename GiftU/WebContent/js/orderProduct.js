$(function () {
	
	//컨텍스트 Path가져오기
	function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
	//결제하기 장바구니 이동 클릭시
	$(".paymentButton").click(function () {
		// 로그인 여부 체크
		if($("#id").val() == "") {
			alert("로그인을 하셔야 이용할 수 있는 서비스 입니다.");
		}
		// 로그인 했을 경우
		else {
			//카드 결제 체크 했을 경우
			if($('input:radio[name="payment"]:checked').val() == 'credit_card') {
				//무통장 입금에서 입금자, 은행 선택하는 창 숨기기
				$(".payment_info").css("display","none");
				
				// 결제하기 버튼을 눌렸을 경우
				if($(this).attr("id") == "payment_button") {
					//배송지가 제대로 입력 되었는지 체크
					var result = checkRex();
					if(result == false) {
						alert("배송지 정보를 형식에 맞게 입력해주세요");
					}
					else {
						var name = $("#name").val();
						var postcode = $("#postcode").val();
						var address = $("#address").val()+$("#detailAddress").val();
						var phone = $("#phone1").val() +"-"+$("#phone2").val()+"-"+$("#phone3").val();
						var price = $("#allPrice").val();
						var productName = $("#productName").val();
						var email = $("#email").val();
						//실제 결제 팝업 호출 
						// 호출시 필요한 데이터
						creditCard(productName,price,email,name,phone,
								address,postcode);
					}
					
				}

				// 장바구니 이동을 눌렀을 경우
				else if($(this).attr("id") == "cart_button") {
					alert("장바구니 페이지로 이동");
				}
				
			}
			
			// 무통장 체크 했을 경우
			else if($('input:radio[name="payment"]:checked').val() == 'bank_transfer') {
				// //무통장 입금에서 입금자, 은행 선택하는 창 보이게 하기
				$(".payment_info").css("display","block");
				//결제 하기 버튼 눌렀을 경우
				if($(this).attr("id") == "payment_button") {
					var result = checkRex();
					var result2 = checkRex2();
					if(result == false || result2 == false) {
						alert("필수정보를 형식에 맞게 입력해주세요");
					}else if(result == true && result2 == true) {
						alert("무통장 입금 페이지로 이동");
					}
					
					
				}
				
				
			}
			
			
			//결제 수단 체크 안했을 경우
			else {
				//장바구니 이동을 눌렀을 경우 (결제 수단 체크와 관계없이 페이지 이동) 
				if($(this).attr("id") == "cart_button") {
					alert("장바구니 페이지로 이동");
				}
				else {
					alert("결제 수단을 체크해주세요");					
				}
			}			
		}
	});
	
	
	
	//배송지 선택 라디오 버튼을 클랙했을 경우
	$("input:radio[name=addressRadio]").click(function () {
		//로그인을 하지 않았을 경우에는 이용 불가
		if($("#id").val() == "") {
			alert("로그인을 하셔야 이용할 수 있는 서비스 입니다.");
		}else {
			//나의 기존 배송지를 클릭 했을 경우
			if($(this).attr("id") == "myAddress") {
				var contextPath = getContextPath();
				// 멤버 테이블로 부터 
				// 이름 , 우편번호, 주소, 상세주소, 연락처를 가져온다.
				$.ajax({
					type : 'post',
					url : contextPath+'/member/myAddress.do',
					dataType : "json",
					data : {
							"id" : $("#id").val()
					},
					success : function (data) {
						$("#name").val(data.name);
						$("#postcode").val(data.post_code);
						$("#address").val(data.address);
						$("#detailAddress").val(data.address2);
						$("#phone2").val(data.phone);
						$("#phone3").val(data.phone2);
						$("#email").val(data.email);
					},
					error : function(request,status,error) {
						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
				});  
			 }else { // 새로운 배송지 클릭 했을 경우
				$("#name").val("");  
				$("#postcode").val("");
				$("#address").val("");
				$("#detailAddress").val("");
				$("#phone2").val("");
				$("#phone3").val("");
				$("#msg").val("");
				
				var contextPath = getContextPath();
				 $.ajax({
						type : 'post',
						async : false,
						url : contextPath+'/member/newAddress.do',
						dataType : "text",
						data : {
								"id" : $("#id").val()
						},
						success : function (data) {
							$("#email").val(data);
						},
						error : function(request,status,error) {
							 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}	
					});  
			}
			
		}
		
	});
	
	
	//배송지 정보 입력 체크 메소드
	function checkRex() {
		
		//이름 한글 2-5자 인지 
		//우편번호 readonly이므로 ""인지 아닌지 
		//주소 readonly이므로 ""인지 아닌지 
		//상세주소 ""인지 아닌지
		//연락처 4자리 숫자만 가능하므로 숫자아닐경우 숫자 입력해주세요 출력
		//배송메세지는 필수 입력사항이 체크대상아님
		
		// ---- 배송지 정보 입력란 정보들 가져오기  -----
		var name = $("#name").val();
		var postcode = $("#postcode").val();
		var address = $("#address").val();
		var detailAddress = $("#detailAddress").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		
		//--------------------------------------
		
		
		//----- 배송지 정보 정규식 체크 ----------------
		
		
		var nameReg = /^[가-힣]{2,5}$/; // 한글 2자~5자까지 한글이름
		var phoneReg = /^([0-9]{4})$/; // 휴대폰 4자리
		var emp = /\s/g; 	//공백 체크 정규식
		
		var nameResult = nameReg.test(name); // 이름 정규식 체크 결과
		var postCodeResult = isEmpty(postcode); // 우편번호 체크결과
		var addressResult = isEmpty(address); // 주소 체크결과
		var detailAddressResult = isEmpty(detailAddress); // 상세주소 체크결과
		var phone2Result = phoneReg.test(phone2); // 휴대폰 중간 번호 체크결과
		var phone3Result = phoneReg.test(phone3); // 휴대폰 끝 번호 체크결과 
		
		// 체크를 모두 통과 했을 떄만 결제로 넘어가기
		if(nameResult == true && postCodeResult == true && 
				addressResult == true && detailAddressResult == true 
				&& phone2Result == true && phone3Result == true) {
			return true;
		}
		else {
			return false;
		}
		
		
	}
	
	function checkRex2 () {
		var name = $("#depositor_name").val(); //입금자명을 가져옴
		var bank = $("#bank option:selected").val(); //입금은행의 값을 가져옴
		var nameReg = /^[가-힣]{2,5}$/; // 한글 2자~5자까지 한글이름
		var nameResult = nameReg.test(name);
		var bankResult = checkBank(bank);
		var finalResult = false;
		
		if(nameResult == true && bankResult == true) {
			finalResult = true;
		} 
		return finalResult;
	}
	
	function checkBank(str) {
		var result;
		if(str == "선택해주세요") {
			result = false;
		}else {
			result = true;
		}
		return result;
	}
	
	function isEmpty(str){
		
		if(typeof str == "undefined" || str == null || str == "") {
			return false;			
		}
		else {
			return true;			
		}
	}
	
	function creditCard(productName,price,email,name,tel,address,postcode) {
		 var IMP = window.IMP; // 생략가능
			IMP.init("imp92598436");
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				
				 /*'kakao':카카오페이,
				 html5_inicis':이니시스(웹표준결제)
				 'nice':나이스페이
				 'jtnet':제이티넷
				 'uplus':LG유플러스
				 'danal':다날
				 'payco':페이코
				 'syrup':시럽페이
				 'paypal':페이팔*/
				 

				pay_method : 'card',
				
				 /*'samsung':삼성페이,
				 'card':신용카드,
				 'trans':실시간계좌이체,
				 'vbank':가상계좌,
				 'phone':휴대폰소액결제,*/
				 
				merchant_uid : 'merchant_' + new Date().getTime(),
				
			/*	 merchant_uid에 경우
				 https://docs.iamport.kr/implementation/payment
				 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 참고하세요.
				 나중에 포스팅 해볼게요.*/
				 
				name : productName,
				//결제창에서 보여질 이름
				amount : price,
				//가격
				buyer_email : email,
				buyer_name : name,
				buyer_tel : tel,
				buyer_addr : address,
				buyer_postcode : postcode,
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			
			/* 모바일 결제시,
			 결제가 끝나고 랜딩되는 URL을 지정
			 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {		
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					
					//결제 내역을 추가 하기
					$("#insertHistoryForm").submit();
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
	}
	
	
	
	
	
	
	
	
	
	$("#postCode_button").click(function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
             
                $("#postcode").val(data.zonecode); //5자리 새우편번호 사용
                $("#address").val(fullAddr); // 주소를 입력
                // 커서를 상세주소 필드로 이동한다.
                $("#detailAddress").focus();
            }
        }).open();
        
      }); // click() 메소드 끝
	
	 
	 //배송 메세지 입력 완료시 이벤트 발생
	 $("#msg").keyup(function() {
			//바이트를 체크하기 위해 한글은 2바이트 영어 숫자 특수문자는 1바이트
		 	bytesHandler(this);
	 });
	 
	 function getTextLength(str) {
			var len = 0; // 영어, 특수문자, 숫자
			var len2 = 0; // 한글

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len2++; //한글 입력시 1증가
				}
				else {
					len++;	// 영어, 특수문자, 숫자				
				}
			}
			return len+len2; // 모든 글자의 수 리턴
		}

		function bytesHandler(obj) {
			//입력한 배송메세지를 전부 가져옴
			var text = $(obj).val()
			//50자 제한을 체크 하기 위해 길이를 구함
			var textLength = getTextLength(text);
			// 글자가 50자 이상일 경우
			if(textLength > 50) {
				//카운트를 50으로 설정하고
				$("#msgCount").text(50);
				//경고창 출력
				alert("배송 메세지는 50자까지 입력 가능합니다.\n초과된 내용은 자동으로 삭제됩니다.");
				//50자까지 자르고
				text = text.substring(0,50);
				$("#msg").val(text);
				textLength = getTextLength(text);
			}else if (textLength <= 50){
				$("#msgCount").text(textLength);
			}
		}
		
});