<%
 /**
  * @Class Name : EgovArticleList.jsp
  * @Description : EgovArticleList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2016.06.13   김연호              표준프레임워크 v3.6 개선
  *   2018.06.15   신용호              페이징 처리 오류 개선
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title><!-- 게시글 목록 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/jquery-2.2.4.min.js' />"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/script.js' />"></script>

	<link href="<c:url value='/js/egovframework/eagcss/style.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/aos.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/default.css' />" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.articleForm.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
}
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_article(){
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_articledetail(bbsId, nttId) {
	alert('test');
	return true;
}
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.articleForm.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/cop/bbs/selectArticleList.do'/>";
   	document.articleForm.submit();
}
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_article(){
	document.articleForm.pageIndex.value = 1;
	document.articleForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_articledetail(bbsId, nttId) {
	// 사이트 키값(siteId) 셋팅.
	document.articleForm.bbsId.bbsId.value = bbsId;
	document.articleForm.nttId.value = nttId;
  	document.articleForm.action = "<c:url value='/cop/bbs/selectArticleDetail.do'/>";
  	document.articleForm.submit();
}
</script>
</c:otherwise>
</c:choose>
</head>
<body onload="fn_egov_init()">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<input name="nttId" type="hidden" value="0">
<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<!-- ************************************************************************************************************************** -->
<header>
	<div class="header_wrap">
		<!--로고-->
		<h1>
			<a href="index.html">
				<img src="images/common/logoW.png" alt=""/>
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
					<li><a href="#">사업1</a></li>
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


<!--탑배너-->
<div class="top_banner board_top">
	<div class="top_txt">
		<h1 data-aos="fade-down" data-aos-duration="1500">공지사항</h1>
		<p data-aos="fade-down" data-aos-duration="1000">이에이지의 새로운 소식을 확인하세요.</p>
	</div>
</div>


<!--서브페이지 메뉴-->
<section class="place">
	<div class="place_menu">
		<ul>
			<li class="on"><a href="#">공지사항</a></li>
			<li><a href="#">보도자료</a></li>
			<li><a href="#">고객문의</a></li>
			<li><a href="#">채용정보</a></li>
		</ul>
	</div>
</section>

<!--서브페이지 타이틀-->

<div class="sub_title">
	<h1>공지사항</h1>
	<p><c:out value="${boardMasterVO.bbsNm}"/></p>
</div>

<section id="board">
	<div class="board_wrap">
		<form name="articleForm" action="<c:url value='/cop/bbs/selectArticleList.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;">
			<%--	<h1>${pageTitle} <spring:message code="title.list" /> (<c:out value="${boardMasterVO.bbsNm}"/>)</h1><!-- 게시글 목록 -->--%>
			<!-- 하단 버튼 -->
			<div class="search" title="<spring:message code="common.searchCondition.msg" />">
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttSj" /></option><!-- 글 제목  -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.nttCn" /></option><!-- 글 내용 -->
					<option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="table.reger" /></option><!-- 작성자 -->
				</select>
				<!-- 검색키워드 및 조회버튼 -->

				<input class="search_box" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->

			</div>
			<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
			<input name="pageIndex" type="hidden" value="">
		</form>

		<!-- 목록영역 -->
		<div class="list">
			<table class="list_wrap" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
				<caption>${pageTitle} <spring:message code="title.list" /></caption>
				<colgroup>
					<col style="width: 9%;">
					<col style="width: 40%;">
					<col style="width: 13%;">
					<col style="width: 13%;">
					<col style="width: 13%;">
				</colgroup>
				<thead>
				<tr>
					<th><spring:message code="table.num" /></th><!-- 번호 -->
					<th class="board_th_link"><spring:message code="comCopBbs.articleVO.list.nttSj" /></th><!--글 제목  -->
					<th><spring:message code="table.reger" /></th><!-- 작성자명 -->
					<th><spring:message code="table.regdate" /></th><!-- 작성시각 -->
					<th><spring:message code="comCopBbs.articleVO.list.inqireCo" /></th><!-- 조회수  -->
				</tr>
				</thead>
				<tbody class="ov">

				<!-- 공지사항 본문 -->
				<c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
					<tr>
						<td><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_notice.png'/>" alt="notice"></td>
						<td>
							<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
								<input name="nttId" type="hidden" value="<c:out value="${noticeInfo.nttId}"/>">
								<input name="bbsId" type="hidden" value="<c:out value="${noticeInfo.bbsId}"/>">
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<input type="submit" value="<c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/><c:if test="${noticeInfo.commentCo != ''}">	<c:out value='[${noticeInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;">
							</form>
						</td>
						<td><c:out value='${noticeInfo.frstRegisterNm}'/></td>
						<td><c:out value='${noticeInfo.frstRegisterPnttm}'/></td>
						<td><c:out value='${noticeInfo.inqireCo}'/></td>
					</tr>
				</c:forEach>
				<!-- 게시글 본문 -->
				<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
					<tr>
						<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
							<%--		--%>
						<c:choose>
							<c:when test="${resultInfo.sjBoldAt == 'Y'}">
								<!-- 제목 Bold인 경우  -->
								<td class="bold">
									<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
										<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
										<input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
										<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
										<span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret"></c:if><input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}">	<c:out value='[${resultInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;"></span>
									</form>
								</td>
							</c:when>
							<c:when test="${resultInfo.secretAt == 'Y' && sessionUniqId != resultInfo.frstRegisterId}">
								<!-- 비밀글이며 작성자가 본인이 아닌 경우(클릭 불가) -->
								<td class="left">
									<c:if test="${resultInfo.replyLc!=0}">
										<c:forEach begin="0" end="${resultInfo.replyLc}" step="1">
											&nbsp;
										</c:forEach>
									</c:if>
									<img src="<c:url value='/images/egovframework/com/cop/bbs/icon_lock.png'/>" alt="secret">&nbsp;<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/>
									<c:if test="${resultInfo.commentCo != ''}">
										<c:out value='[${resultInfo.commentCo}]'/>
									</c:if>
								</td>
							</c:when>
							<c:otherwise>
								<!-- 나머지 경우 -->
								<td class="left">
									<c:choose>
										<c:when test="${preview == 'true'}">
											<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
											<input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
											<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
											<span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret"></c:if><input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}">	<c:out value='[${resultInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;"></span>
										</c:when>
										<c:otherwise>
											<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectArticleDetail.do'/>">
												<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
												<input name="bbsId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">
												<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
												<span class="link"><c:if test="${resultInfo.replyLc!=0}"><c:forEach begin="0" end="${resultInfo.replyLc}" step="1">&nbsp;	</c:forEach><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_reply.png'/>" alt="secret"></c:if><input type="submit" value="<c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/><c:if test="${resultInfo.commentCo != ''}">	<c:out value='[${resultInfo.commentCo}]'/></c:if>" style="border:0px solid #e0e0e0;"></span>
											</form>
										</c:otherwise>
									</c:choose>
								</td>
							</c:otherwise>
						</c:choose>
						<td><c:out value='${resultInfo.frstRegisterNm}'/></td>
						<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
						<td><c:out value='${resultInfo.inqireCo}'/></td>
					</tr>
				</c:forEach>

				<c:if test="${fn:length(resultList) == 0}">
					<!-- 글이 없는 경우 -->
					<tr>
						<td colspan="5"><spring:message code="common.nodata.msg" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
		</div>
		<!-- paging navigation -->
		<div class="pagination">
			<ul>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
			</ul>
		</div>

		<!-- 등록버튼 -->
	</div>
	<div class="type-btn">
		<c:if test="${preview != 'true'}">
			<span class="btn_b"><a href="<c:url value='/cop/bbs/insertArticleView.do?bbsId=${boardMasterVO.bbsId}' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span><!-- 등록 -->
		</c:if>
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