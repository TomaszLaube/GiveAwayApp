<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>

<section class="login-page">
    <h2>Wpisz swoje nowe hasło</h2>
    <form method="post">

        <div class="form-group">
            <input type="password" name="newPassword" placeholder="Nowe hasło" required/>
        </div>
        <div class="form-group">
            <input type="password" name="passwordCheck" placeholder="Powtórz nowe hasło" required/>
        </div>
        <c:if test="${wrongPwdCheck}">
            <div class="notification">Powtórz poprawnie hasło</div>
        </c:if>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Ustaw hasło</button>
        </div>
    </form>
</section>

<jsp:include page="homeFooter.jsp"/>