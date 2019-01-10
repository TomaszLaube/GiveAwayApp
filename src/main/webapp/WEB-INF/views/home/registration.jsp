<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>

<section class="login-page">
    <h2>Załóż konto prywatne</h2>
    <form:form method="post" modelAttribute="user">

        <div class="form-group">
            <form:input path="email" placeholder="Email" required="true"/>
            <form:errors path="email" element="div"/>
            <c:if test="${emailExists}">
                <div class="error">Ten adres email jest już zajęty</div>
            </c:if>
        </div>

        <div class="form-group">
            <form:input path="firstName" placeholder="Imię" required="true"/>
            <form:errors path="firstName" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="lastName" placeholder="Nazwisko" required="true"/>
            <form:errors path="lastName" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="password" type="password" placeholder="Hasło" required="true"/>
            <form:errors path="password" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="checkPassword" type="password" placeholder="Powtórz hasło" required="true"/>
            <form:errors path="checkPassword" element="div"/>
            <c:if test="${incorrectPasswordCheck}">
                <div class="error">Powtórz poprawnie hasło</div>
            </c:if>
        </div>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Załóż konto</button>
            <a href="/registerOrganisation" class="btn btn--highlighted">Zarejestruj organizację</a>
        </div>
        <form:hidden path="name" value="N/A"/>
        <form:hidden path="description" value="N/A"/>
    </form:form>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form>
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię" />
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko" />
            </div>

            <div class="form-group">
            <textarea
                    name="message"
                    placeholder="Wiadomość"
                    rows="1"
            ></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"
            ><img src="resources/images/icon-facebook.svg"
            /></a>
            <a href="#" class="btn btn--small"
            ><img src="resources/images/icon-instagram.svg"
            /></a>
        </div>
    </div>
</footer>
<script src="/resources/js/app.js"></script>
</body>
</html>
