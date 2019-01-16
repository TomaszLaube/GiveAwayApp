<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>

<section class="login-page">
    <h2>Wpisz swój adres email:</h2>
    <form method="post">
        <div class="form-group">
            <input type="text" name="email" placeholder="Email" required/>
        </div>
        <c:if test="${userNotFound}">
            <div class="notification">Podany adres email nie istnieje w naszej bazie danych.</div>
        </c:if>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Resetuj hasło</button>
        </div>
    </form>
</section>

<jsp:include page="homeFooter.jsp"/>