$(function () {
		
		//구매내역 페이지 처음 접속 여부 판별 해주는 변수
		var count = sessionStorage.getItem("count");
		//구매내역 페이지 접속시  최근 3개월 간의 내역을 자동으로 보여줌
		//먼저 로그인 여부 체크
		if($("#id").val() != null ) {
			if(count == "" || count == null) {
				$("#month").val("three");
				//세션에 카운트 추가
				sessionStorage.setItem("count", "first");
				$("#searchForm").submit();
			}
		}
		
		//오늘 날짜 가져오기
		$.datepicker._gotoToday = function(id) {
		    $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
		};
		
		//datePicker 달력 날짜 설정
		var dateFormat = "yy-mm-dd", from = $("#startDate").datepicker(
				{	maxDate : 0,
					minDate : "-2Y",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					showButtonPanel: true,
					yearSuffix : '년',
					currentText : "오늘",
					closeText:"초기화",
					dateFormat : 'yy-mm-dd',
					onClose: function () {
				        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
				            $(this).val('');
				            from.datepicker("option", "maxDate", 0);
				        }
					}	
				}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#endDate").datepicker(
				{
					minDate : 0,
					maxDate : "0",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					showButtonPanel: true,
					currentText :"오늘",
					yearSuffix : '년',
					closeText:"초기화",
					dateFormat : 'yy-mm-dd',
					onClose: function () {
				        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
				            $(this).val('');
				            to.datepicker("option", "maxDate", "0");
				            to.datepicker("option", "minDate", 0);
				        }
					}		
				}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});
		
		//datePicker에서 선택한 날짜 가져오는 메소드
		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}
			return date;
		}
		
		//전체 버튼 클릭시
		$("#allMonths").click(function () {
			if($("#id").val() != null ) {
				$("#month").val("all");
				$("#searchForm").submit();
			}
		});
		
		//1개월 버튼 클릭시
		$("#oneMonth").click(function () {
			$("#month").val("one");
			$("#searchForm").submit();
		});
		
		//3개월 버튼 클릭시
		$("#threeMonths").click(function () {
			$("#month").val("three");
			$("#searchForm").submit();
		});
		
		//6개월 버튼 클릭시
		$("#sixMonths").click(function () {
			$("#month").val("six");
			$("#searchForm").submit();
		});
		
		
		
		//검색 버튼 클릭시
		$("#search").click(function () {
			//먼저 달력의 시작날짜 끝날짜 여부 체크
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			
			//마지막 날짜 미입력시...
			if(startDate != "" && endDate == "") {
				alert("검색하실 마지막 날짜를 입력해주세여");
			}
			//시작날짜 미입력시...
			else if(endDate != "" && startDate == "") {
				alert("검색하실 시작 날짜를 입력해주세여");
			}
			
			//둘다 입력시..
			else if(startDate != "" && endDate != ""){
				$("#month").val("between");
				$("#searchForm").submit();
			}
			//둘다 미입력시
			else {
				$("#month").val("all");
				$("#searchForm").submit();
			}
			
			
			//검색 버튼 클릭시 시작날짜 끝날짜 값 여부 체크
			//둘다 없을 경우 전체 내역 보여주기
			//시작날짜 || 또는 끝날짜만 입력되어 있을 경우
			// 경고창 띄워서 입력해달라고 하고
			// 둘다 입력 되었을 경우  sql문 실행
		});
		
		
		
		
		
});