<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>


<section class="login-page">
    <h2>Twój link do zmiany hasła wygasł. Wygeneruj nowy:</h2>
    <div class="form-group"><a href="/forgottenPassword" class="btn">Resetuj hasło</a></div>
</section>

<jsp:include page="homeFooter.jsp"/>
