<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="highlighted">
                <form action="/login" method="get" id="loginForm">
                    <input type="submit" value="Zaloguj" class="btn btn--small">
                </form>
            </li>
            <li class="highlighted">
                <form action="/logout" method="post" id="logoutForm">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <input type="submit" value="Wyloguj" class="btn btn--small">
                </form>
            </li>
        </ul>

        <ul>
            <li><a href="#">Start</a></li>
            <li><a href="#">O co chodzi?</a></li>
            <li><a href="#">O nas</a></li>
            <li><a href="#">Fundacje i organizacje</a></li>
            <li><a href="#">Kontakt</a></li>
        </ul>
        <ul class="slogan--buttons">
            <li><a href="/admin/adminList" class="btn btn--highlighted">Lista administratorów</a></li>
            <li><a href="/admin/addAdmin" class="btn btn--highlighted">Dodaj administratora</a></li>
            <li><a href="/admin/orgList" class="btn">Lista instytucji</a></li>
            <li><a href="/admin/addOrg" class="btn">Dodaj instytucję</a></li>
            <li><a href="/admin/addOrg" class="btn">Lista użytkowników</a></li>
            <li><a href="/admin/addOrg" class="btn">Dodaj użytkownika</a></li>
            <li><a href="/admin/editAdmin" class="btn">Edytuj konto</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Lista zaufanych instytucji</h2>

    <ul>
        <c:forEach items="${orgs}" var="org">
            <div>
                    ${org.name}
                    ${org.location.name}
                <a href="/admin/modOrgAccess/${org.id}" class="btn">Blokuj</a>
            </div>
            <div>
                <a href="/admin/modOrg/${org.id}" class="btn">Edytuj dane</a>
            </div>
            <div>
                <a href="/admin/orgDetails/${org.id}" class="btn">Szczegóły</a>
            </div>
        </c:forEach>
    </ul>


</section>


<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form>
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
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
