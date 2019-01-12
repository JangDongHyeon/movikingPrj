<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../nav.jsp"%>
<script>
	var serverMovieCd='${movieCd}'
	var movies = $("#movieDiv");
	var theater = $("#theaterDiv");
	var ch = [false,false,false,false];
	var chNum=0;
	var arraySeat=[];
	var schedule_uid;
	var tuid;
	var Allcheck=false;
	var dataSeat=new Array();
	function checkDv(){
		if(ch[0]){
			$('div').remove('#theaterDiv');
			ch[0] = false;
				}
		if(ch[1]){
			$('#dateDiv*').remove();
			ch[1] = false;
				}
		if(ch[2]){
			$('#timeDiv*').remove();
			ch[2] = false;
				}
		if(ch[3]){
			$('#seats').empty();
			ch[3] = false;
				}
	}
	
	$(document)
			.ready(
					function() {	
						$.ajax({
									url : "/movies/listJson",
									datatype : "json",
									success : function(data) {
										str = "";
										var moCh=false;
										$(data)
												.each(
														function(key, item) {

															str += "<div class='col-md-12' id='movieDiv'>";														
															if(item.movieCd===serverMovieCd){
																
																str+="<input type='radio' name='movie' id='movie" + key + "' value='" + item.movieCd + "' checked>";
																moCh=true;
															}
															else{
															str += "<input type='radio' name='movie' id='movie" + key + "' value='" + item.movieCd + "'>";
															}
															str += "<label for='movie" + key + "'>"
																	+ item.movieNm
																	+ "</label></div>";

														});

										$("#movies").children().append(str);
										if(moCh) {
											getTheaterList(serverMovieCd);
											
										}

										$("input[name='movie']")
												.change(
														function() {
															Allcheck=false;
															if(ch[0]){
																$('div').remove('#theaterDiv');
																ch[0] = false;
																	}
															if(ch[1]){
																$('#dateDiv*').remove();
																ch[1] = false;
																	}
															if(ch[2]){
																$('#timeDiv*').remove();
																ch[2] = false;
																	}
															if(ch[3]){
																$('#seats').children().remove();
																ch[3] = false;
																	}
															var movieCd = $(
																	this).val();

															getTheaterList(movieCd);
														});
									}

								});

					});
	function getTheaterList(movieCd) {
		$
				.ajax({
					url : '/ticket/theaterList/' + movieCd,
					dataType : 'json',
					success : function(data) {

						ch[0] = true;
						str = "";
						$(data)
								.each(
										function(key, item) {

											str += "<div class='col-md-12' id='theaterDiv'>";
											str += "<input type='radio' name='theater' id='theater" + key + "' value='" + item.theater_uid+ "'>";
											str += "<label for='theater" + key + "'>"
													+ item.theater_name
													+ "</label></div>";

										});

						$("#theaters").children().append(str);

						$("input[name='theater']").change(function() {
							Allcheck=false;
							if(ch[1]){
								$('#dateDiv*').remove();
								ch[1] = false;
									}
							if(ch[2]){
								$('#timeDiv*').remove();
								ch[2] = false;
									}
							if(ch[3]){
								$('#seats').children().remove();
								ch[3] = false;
									}
							tUid = $(this).val();
							getDateList(movieCd, tUid);
						});
					}

				});
	}
	function getDateList(movieCd, tUid) {
		$
				.ajax({
					url : '/ticket/dateList/' + movieCd + '/' + tUid,
					dataType : 'json',
					success : function(data) {
						ch[1] = true;
						str = "";
						console.log(data);
						$(data).each(function(key, item) {

											str += "<div class='col-md-12' id='dateDiv'>";
											str += "<input type='radio' name='date' id='date" + key + "' value='" + item.schedule_date+ "'>";
											str += "<label for='date" + key + "'>"
													+ item.schedule_date
													+ "</label></div>";

										});
						$("#dates").append(str);

						$("input[name='date']").change(function() {
							Allcheck=false;
							if(ch[2]){
								$('#timeDiv*').remove();
								ch[2] = false;
									}
							if(ch[3]){
								$('#seats').children().remove();
								ch[3] = false;
									}
							getTimeList(data,tUid);
						});
					}

				});
	}
	function getTimeList(data,tUid) {
		ch[2] = true;
		str = "";
		$(data)
				.each(
						function(key, item) {
							schedule_uid=item.schedule_uid;
							str += "<div class='col-md-12' id='timeDiv'>";
							str += "<input type='radio' name='time' id='time" + key + "' value='" + item.theater_time+ "'>";
							str += "<label for='time" + key + "'>"
									+ item.theater_time + "</label></div>";

						});
		$("#times").append(str);
		$("input[name='time']").change(function() {
			if(ch[3]){
				Allcheck=false;
				$('#seats').children().remove();
				ch[3] = false;
					}
			getSeatList(tUid,schedule_uid);
		});
		
	}
	function getSeatList(tUid,schedule_uid){
		ch[3] = true;
		$.ajax({
			url:'/ticket/seatList/'+tUid,
			dataType:'json',
			success:function(data){
				str = "";
		
				$(data).each(function(key,item){
					str+="<button class='btn btn-default' id='seatBtn"+key+"' type='button' data-value='"+item.seat_uid+"' data-name='seatBt'>"+item.seat_uid+"</button>";
				
					arraySeat[key]=item.issue;
					
					
				});
			
				
				$("#seats").append(str);
				issuCek(arraySeat);
				$("#seats").on("click","button",function(){
					Allcheck=true;
					if($(this).data("name")==='x'){
						alert("좌석이 없습니다");
						return false;
					}
					if($(this).data("name")==='seatChOn'){
						if(confirm("자리를 취소하겠습니까?")===true){
							$(this).css("background-color","#A4A4A4");
							$(this).data("name","seatBt");
							for(var i=0;i<dataSeat.length;i++){
								if(dataSeat[i]===$(this).data("value")){
									dataSeat.splice(i,1);								
								}
							}
							return false;
						}
					}
					
					if(confirm("이 자리를 선택하시겠습니까?")==true){
						$(this).css("background-color","#639d34").css("border-color","#639d34");						
						$(this).data("name","seatChOn");
						dataSeat.push($(this).data("value"));
						console.log(dataSeat);
						return false;
					}
					
					
				
				});
			}
			
		});
	}
	
	$(document).ready(function() {
		$("form").on("submit", function() {
			if (Allcheck === false) {
				alert("항목을 선택해주세요");				
				return false;				
			} else {
				str+=" <input type='hidden'name='tUid' value='"+tUid+"'>";
				str+=" <input type='hidden'name='schedule_uid' value='"+schedule_uid+"'>";
				for(var i=0;i<dataSeat.length;i++){
					str+=" <input type='hidden'name='dataSeat' value='"+dataSeat[i]+"'>";
				}
				$(this).append(str);
				$(this).attr("action","/ticket/ticketInsert");
				$(this).attr("method","POST");
				return true;
			

			}
		});
	});

	function issuCek(arraySeat) {
		console.log(arraySeat);
		for (i = 0; i < arraySeat.length; i++) {
			if (arraySeat[i] == 1) {
				$("#seatBtn" + i).css("background-color", "#639d34");				
				$("#seatBtn" + i).data("name", "x");
				
			}
		}
	}
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/ticket/ticket-main.css" />
<section>
	<div class="container-fluid">
		<form>
			<input type="hidden"
	name="${_csrf.parameterName}"
	value="${_csrf.token}"/>
			<div class="row">
				<div id="movies" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">영화</h3>
						</div>
					</div>
				</div>
				<div id="theaters" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">극장</h3>
						</div>
					</div>
				</div>
				<div id="dates" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">날짜</h3>
						</div>
					</div>
				</div>
				<div id="times" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">시간</h3>
						</div>
					</div>
					<div></div>
				</div>
			</div>
			<div id="seats" class="row">
				<div class="col-md-12 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">좌석</h3>
						</div>
						<div class="col-md-12">
							<div class="container show-grid" style="width: 700px;"  id="seats">
							
							</div>

						</div>
					</div>
				</div>
			</div>
			<div id="btns" class="row">
				<div class="col-md-12 p-0 d-flex">
					<button class="w-100 bg-success text-light" type="submit">결제</button>
				</div>
			</div>
		</form>
	</div>
</section>
<style>
body .btn-default {
	background-color:#A4A4A4;
    border-color: #7bc143;

    }
body .btn-default:hover, body .btn-default:focus {
      border-color: #6fb03a;
      background-color: #6fb03a;
      color: #FFF; }
    body .btn-default:active, body .btn-default:visited, body .btn-default:active:focus, body .btn-default:active:hover {
      border-color: #639d34;
      background-color: #639d34;
      color: #FFF; }
} 
</style>
<%@include file="../footer.jsp"%>
