<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section class="login-page">
    <h2>Witamy, ${user.firstName} ${user.lastName}- Twoje bieżące statystyki</h2>
</section>

<section class="stats">
    <div class="container container--40">
        <div class="stats--item">
            <em>${bagsNum}</em>
            <h3>Oddanych worków</h3>
            <p></p>
        </div>

        <div class="stats--item">
            <em>${supportedOrgsNum}</em>
            <h3>Wspartych organizacji</h3>
            <p></p>
        </div>

        <div class="stats--item">
            <em>${gatheringsNum}</em>
            <h3>Zorganizowanych zbiórek</h3>
            <p></p>
        </div>
    </div>
</section>
<jsp:include page="appFooter.jsp"/>
