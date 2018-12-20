<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login">Zaloguj</a></li>
            <li class="highlighted"><a href="/register">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="#">Start</a></li>
            <li><a href="#">O co chodzi?</a></li>
            <li><a href="#">O nas</a></li>
            <li><a href="#">Fundacje i organizacje</a></li>
            <li><a href="#">Kontakt</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Edytuj podstawowe dane</h2>
    <form:form method="post" modelAttribute="user">
        <label class="description" for="emailId">Adres Email:</label>
        <div class="form-group">

            <form:input path="email" placeholder="Email" required="true" id="emailId"/>
            <form:errors path="email" element="div"/>
            <c:if test="${emailExists}">
                <div class="error">Ten adres email jest już zajęty</div>
            </c:if>
        </div>
        <label class="description" for="firstNameId">Imię:</label>
        <div class="form-group">

            <form:input path="firstName" placeholder="Imię" required="true" id="firstNameId"/>
            <form:errors path="firstName" element="div"/>
        </div>
        <label class="description" for="lastNameId">Nazwisko:</label>
        <div class="form-group">

            <form:input path="lastName" placeholder="Nazwisko" required="true" id="lastNameId"/>
            <form:errors path="lastName" element="div"/>
        </div>

        <form:hidden path="id" value="${user.id}"/>
        <form:hidden path="password" value="${user.password}"/>
        <form:hidden path="enabled" value="${user.enabled}"/>
        <form:hidden path="validated" value="${user.validated}"/>
        <form:hidden path="userUUID" value="${user.userUUID}"/>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Aktualizuj konto</button>
        </div>
    </form:form>

    <h2>Zmiana hasła</h2>
    <form action="/app/changePassword" method="post">
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Aktualne hasło" name="oldPassword" required/>
            <c:if test="${incorrectOldPassword}">
                <div class="error">Niepoprawne hasło</div>
            </c:if>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Nowe hasło" name="newPassword" required/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Powtórz nowe hasło" name="newPasswordCheck" required/>
            <c:if test="${incorrectNewPassword}">
                <div class="error">Wprowadź nowe hasło dwukrotnie</div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Zmień hasło</button>
        </div>
    </form>
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
            ><img src="/resources/images/icon-facebook.svg"
            /></a>
            <a href="#" class="btn btn--small"
            ><img src="/resources/images/icon-instagram.svg"
            /></a>
        </div>
    </div>
</footer>
</body>
</html>
