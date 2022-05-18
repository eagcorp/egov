<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="comSymMnuMpm.mainView.mainViewTitle"/></title><!-- 행정안전부 공통서비스 테스트 사이트 -->
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/jquery-2.2.4.min.js' />"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/script.js' />"></script>

	<link href="<c:url value='/js/egovframework/eagcss/style.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/aos.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/default.css' />" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
	<script language="javascript">

function chk_all(val) {

	var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =true;
			}
		}
		else if(val == "N") {
			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =false;
			}
		}
}

</script>
</head>

<%--<!-- header -->--%>
<%--<c:import url="./head.jsp" />--%>

<%--<!-- contents -->--%>
<%--<div>--%>
<%--	<!-- 상단 -->--%>
<%--	<div class="mp_top">--%>

<%--		<div class="l"><!-- right layout -->--%>
<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.subMenuList"/></h3><!-- 부메뉴 목록 보기 -->--%>
<%--			<div style="height:150px">--%>
<%--			<iframe name="frmSubMemnuList" src="" width="100%" height="160" border="0" frameborder="no" scrolling="no" marginwidth="0" hspace="0" vspace="0"></iframe>--%>
<%--			</div>--%>

<%--			<!-- 부서일정관리  -->--%>
<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.deptSchdulManageMainList"/></h3><!-- 부서일정관리 -->--%>
<%--			<div style="height:150px">--%>
<%--			<c:import charEncoding="utf-8" url="/cop/smt/sdm/EgovDeptSchdulManageMainList.do" ></c:import>--%>
<%--			</div>--%>

<%--			<!-- 나의일정관리 -->--%>
<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.indvdlSchdulManageMainList"/></h3><!-- 나의일정관리 -->--%>
<%--			<div style="height:150px">--%>
<%--			<c:import charEncoding="utf-8" url="/cop/smt/sim/EgovIndvdlSchdulManageMainList.do" ></c:import>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="r"><!-- left layout -->--%>
<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.selectBBSListPortlet"/></h3><!-- 생성된 게시판 목록 -->--%>
<%--			<div style="height:150px">--%>
<%--				<c:import url="/cop/bbs/selectBBSListPortlet.do" />--%>
<%--			</div>--%>

<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.selectCommuMasterListPortlet"/></h3><!-- 생성된 커뮤니티 목록 -->--%>
<%--			<div style="height:150px">--%>
<%--				<c:import url="/cop/cmy/selectCommuMasterListPortlet.do" />--%>
<%--			</div>--%>

<%--			<h3 class="m_tit01 mt15"><spring:message code="comSymMnuMpm.mainView.selectBlogListPortlet"/></h3><!-- 생성된 블로그 목록 -->--%>
<%--			<div style="height:150px">--%>
<%--				<c:import url="/cop/bbs/selectBlogListPortlet.do" />--%>
<%--			</div>--%>
<%--		</div>--%>

<%--	</div>--%>
<%--</div><!-- contents -->--%>
<header>
	<div class="header_wrap">
		<!--로고-->
		<h1>
			<a href="<c:url value='/sym/mnu/mpm/EgovMainMenuHome.do' />" target="_top">
				<img src="<c:url value='/images/common/logoW.png' />" alt=""/>
			</a>
		</h1>

		<!--메뉴-->
		<ul>
			<li class="menu"><a href="#">회사소개</a>
				<ul class="sub_menu">
					<li><a href="greeting.html">인사말</a></li>
					<li><a href="#">주요연혁</a></li>
					<li><a href="#">CI소개</a></li>
					<li><a href="#">조직도</a></li>
					<li><a href="#">오시는길</a></li>
				</ul>
			</li>
			<li class="menu"><a href="/eag_war_exploded/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000001">공지사항</a>
				<ul class="sub_menu">
					<li><a href="board.html">공지사항</a></li>
					<li><a href="#">보도자료</a></li>
					<li><a href="#">고객문의</a></li>
					<li><a href="#">채용정보</a></li>
				</ul>
			</li>
			<li class="menu"><a href="#">주요사업</a>
				<ul class="sub_menu">
					<li><a href="l#">사업1</a></li>
					<li><a href="#">사업2</a></li>
					<li><a href="#">사업3</a></li>
				</ul>
			</li>
			<li class="menu"><a href="#">갤러리</a>
				<ul class="sub_menu">
					<li><a href="gallery.html">갤러리</a></li>
					<li><a href="#">자료실</a></li>
				</ul>
			</li>
			<li class="menu"><a href="#">회원공간</a>
				<ul class="sub_menu">
					<li><a href="#">자주하는질문</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="#">서비스매뉴얼</a></li>
				</ul>
			</li>
		</ul>

		<!--로그인-->
		<ul class="log">
			<li><a href="#">JOIN</a></li>
			<li><a href="login.html">LOGIN</a></li>
		</ul>
	</div>
