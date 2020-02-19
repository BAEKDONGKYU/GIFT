function coupon_check(){
	
	if(subject.value==""){
		$("#coupon_check_message").text("쿠폰 명을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(content.value == ""){
		
		$("#coupon_check_message").text("쿠폰 설명을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(percent.value == ""){
		
		$("#coupon_check_message").text("쿠폰의 할인률을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(day1.value == ""){
		
		$("#coupon_check_message").text("시작일을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(day2.value == ""){
		
		$("#coupon_check_message").text("종료일을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(price.value == ""){
		
		$("#coupon_check_message").text("조건가격을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else{
		$("#CouponForm").submit();
	}
}
