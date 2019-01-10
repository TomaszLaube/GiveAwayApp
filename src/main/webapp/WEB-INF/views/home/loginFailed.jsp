<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>
<section class="stats">
    <div class="container container--40">
        <div class="stats--item">
            <em>Błędne dane logowania</em>
            <h2>Spróbuj jeszcze raz</h2>
            <a href="/login" class="btn btn--large">Zaloguj</a>
        </div>
    </div>
</section>
<jsp:include page="homeFooter.jsp"/>