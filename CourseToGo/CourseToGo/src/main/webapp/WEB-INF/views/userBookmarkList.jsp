<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.dto.CourseInformDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>List View Example</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    	<%
    List<CourseInformDTO> courseInformList = (List<CourseInformDTO>) request.getAttribute("CourseInformList");
    if (courseInformList != null) {
        for (CourseInformDTO course : courseInformList) {
        	int courseId = course.getCourseId();
        
            String courseName = course.getCourseName();
            int userId = course.getUserId();
          	double AvgScore = course.getCourseAvgScore();
            String courseList = course.getCourseList();
            String courseIdList = course.getCourseIdList();
            String courseContent = course.getCourseContent();
            String[] placeNames = courseList.split(",");
            String[] placeIds = courseIdList.split(",");
            String query="";
            int courseNumber = course.getCourseNumber();
         
            query+=("courseId="+ String.valueOf(courseId)+"&");
            for(int i= 0; i< courseNumber; i++){
            	query+="placeId"+(i+1) + "="+placeIds[i];
            	if(i!= courseNumber-1)query+="&";
            	else{
            	
            	}
            }
         
%>


<li class="list-group-item d-flex justify-content-between align-items-start">
<div class="ms-2 me-auto">
								<a href="/courseList/Map?<%= query %>">
								<h2>Course Id: <%= courseId %></h2>
								
								<span>Course Name: <%= courseName %></span>
								
								<span>UserId: <%= userId %></span>            
								<%-- placeIds 배열을 활용하여 필요한 작업 수행 --%>
								<br>
								<% for (String placeId : placeNames) { %>
								<span class="well"><%= placeId %></span>

<% }      %>
         	
						
								</a>
								<div>소개글: <%= courseContent %></div>   
							</div> <span class="badge bg-primary rounded-pill">${notice.hit}</span>
						</li>   
<%
        }
    }
%>
    	
    
    
    <div class="row justify-content-center">
		<div class="col-6">
			<nav class="page navigation">
				<ul class="pagination">
					<c:if test="${pageInfo.prev}">
						<li class="page-item">
							<a class="page-link" aria-label="Previous" 
							 href="#">Prev</a>
							<!--  href="/courseListWithPagination?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&keyword=${pageInfo.pageRequest.keyword}">Prev</a>-->	
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
						<li class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
							<a class="page-link" id="page-1"
							href="#">${num}</a>
							<!--	href="/courseListWithPagination?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&keyword=${pageInfo.pageRequest.keyword}">${num}</a>-->	
						</li>
					</c:forEach>
					<c:if test="${pageInfo.next}">
						<li class="page-item next">
							<a class="page-link" aria-label="next" 
							 href="#">Next</a>
							<!--	 href="/courseListWithPagination?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}">Next</a>-->	
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

 
	 
</body>
</html>