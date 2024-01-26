<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/css/mapservice.css">
<title>스토리 작성</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Script Setting -->
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1991e110a0fbe362aac08fce1f5fba8c"></script>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/roadpet/resources/css/board.css">
</head>

<body>
	<div class="container-fluid position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>

		<div class="content open">

			<%@ include file="/header.jsp"%>
			<%@ include file="/sidebar.jsp"%>

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4" style="width: 60%; margin: auto;">
					<c:forEach items="${list}" var="vo">
						<div class="bg-light rounded">
							<div style="display: flex; gap: 20px;">
								<div>
									<h6 style="padding: 5px;">${vo.story_title}</h6>
											</div>
											<div class="myinfo">
												<div
													class="d-flex align-items-center justify-content-right mb-2">
													<dl>
														<dt>날짜</dt>
														<dd>${vo.story_date}</dd>
													</dl>
													<dl>
														<dt>작성자</dt>
														<dd>${vo.user_id}</dd>
													</dl>
												</div>
											</div>
											<div class="cont">
												<h3>
													<img src="../resources/upload/${vo.story_photo}"
														width="250" height="200">
												</h3>
												<button type="button" class="btn btn-primary m-2"
													onclick="location.href='PetStory_one?story_id=${vo.story_id}'">상세보기
												</button>
											</div>
										</div>
									</div>
					</c:forEach>

				</div>
			</div>

			<hr color="red">




			<hr color="red">



			<%
				int pages = (int) request.getAttribute("pages"); //int <-- object
			for (int p = 1; p <= pages; p++) {
			%>
			<a href="PetStory_list?page=<%=p%>&story_private=0">
				<button class="btn btn-primary pages"><%=p%></button>
			</a>
			<%
				}
			%>


			<!-- Content End -->
			<!-- Back to Top -->
			<%
				if (session.getAttribute("user_id") != null) {
			%>
			<!-- 로그인한 경우 -->
			<div style="display: flex; justify-content: flex-end;">
				<span class="alert alert-success"> <%=session.getAttribute("user_id")%>님
					환영합니다.
				</span> <a
					href="PetStory_insert.jsp?user_id=<%=session.getAttribute("user_id")%>">
					<button type="button" class="btn btn-outline-danger m-2"
						id="insertType" aria-hidden="true">글쓰기</button>
				</a>
			</div>
			<%
				} else {
			%>
			<!-- 로그인하지 않은 경우 -->
			<div style="display: flex; justify-content: flex-end;">
				<a href="/roadpet/member/login.jsp">
					<button type="button" class="btn btn-primary m-2"
						style="float: right;">로그인 후 작성하기</button>
				</a>
			</div>
			<%
				}
			%>

		</div>
	</div>
</body>

</html>