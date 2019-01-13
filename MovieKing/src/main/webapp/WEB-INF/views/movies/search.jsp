<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../nav.jsp"%>
<script>
$(document).ready(function(){
	var movieNm='${movieNm}';
	movieList(movieNm);
	
});
function movieList(movieNm){
	$.ajax({
		url:'/movies/searchList/'+movieNm,
		dataType:'json',
		success:function(data){
			var str="";
			$(data).each(function(key,item){
				str+="<tr> <td>"+item.movieNm+"</td>";
				if(item.openDt==''){
					str+="<td>개봉한적이없습니다</td>";
				}else{
				str+="<td>"+moment(item.openDt).format('MMM Do YYYY')+"</td>";
				}
				str+="<td>"+item.genreAlt+"</td>";
				str+="<td>"+item.nationAlt+"</td></tr>"
			});
			$("#tbo").append(str);
		}
			
	});
}

</script>


<div class="container">
	<h2>영화 검색</h2>  
	<div class="table-responsive">
	  <table class="table">
	    <thead>
	      <tr>
		<th>영화 제목</th>
		<th>개봉 날짜</th>
		<th>종류</th>
		<th>국가</th>
	      </tr>
	    </thead>
	    <tbody id="tbo">
	    </tbody>
	  </table>
	</div>
</div>


<%@include file="../footer.jsp"%>