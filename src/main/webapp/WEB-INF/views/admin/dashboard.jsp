<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>

<section class="login-page">
    <h2>Witaj, ${admin.firstName} ${admin.lastName}</h2>
</section>


<jsp:include page="adminFooter.jsp"/>
