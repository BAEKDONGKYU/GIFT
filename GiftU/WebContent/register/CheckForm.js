
/*
 Register.html 값들이 유효한지 확인
 -이름: 2자~5자
 -id: 3자~8자
 -비밀번호 : 8자~12자 사이
 -비밀번호 확인란도 검사
 -주민번호: 앞 6자리, 뒷 7자리

 */
var pw_passed = true;
// Register.html 파일에서 가입버튼 눌렀을 때 가입할 회원내용이 유효한지 확인한다.
function CheckForm() {
	var name = document.getElementById("name");
	var id = document.getElementById("id");
	var pass = document.getElementById("pass");
	var pass2 = document.getElementById("pass_2");
	var tel = document.getElementById("tel");
	var tel_2 = document.getElementById("tel_2");

	var email = document.getElementById("email");

	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@\#$%<>^&*]/;
	var pw_msg = "";

	//---------------------이름,아이디, 비밀번호-----------------------------------

	if (name.value.length < 2 || name.value.length > 5) {
		alert("이름은 2~5자이내로 작성하세요.");
		name.select(); //이름 input입력 태그란에 입력된 텍스트 전체 선택
		return false;
	}
	if (id.value == "") {
		alert("아이디를 입력해주세요");
		return false;
	}
	if (!pattern1.test(pass.value) || !pattern2.test(pass.value)
			|| !pattern3.test(pass.value) || pass.value.length < 8
			|| pass.value.length > 10) {

		alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
		pass.select();
		return false;

	}

	if (pass2.value != pass.value) {
		alert("비밀번호가 다릅니다.");
		pass2.select();
		return false;
	}
	//---------------------이름,아이디, 비밀번호-----------------------------------		

	//----------------주민번호 -----------------		

	/*	 if (birth.value.length != 6)
	 {
	 alert("올바른 주민등록번호를 입력해주세요.");
	 birth.value = "";
	 birth.focus();
	 }
	 else if (birth_uni.value.length != 7)
	 {
	 alert("올바른 주민등록번호를 입력해주세요.");
	 birth_uni.value = "";
	 birth_uni.focus();
	 }
	 else
	 {
	
	 var str_birth = birth.value;
	 var str_birth_uni = birth_uni.value;
	 var digit=0
	 for (var i=0;i<str_birth.length;i++)
	 {
	 var str_dig=str_birth.substring(i,i+1);
	 if (str_dig<'0' || str_dig>'9')
	 {
	 digit=digit+1
	 }
	 }
	 if ((str_birth == '') || ( digit != 0 ))
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	 return false;  
	 }
	
	 var digit1=0
	 for (var i=0;i<str_birth_uni.length;i++)
	 {
	 var str_dig1=str_birth_uni.substring(i,i+1);
	 if (str_dig1<'0' || str_dig1>'9')
	 {
	 digit1=digit1+1
	 }
	 }
	 if ((str_birth_uni == '') || ( digit1 != 0 ))
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	 return false;  
	 }
	 if (str_birth.substring(2,3) > 1)
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	
	 return false;  
	 }
	 if (str_birth.substring(4,5) > 3)
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	 return false;  
	 }
	 if (str_birth_uni.substring(0,1) > 4 || str_birth_uni.substring(0,1) == 0)
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	
	 return false;  
	 }
	 var a1=str_birth.substring(0,1)
	 var a2=str_birth.substring(1,2)
	 var a3=str_birth.substring(2,3)
	 var a4=str_birth.substring(3,4)
	 var a5=str_birth.substring(4,5)
	 var a6=str_birth.substring(5,6)
	 var check_digit=a1*2+a2*3+a3*4+a4*5+a5*6+a6*7
	 var b1=str_birth_uni.substring(0,1)
	 var b2=str_birth_uni.substring(1,2)
	 var b3=str_birth_uni.substring(2,3)
	 var b4=str_birth_uni.substring(3,4)
	 var b5=str_birth_uni.substring(4,5)
	 var b6=str_birth_uni.substring(5,6)
	 var b7=str_birth_uni.substring(6,7)
	 var check_digit=check_digit+b1*8+b2*9+b3*2+b4*3+b5*4+b6*5
	 check_digit = check_digit%11
	 check_digit = 11 - check_digit
	 check_digit = check_digit%10
	 if (check_digit != b7)
	 {
	 alert('잘못된 주민등록번호입니다.\n\n다시 확인하시고 입력해 주세요.');
	 birth.value = "";
	 birth_uni.value = "";
	 birth.focus();
	 return false; 
	 }
	
	 }*/
	//----------------주민번호 -----------------	

	//----------------이메일-----------------	
	var e_ch = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (email.value == '' || !e_ch.test(email.value)) {
		alert("올바른 이메일 주소를 입력하세요")
		return false;
	}

	//----------------이메일 -----------------

	//----------------휴대폰번호  -----------------		 
	if (tel.value.length != 4) {
		alert("휴대폰번호는 4자리로 입력하세요");
		birth.select();
		return false;
	}
	if (tel_2.value.length != 4) {
		alert("휴대폰번호는 4자리로 입력하세요");
		birth.select();
		return false;
	}

	if (!CheckValue(gender)) {
		alert("성별체크해주세요.");
		return false;

	}

}

//----------------휴대폰번호  -----------------		

function CheckValue(obj) {
	var value = 0; //체크 여부 판별 값(0또는 1저장)
	for (var i = 0; i < obj.length; i++) {
		if (obj[i].checked == true) {
			value = 1; //체크되었으면 1로 저장
			break;
		}
	}
	if (value == 0) {
		return false;
	} else {
		return true;
	}

}
function IDCheck() {
	if (document.register_form.id.value == "") {
		alert("아이디를 입력하세요.");
		document.register_form.id.focus();
		return;
	}

	//아이디를 입력 하였다면
	//입력한 아이디 값 얻기
	var id = document.register_form.id.value;
	var popupX = (window.screen.width / 2) - (200 / 2);
	var popupY = (window.screen.height / 2) - (200 / 2);

	//창열기 
	window.open("register_IDcheck.jsp?userid=" + id, "",
			'width=400,height=200 left=' + popupX + ',top=' + popupY);
}
