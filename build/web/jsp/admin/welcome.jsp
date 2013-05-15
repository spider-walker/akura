<%@ taglib tagdir="/WEB-INF/tags" prefix="h" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><spring:message code="APPLICATION.NAME"/></title>
<link href="resources/css/css_reset.css" rel="stylesheet" type="text/css">
<link href="resources/css/main_style.css" rel="stylesheet" type="text/css">
<link href="resources/css/theme.css" rel="stylesheet" type="text/css">
<script language="javascript" src="resources/js/main.js"></script>
<script language="javascript" src="resources/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
	function nextOrPrevPublication(nextOrPrev , pageNo){
			document.getElementById('paginate').value = nextOrPrev;
			document.getElementById('itemNo').value = pageNo;
			document.formEvent.action = "getPagination.htm";
			document.formEvent.submit();
		}
</script>
</head>
<body>
<h:headerNew parentTabId="0" page="adminWelcome.htm"/>
<div id="page_container">
  <div id="breadcrumb_area">
    <div id="breadcrumb">
      <ul>
        <li><a href="#"><spring:message code="application.home"/></a></li>
      </ul>
    </div>
  </div>
  <div class="help_link">
			<a href="#"
				onClick="PopupCenterScroll('<c:url value="resources/html/akura-help/AkuraHelp.htm"/>','helpWindow',980,550)"><img
				src="resources/images/ico_help.png" width="20" height="20"
				align="absmiddle"> <spring:message code="application.help" />
			</a>
  </div>
  <div class="clearfix"></div>
  <h1><spring:message code="ADMIN.WELCOME.MESSAGE"/> <spring:message code="APPLICATION.NAME"/>!</h1>
  <div id="content_main">
    <div class="clearfix"></div>
    <div class="section_box">
      <div class="main_page">
        <!--   <p class="welcome_text">This application will provide you all the services and functionalities that you will need to track all information related to the school.</p>-->
      <div class="main_page_left" style="border:1px solid #BCD1E6;padding:0px;">
	  <div class="section_box_header">
          <h2><spring:message code="ADMIN.WELCOME.TITLE"/></h2>
        </div>
		<c:forEach items="${publicationList}" var="publication">
			 <div class="awards">
                <div class="awards-left">
                <c:forEach var="imagePath" items="${imagePathMap}">
                	<c:if test="${imagePath.key eq publication.publicationId}">
                		<img src="${imagePath.value}">
                	</c:if>
                </c:forEach>
                </div>
                <div align="justify" class="awards-right" >
                  <h3><c:out value="${publication.header}"/></h3>
                  <p ><c:out value="${publication.message}"/> </p>
                </div>
              </div>
		</c:forEach>
			  <div class="clearfix"></div>

			<div class="pagination_container">
			<form action="" name="formEvent" method="POST">
			<input type="hidden" name="paginate" id="paginate"/>
			<input type="hidden" name="itemNo" id="itemNo"/>
			&lt;
				<c:if test="${exceedMin ne null}">
					<a href="#" class="disabled" title="Previous"><spring:message code="ADMIN.WELCOME.PREVIOUS"/></a> | <spring:message code="ADMIN.WELCOME.ITEMS"/><c:out value="${minNo}"/> - <c:out value="${maxNo}"/> <spring:message code="ADMIN.WELCOME.OF"/> <c:out value="${totalItems}"/> | <a href="#" class="active" title="Next" onclick="nextOrPrevPublication('next' , ${maxNo});"><spring:message code="ADMIN.WELCOME.NEXT"/></a>
				</c:if>
				<c:if test="${exceedMax ne null}">
					<a href="#" class="active" title="Previous" onclick="nextOrPrevPublication('previous' , '<c:out value= '${minNo}'/>');"><spring:message code="ADMIN.WELCOME.PREVIOUS"/></a> | <spring:message code="ADMIN.WELCOME.ITEMS"/><c:out value="${minNo}"/> - <c:out value="${maxNo}"/> <spring:message code="ADMIN.WELCOME.OF"/> <c:out value="${totalItems}"/> | <a href="#" class="disabled" title="Next"><spring:message code="ADMIN.WELCOME.NEXT"/></a>
				</c:if>
				<c:if test="${exceedMin eq null && exceedMax eq null && exceedMaxAndMin eq null}">
					<a href="#" class="active" title="Previous" onclick="nextOrPrevPublication('previous' , '<c:out value= '${minNo}'/>');"><spring:message code="ADMIN.WELCOME.PREVIOUS"/></a> | <spring:message code="ADMIN.WELCOME.ITEMS"/><c:out value="${minNo}"/> - <c:out value="${maxNo}"/> <spring:message code="ADMIN.WELCOME.OF"/> <c:out value="${totalItems}"/> | <a href="#" class="active" title="Next" onclick="nextOrPrevPublication('next' , '<c:out value= '${maxNo}'/>');"><spring:message code="ADMIN.WELCOME.NEXT"/></a>
				</c:if>
				<c:if test="${exceedMaxAndMin ne null}">
					<a href="#" class="disabled" title="Previous"><spring:message code="ADMIN.WELCOME.PREVIOUS"/></a> | <spring:message code="ADMIN.WELCOME.ITEMS"/><c:out value="${minNo}"/> - <c:out value="${maxNo}"/> <spring:message code="ADMIN.WELCOME.OF"/>	 <c:out value="${totalItems}"/> | <a href="#" class="disabled" title="Next""><spring:message code="ADMIN.WELCOME.NEXT"/></a>
				</c:if>
			&gt;
			</form>
			</div>

	</div>


	  <div class="main_page_right"><img src="resources/images/bus.png"></div>

      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
</div>
<h:footer />
</body>
</html>
