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
    <form:form method="post" modelAttribute="org">
    <div class="form-group">
        <form:input path="email" placeholder="Email" required="true"/>
        <form:errors path="email" element="div"/>
        <c:if test="${emailExists}">
            <div class="error">Ten adres email jest już zajęty</div>
        </c:if>
    </div>

    <div class="form-group">
        <form:input path="name" placeholder="Nazwa" required="true"/>
        <form:errors path="name" element="div"/>
    </div>

    <div class="form-group">
        <h2>Wybierz miasto: (aktualnie ${org.location.name})</h2>
        <form:select path="location" required="true">
            <c:forEach items="${locations}" var="location">
                <form:option value="${location.id}">${location.name}</form:option>
            </c:forEach>
        </form:select>
        <form:errors path="location" element="div"/>
    </div>

    <div class="form-group">
        <h2>Wybierz potrzebujących:</h2>
        <h3>Aktualnie:</h3>
        <h3><c:forEach var="receiver" items="${org.orgReceivers}">
            <div>${receiver.name}</div>
        </c:forEach> </h3>
        <c:forEach items="${receivers}" var="receiver">
            <div class="form-group form-group--checkbox">

                <label>
                    <form:checkbox path="orgReceivers" value="${receiver.id}"/>
                    <span class="checkbox"></span>
                    <span class="description">${receiver.name}</span>
                </label>

            </div>
        </c:forEach>
    </div>

    <div class="form-group">
        <h2>Wybierz rodzaj datków:</h2>
        <h3>Aktualnie:</h3>
        <h3><c:forEach var="good" items="${org.orgGoods}">
            <div>${good.name}</div>
        </c:forEach> </h3>
        <c:forEach items="${goods}" var="good">
            <div class="form-group form-group--checkbox">

                <label>
                    <form:checkbox path="orgGoods" value="${good.id}"/>
                    <span class="checkbox"></span>
                    <span class="description">${good.name}</span>
                </label>

            </div>

        </c:forEach>
    </div>

    <div class="form-group">
        <h2>Opisz krótko swoją organizację:</h2>
        <form:textarea path="description" placeholder="Opis" required="true"/>
        <form:errors path="description" element="div"/>
    </div>

    <div class="form-group form-group--buttons">
        <button class="btn" type="submit">Aktualizuj dane organizacji</button>

    </div>
    <form:hidden path="id" value="${org.id}"/>
    <form:hidden path="firstName" value="${org.firstName}"/>
    <form:hidden path="lastName" value="${org.lastName}"/>
    <form:hidden path="enabled" value="${org.enabled}"/>
    <form:hidden path="org" value="${org.org}"/>
    <form:hidden path="password" value="${org.password}"/>
    <form:hidden path="validated" value="${org.validated}"/>
    </form:form>

    <h2>Zmiana hasła organizacji ${org.name}</h2>
    <form action="/admin/changeOrgPassword/${org.id}" method="post">
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
            <button class="btn" type="submit">Ustaw hasło</button>
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
