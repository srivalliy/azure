<%--

  ADOBE CONFIDENTIAL
  __________________

   Copyright 2015 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.

--%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@ page session="false" contentType="text/html" pageEncoding="utf-8"
           import="com.adobe.granite.ui.components.formbuilder.FormResourceManager,
         		 org.apache.sling.api.resource.Resource,
         		 org.apache.sling.api.resource.ValueMap" %><%

    String key = resource.getName();

%>

<div class="formbuilder-content-form">
	<label class="fieldtype">
	    <i class="coral-Icon coral-Icon--sizeXS coral-Icon--link"></i><%=i18n.get("Asset Rating") %>
	</label>
	<sling:include resource="<%= resource %>" resourceType="dam/gui/components/admin/schemaforms/formbuilder/sectionfield" />
</div>

<div class="formbuilder-content-properties">
    <input type="hidden" name="./items/<%= key %>">
    <input type="hidden" name="./items/<%= key %>/jcr:primaryType" value="nt:unstructured">
    <input type="hidden" name="./items/<%= key %>/sling:resourceType" value="dam/gui/coral/components/admin/rating">
    <input type="hidden" name="./items/<%= key %>/granite:data/metaType" value="assetrating">
    
    <sling:include resource="<%= resource %>" resourceType="dam/gui/components/admin/schemaforms/formbuilder/formfieldproperties/labelfields"/>
    <sling:include resource="<%= resource %>" resourceType="dam/gui/components/admin/schemaforms/formbuilder/formfieldproperties/titlefields"/>
    
    <i class="delete-field coral-Icon coral-Icon--delete coral-Icon--sizeL" href="" data-target-id="<%= key %>" data-target="./items/<%= key %>@Delete"></i>

</div>


