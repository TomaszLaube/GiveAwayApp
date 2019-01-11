<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>

<section class="login-page">
    <h2>Zaloguj się</h2>
    <form method="post" action="/login">

        <div class="form-group">
            <input type="text" name="username" placeholder="Email"/>
        </div>

        <div class="form-group">
            <input type="password" name="password"placeholder="Hasło"/>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Zaloguj</button>
        </div>
    </form>
</section>

<jsp:include page="homeFooter.jsp"/>