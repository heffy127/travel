<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>즐거운 여행 HT와 함께</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="../css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="../css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="../css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="../css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="../css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="../css/style.css">

<!-- 게시판 부트스트랩 -->
<link rel="stylesheet" href="../css/bootstrap_board.min.css">

<!-- Modernizr JS -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- ckeditor -->
<script src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>



<script type="text/javascript">
	function check() {
		var ss = '<%=(String)session.getAttribute("sessionId")%>'
		
		if(ss =="null"){
			alert("잘못된 접근입니다.")
			location.href = "board.jsp"
			return false;
		}	
		if(f.preface.value == 0){
			alert("말머리를 선택하세요.")
			return false;
		}
		if (f.subject.value == "") {
			alert("제목을 입력하세요.")
			f.subject.focus()
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요.")
			f.content.focus()
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function logout() {
		document.f_logout.submit()
	}
</script>
</head>
<body>
	<jsp:useBean id="bdto" class="board.BoardDTO" />
	<jsp:useBean id="bdao" class="board.BoardDAO" />

	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo">
								<table>
									<tr>
										<td><a href="../main/main.jsp">HT</a></td>
										<%
											if (session.getAttribute("sessionName") != null) {
										%>
										<td><font size="2" color="#f0ffed">&nbsp;&nbsp;&nbsp;&nbsp;${sessionName }님</font>&nbsp;</td>
										<td>
										<form action="../main/logout_ok.jsp" name="f_logout">
										<input type="hidden" value="<%=request.getRequestURL()%>" name="url">
										<a href="javascript::" onclick="logout()"><font size="1" color="yellow">로그아웃</font></a>
										</form>
										</td>
										<%
											}
										%>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1">
						<ul>
								<li><a href="../main/main.jsp">Home</a></li>
								<li><a href="../place/place.jsp">여행지</a></li>
								<li><a href="../course/course.jsp">코스</a></li>
								<li class="has-dropdown active">
									<a href="board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="../news/news.jsp">뉴스</a>
								<%if(session.getAttribute("sessionId") == null){ %>
								<li><a href="../member/loginPage.jsp">Login</a></li>
								<% } else { %>
								<li><a href="../mypage/mypage.jsp">MyPage</a></li>
								<%}; %>
								<li><a href="../contact/contact.jsp">고객의 소리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
					<li style="background-image: url(../images/main_3.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>HT 회원들의 커뮤니티</h2>
										<h1>소통광장</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<div id="colorlib-blog">
			<div align="center">
				<table>
					<tr>

					</tr>
					<tr>
						<td width="1000">
							<form action="board_write_ok.jsp" name="f" method="get"
								onsubmit="return check()">
								<table border="0" width="99%" height="90%">
									<tr height="50px">
										<td colspan="2" align="center">
											<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
												<a class="navbar-brand" href="board.jsp">자유게시판</a>
												<button class="navbar-toggler" type="button"
													data-toggle="collapse" data-target="#navbarColor01"
													aria-controls="navbarColor01" aria-expanded="false"
													aria-label="Toggle navigation">
													<span class="navbar-toggler-icon"></span>
												</button>
											</nav>
										</td>
									</tr>
									<tr>
										<td width="115px" height="35px"><select name="preface"
											style="width: 100px; height: 30px; font-size: 15px">
												<option value="0" selected="selected">--말머리--</option>
												<option value="일상">일상</option>
												<option value="추천">추천</option>
												<option value="질문">질문</option>
										</select></td>
										<td align="right"><input type="text" name="subject" size="170px"
											placeholder="제목 입력"></td>
									</tr>

									<tr height="600">
										<td colspan="2"><textarea name="content" id="editor1"
												rows="" cols="">
            									</textarea> 
            									<script>
														// Replace the <textarea id="editor1"> with a CKEditor
														// instance, using default configuration.
														CKEDITOR.replace('editor1',{
															height : '500px',
															enterMode: '2'
															});
												</script>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
										<br>
										<input type="hidden" name="writer" value=<%=(String)session.getAttribute("sessionId")%>>
										<button type="submit" class="btn btn-primary btn-lg"><font size="4">글 등록하기</font></button>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


	<footer id="colorlib-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-3 colorlib-widget">
					<h4>Tour Agency</h4>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia
						reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p>
					<ul class="colorlib-social-icons">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-linkedin"></i></a></li>
						<li><a href="#"><i class="icon-dribbble"></i></a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2 colorlib-widget">
					<h4>Book Now</h4>
					<p>
					<ul class="colorlib-footer-links">
						<li><a href="#">Flight</a></li>
						<li><a href="#">Hotels</a></li>
						<li><a href="#">Tour</a></li>
						<li><a href="#">Car Rent</a></li>
						<li><a href="#">Beach &amp; Resorts</a></li>
						<li><a href="#">Cruises</a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2 colorlib-widget">
					<h4>Top Deals</h4>
					<p>
					<ul class="colorlib-footer-links">
						<li><a href="#">Edina Hotel</a></li>
						<li><a href="#">Quality Suites</a></li>
						<li><a href="#">The Hotel Zephyr</a></li>
						<li><a href="#">Da Vinci Villa</a></li>
						<li><a href="#">Hotel Epikk</a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2">
					<h4>Blog Post</h4>
					<ul class="colorlib-footer-links">
						<li><a href="#">The Ultimate Packing List For Female
								Travelers</a></li>
						<li><a href="#">How These 5 People Found The Path to
								Their Dream Trip</a></li>
						<li><a href="#">A Definitive Guide to the Best Dining and
								Drinking Venues in the City</a></li>
					</ul>
				</div>

				<div class="col-md-3 col-md-push-1">
					<h4>Contact Information</h4>
					<ul class="colorlib-footer-links">
						<li>291 South 21th Street, <br> Suite 721 New York NY
							10016
						</li>
						<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
						<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
						<li><a href="#">yoursite.com</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart2" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span> <span class="block">Demo Images: <a
							href="http://unsplash.co/" target="_blank">Unsplash</a> , <a
							href="http://pexels.com/" target="_blank">Pexels.com</a></span>
					</p>
				</div>
			</div>
		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="../js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="../js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="../js/jquery.stellar.min.js"></script>

	<!-- Main -->
	<script src="../js/main.js"></script>

</body>
</html>
