<%
 /**
  * @Class Name : EgovArticleRegist.jsp
  * @Description : EgovArticleRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2016.06.13   김연호              표준프레임워크 v3.6 개선
  *   2018.06.05   신용호              CK Editor V4.9.2 Upgrade
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title><!-- 게시글 등록 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<%-- <script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script> --%>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFiles.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/jquery-2.2.4.min.js' />"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/eagjs/script.js' />"></script>

	<link href="<c:url value='/js/egovframework/eagcss/style.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/aos.css' />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/js/egovframework/eagcss/default.css' />" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">

$(function() {
	$("#ntceBgnde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
	$("#ntceEndde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
});

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	
	//filebrowserUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImage.do', // 파일 업로드를 처리 할 경로 설정.
	var ckeditor_config = {
		//filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', // 파일 업로드를 처리 할 경로 설정.
		filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage', // 파일 업로드를 처리 할 경로 설정(CK필터).
	};
	CKEDITOR.replace('nttCn',ckeditor_config);
	
	// 첫 입력란에 포커스
	document.getElementById("articleVO").nttSj.focus();
	

	}
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_regist_article(form) {

		CKEDITOR.instances.nttCn.updateElement();

		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {

			var validateForm = document.getElementById("articleVO");

			//비밀글은 제목 진하게 할 수 없음.
			//비밀글은 익명게시 불가.
			//비밀글은 공지게시 불가.
			if (validateForm.secretAt.checked) {
				if (validateForm.sjBoldAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.secretBold" />");
					return;
				}
				if (validateForm.anonymousAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.secretAnonymous" />");
					return;
				}
				if (validateForm.noticeAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.secretNotice" />");
					return;
				}
			}

			//익명글은 공지게시 불가.
			if (validateForm.anonymousAt.checked) {
				if (validateForm.noticeAt.checked) {
					alert("<spring:message code="comCopBbs.articleVO.anonymousNotice" />");
					return;
				}
			}

			//게시기간 
			var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
			var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

			if (ntceBgnde == '' && ntceEndde != '') {
				validateForm.ntceBgnde.value = '1900-01-01';
			}
			if (ntceBgnde != '' && ntceEndde == '') {
				validateForm.ntceEndde.value = '9999-12-31';
			}
			if (ntceBgnde == '' && ntceEndde == '') {
				validateForm.ntceBgnde.value = '1900-01-01';
				validateForm.ntceEndde.value = '9999-12-31';
			}

			ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
			ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

			if (ntceBgnde > ntceEndde) {
				alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
				return;
			}

			if (confirm("<spring:message code="common.regist.msg" />")) {
				form.submit();
			}
		}
	}
</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<!-- 첨부파일 업로드 가능화일 설정 Start..-->  
<script type="text/javascript">
var maxFileNum = document.getElementById('atchPosblFileNumber').value;
if(maxFileNum==null || maxFileNum==""){
	maxFileNum = 3;
}
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
<!-- 첨부파일 업로드 가능화일 설정 End.-->

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
			<li class="menu"><a href="#">공지사항</a>
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
<div class="top_banner gallery_top">
	<div class="top_txt">
		<h1 data-aos="fade-down" data-aos-duration="1500">갤러리</h1>
		<p data-aos="fade-down" data-aos-duration="1000">이에이지의 갤러리를 확인하세요.</p>
	</div>
</div>


<!--서브페이지 메뉴-->
<section class="place">
	<div class="place_menu">
		<ul>
			<li class="on"><a href="#">갤러리</a></li>
			<li><a href="#">자료실</a></li>
		</ul>
	</div>
</section>


<!--서브페이지 타이틀-->
<div class="sub_title">
	<h1>공지사항</h1>
	<p><c:out value="${boardMasterVO.bbsNm}"/></p>
</div>


<!--내용-->

<form:form modelAttribute="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="fn_egov_regist_article(document.forms[0]); return false;" enctype="multipart/form-data">
<section id="sub_gallery">
	<div class="sub_gallery_wrap">
		<!-- 타이틀 -->
		<dl class="write">

		<!-- 등록폼 -->

			<!-- 입력 -->
			<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
			<!-- 글 제목, 제목 Bold여부   -->
			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.nttSj"/> </c:set>

			<dt>제목</dt>
			<dd>
				<form:input type="text" class="write_txt" path="nttSj" title="${title} ${inputTxt}"  maxlength="70" />
				<div><form:errors path="nttSj" cssClass="error" /></div>
			</dd>
				<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.sjBoldAt"/> </c:set>
<%--				<th><label for="sjBoldAt">${title}</label></th>--%>
<%--				<td class="left">--%>
<%--					<form:checkbox path="sjBoldAt" value="Y"/>--%>
<%--					<div><form:errors path="sjBoldAt" cssClass="error" /></div>--%>
<%--				</td>--%>

			<!-- 공지신청 여부  -->
			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.noticeAt"/> </c:set>

			<dt>공지여부</dt>
			<dd>
				<form:checkbox class="checkbox" path="noticeAt" value="Y"/>
				<div><form:errors path="noticeAt" cssClass="error" /></div>
			</dd>

			<!-- 글 내용  -->
			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.nttCn"/> </c:set>

			<dt class="content_Y">내용</dt>
			<dd class="content">
				<form:textarea path="nttCn" title="${title} ${inputTxt}" />
				<div><form:errors path="nttCn" cssClass="error" /></div>
			</dd>


<%--			<!-- 비밀글 여부 -->--%>
<%--			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.secretAt"/> </c:set>--%>
<%--			<tr>--%>
<%--				<th><label for="secretAt">${title}</label></th>--%>
<%--				<td class="left" colspan="3">--%>
<%--					<form:checkbox path="secretAt" value="Y"/>--%>
<%--					<div><form:errors path="secretAt" cssClass="error" /></div>--%>
<%--				</td>--%>
<%--			</tr>--%>

<%--			<!-- 익명등록 여부  -->--%>
<%--			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.anonymousAt"/> </c:set>--%>
<%--			<tr>--%>
<%--				<th><label for="anonymousAt">${title}</label></th>--%>
<%--				<td class="left" colspan="3">--%>
<%--					<form:checkbox path="anonymousAt" value="Y"/>--%>
<%--					<div><form:errors path="anonymousAt" cssClass="error" /></div>--%>
<%--				</td>--%>
<%--			</tr>--%>

<%--			<!-- 유효기간 설정  -->--%>
<%--			<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.ntceDe"/> </c:set>--%>
<%--			<tr>--%>
<%--				<th><label for="ntceBgnde">${title} </label></th>--%>
<%--				<td class="left" colspan="3">--%>
<%--					<form:input path="ntceBgnde" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:70px;" readonly="true" />--%>
<%--					&nbsp;~&nbsp;<form:input path="ntceEndde" title="${title} ${inputTxt}" size="70" maxlength="70" style="width:70px;" readonly="true" />--%>
<%--					<div><form:errors path="ntceBgnde" cssClass="error" /></div>--%>
<%--					<div><form:errors path="ntceEndde" cssClass="error" /></div>--%>
<%--				</td>--%>
<%--			</tr>--%>

			<c:if test="${boardMasterVO.fileAtchPosblAt == 'Y'}">
				<!-- 첨부파일  -->
				<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.atchFile"/></c:set>
				<dt class="file_tit">첨부파일</dt>
					<dd class="file">
						<div class="fbox-l">
					<td class="nopd" colspan="3">
						<input type="text" class="file_box"></input>
						<label for="egovComFileUploader" class="input-file-button">파일선택</label>
						<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.regist.atchFile"/>" multiple style="display: none"/><!-- 첨부파일 -->
						<div id="egovComFileList"></div>
					</td>
						</div>
					</dd>
			</c:if>

		</dl>
		<script>
			$("#egovComFileUploader").on('change',function(){
				var fileName = $("#egovComFileUploader").val();
				$(".file_box").val(fileName);
			});
		</script>
		<!-- 하단 버튼 -->
		<div class="type-btn">
			<span><input type="submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /></span><!-- 등록 -->
			<span><a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
		</div>
	</div>
</section>
	<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
	<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" />
	<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>"/>
	<input type="hidden" name="cmd" value="<c:out value='save'/>">
	<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
</form:form>

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