</header>


<!--모바일메뉴-->
<div id="page">
	<div id="toggle">
		<div class="hamburger" id="ham">
			<span class="line"></span>
			<span class="line"></span>
			<span class="line"></span>
		</div>
	</div>
	<section id="overlay">
		<nav>
			<ul>
				<li class="m_menu"><a href="#">회사소개</a>
					<ul class="m_smenu">
						<li><a href="greeting.html">인사말</a></li>
						<li><a href="#">주요연혁</a></li>
						<li><a href="#">CI소개</a></li>
						<li><a href="#">조직도</a></li>
						<li><a href="#">오시는길</a></li>
					</ul>
				</li>
				<li class="m_menu"><a href="#">공지사항</a>
					<ul class="m_smenu">
						<li><a href="board.html">공지사항</a></li>
						<li><a href="#">보도자료</a></li>
						<li><a href="#">고객문의</a></li>
						<li><a href="#">채용정보</a></li>
					</ul>
				</li>
				<li class="m_menu"><a href="#">주요사업</a>
					<ul class="m_smenu">
						<li><a href="#">사업1</a></li>
						<li><a href="#">사업2</a></li>
						<li><a href="#">사업3</a></li>
					</ul>
				</li>
				<li class="m_menu"><a href="#">갤러리</a>
					<ul class="m_smenu">
						<li><a href="gallery.html">갤러리</a></li>
						<li><a href="#">자료실</a></li>
					</ul>
				</li>
				<li class="m_menu"><a href="#">회원공간</a>
					<ul class="m_smenu">
						<li><a href="#">자주하는질문</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">서비스매뉴얼</a></li>
					</ul>
				</li>
			</ul>
			<ul class="m-log">
				<li><a href="#">JOIN</a></li>
				<li><a href="login.html">LOGIN</a></li>
			</ul>
		</nav>
	</section>
</div>


<!--메인비쥬얼슬라이드-->
<div id="main-visual">
	<div class="main-slider">
		<div class="swiper-wrapper">
			<div class="swiper-slide slide01">
				<div class="slide-txt">
					<p class="tit">eag is ability of imagination</p>
					<p>Always Good! Comprehensive Marketing</p>
					<a href="#">VIEW MORE</a>
				</div>
			</div>
			<div class="swiper-slide slide02">
				<div class="slide-txt">
					<p class="tit">eag is ability of imagination</p>
					<p>Always Good! Comprehensive Marketing</p>
					<a href="#">VIEW MORE</a>
				</div>
			</div>
			<div class="swiper-slide slide03">
				<div class="slide-txt">
					<p class="tit">eag is ability of imagination</p>
					<p>Always Good! Comprehensive Marketing</p>
					<a href="#">VIEW MORE</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Add Arrows -->
	<div class="slid-Control">
		<div class="swiper-pagination"></div>
	</div>
</div>


