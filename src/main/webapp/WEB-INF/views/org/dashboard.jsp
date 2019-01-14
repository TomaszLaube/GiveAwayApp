<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="orgHeader.jsp"/>

<section class="login-page">
    <h2>${org.name}- bieżące dane</h2>
</section>

<section class="stats">
    <div class="container container--40">
        <div class="stats--item">
            <em>${newNum}</em>
            <h3><a href="/org/newOffers" class="btn">Nowych datków</a></h3>
            <p></p>
        </div>

        <div class="stats--item">
            <em>${sentNum}</em>
            <h3><a href="/org/sentOffers" class="btn">Wysłanych datków</a></h3>
            <p></p>
        </div>

        <div class="stats--item">
            <em>${receivedNum}</em>
            <h3><a href="/org/receivedOffers" class="btn">Odebranych datków</a></h3>
            <p></p>
        </div>
    </div>
</section>


<jsp:include page="orgFooter.jsp"/>
