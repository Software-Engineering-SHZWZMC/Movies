<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
bai<c:when test="${user == null }">
<!-- 顶部未登录 -->
du请zhi <a href="${loginURL }">登陆</a>
</c:when>
<c:otherwise>
<!-- 顶部已登dao录 -->
欢迎你！，zhuan<a href="${user.email }" target="_blank"><strong>${user.email }</strong></a>
<c:if test="${admin }">
 | <a href="NODAY.htm" target="_blank">管理</a>
</c:if>
 | <a href="logout">退出shu</a>
</c:otherwise>
</c:choose>