<!--공지-->
<section id="notice">
	<ul class="notice_wrap">
		<h1 class="main_tit">NOTICE <a href="#">MORE +</a></h1>
		<li>
			<div data-aos="zoom-in" data-aos-duration="1000">
				<div class="con">
					<span>2022-05-09</span>
					<p>[한국특허전략개발원] 2022년 한국특허개발원 협력기관 통합 풀(POOL)모집안내</p> <!--공지사항 타이틀-->
					<a href="/eag_war_exploded/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000001"><img src="<c:url value='/images/common/btn-more.png' />" alt=""/></a>
				</div>
			</div>
		</li>
		<li>
			<div data-aos="zoom-in" data-aos-duration="1300">
				<div class="con">
					<span>2022-04-20</span>
					<p>(재)대구경북디자인진흥원 2022년 입주기업 2차 모집공고</p> <!--공지사항 타이틀-->
					<a href="#"><img src="<c:url value='/images/common/btn-more.png' />" alt=""/></a>
				</div>
			</div>
		</li>
		<li>
			<div data-aos="zoom-in" data-aos-duration="1600">
				<div class="con">
					<span>2022-04-03</span>
					<p>[한국특허전략개발원] 2022년 한국특허개발원 협력기관 통합 풀(POOL)모집안내</p> <!--공지사항 타이틀-->
					<a href="#"><img src="<c:url value='/images/common/btn-more.png'/>" alt=""/></a>
				</div>
			</div>
		</li>
		<li>
			<div data-aos="zoom-in" data-aos-duration="1900">
				<div class="con">
					<span>2022-03-26</span>
					<p>(재)대구경북디자인진흥원 2022년 입주기업 2차 모집공고</p> <!--공지사항 타이틀-->
					<a href="#"><img src="<c:url value='/images/common/btn-more.png' />" alt=""/></a>
				</div>
			</div>
		</li>
	</ul>
</section>


<!--배너-->
<div id="banner">
	<div class="bn_txt">
		<h1>Positive Thinking & Responsible Action</h1>
		<p>생각의 가능성과 그 가능성의 힘을 믿습니다.</p>
	</div>
</div>



<!--갤러리-->
<section id="gallery">
	<div class="gallery_wrap">
		<h1 class="main_tit">GALLERY <a href="#">MORE +</a></h1>
		<ul>
			<li onClick="location.href='#'" data-aos="fade-up" data-aos-duration="1000">
				<div class="con"></div>
				<p>새로운 사업영역을 소개합니다.<span>2022-05-09</span></p>
			</li>
			<li onClick="location.href='#'"  data-aos="fade-up" data-aos-duration="1300">
				<div class="con"></div>
				<p>모바일광고, 효율성을 보자!<span>2022-05-09</span></p>
			</li>
			<li onClick="location.href='#'" data-aos="fade-up" data-aos-duration="1600">
				<div class="con"></div>
				<p>고객만족도 1위 수상!<span>2022-05-09</span></p>
			</li>
			<li onClick="location.href='#'" data-aos="fade-up" data-aos-duration="1900">
				<div class="con"></div>
				<p>반응형 사이트 제작<span>2022-05-09</span></p>
			</li>
		</ul>
	</div>
</section>


<!--푸터-->
<footer>
	<div class="footer_wrap">
		<h1><a href="#"><img src="<c:url value='/images/common/logo_F.png' />" alt=""/></a></h1>
		<p>
			대구 달서구 달서대로 559, 이앤씨이노비즈타워 7층 701호<br/>
			eag@eag.co.kr<span>eagweb@daum.net</span><br/>
			T. 070-4327-7610~3<span>F. 0505-919-1073</span><br/>
			©eag. All Rights Reserved.
		</p>
		<div class="btn-top"><span><img src="<c:url value='/images/common/up.png' />"></span></div>
	</div>
</footer>

<script src="<c:url value='/js/egovframework/eagjs/aos.js' />"></script>
<script>
	AOS.init({
		easing: 'ease-in-out-sine'
	});
</script>
</body>
</html>
