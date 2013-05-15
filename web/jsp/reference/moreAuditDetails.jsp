<%--
    < �KURA, This application manages the daily activities of a Teacher and a Student of a School>

    Copyright (C) 2012 Virtusa Corporation.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="h"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><spring:message code="APPLICATION.NAME" /></title>
<link href="resources/css/css_reset.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/theme.css" rel="stylesheet" type="text/css">
<link href="resources/css/main_style.css" rel="stylesheet"
	type="text/css">
</head>
<body>
<div id="page_container_popup">
  <div class="clearfix">&nbsp;</div>
  <div id="content_main">
    <div class="clearfix"></div>
    <h1><spring:message code="REF.UI.MORE.DETAILS.AUDIT.DETAILS" /></h1>
    <div class="column_single">
		<table  class="basic_grid" border="0" cellspacing="1" cellpadding="0">
			<tr>
				<th> <spring:message code="REF.UI.MORE.DETAILS.ATTRIBUTE.NAME" /> </th>
				<th> <spring:message code="REF.UI.MORE.DETAILS.AUDIT.DESCRIPTION" /> </th>
			</tr>
			<c:forEach var="auditDetailsList" items="${auditDetailsList}"
			varStatus="status">
				<tr
					<c:choose>
            		<c:when test="${status.count % 2 == 1}">class="odd"</c:when>
            		<c:when test="${status.count % 2 == 0}">class="even"</c:when>
            	</c:choose>>
					  <td class="left">${auditDetailsList.attributeName}</td>
					  <td class="left">${auditDetailsList.auditDescription}</td>
					  
				</tr>
			</c:forEach>
			
		</table>
      
    </div>
    <div class="clearfix"></div>
  </div>
  <div class="clearfix"></div>
  <div class="button_row">
    <div class="buttion_bar_type3" >
      <input type="button" value="<spring:message code="REF.UI.CLOSE" />" onClick="window.close()" class="button">
    </div>
    <div class="clearfix"></div>
  </div>
</div>
</body>
</html>
