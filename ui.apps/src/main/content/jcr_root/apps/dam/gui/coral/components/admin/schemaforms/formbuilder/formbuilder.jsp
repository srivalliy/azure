<%--

  ADOBE CONFIDENTIAL
  __________________

   Copyright 2013 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.

--%>
<%@ page session="false"%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@page import="org.apache.sling.tenant.Tenant,
                  com.adobe.granite.ui.components.Config,
                  com.day.cq.dam.commons.util.DamConfigurationConstants" %><%
%><ui:includeClientLib categories="dam.admin.ui.coral.schemaeditor.formbuilder" />
<%

// with schemaeditor current design , each new form being added required 15 to 20 more sling includes.
// this is required to fix customer issue CQ-65100 (increasing max number of sling includes)
slingRequest.setAttribute("sling.max.calls", 5000);

Config cfg = new Config(resource);
String schemaExtHome = slingRequest.getParameter("formPath");
if(schemaExtHome == null || schemaExtHome.trim().isEmpty()){
    schemaExtHome = slingRequest.getRequestPathInfo().getSuffix();
}
String suffix = slingRequest.getRequestPathInfo().getSuffix();
suffix = null == suffix ? "/" : suffix;
String absolutePath = suffix.startsWith(schemaExtHome) ? suffix : schemaExtHome + suffix;
absolutePath = absolutePath.endsWith("/") ? absolutePath.substring(0, absolutePath.length() - 1) : absolutePath;
%>

<div class="foundation-content-path hidden" data-foundation-content-path="<%= xssAPI.encodeForHTMLAttr(absolutePath) %>" data-foundation-relative-path="<%= suffix %>"></div>
<div class="formbuilder-wrapper">
	<sling:call script="builditems.jsp" />
	<sling:call script="view.jsp" />
</div>