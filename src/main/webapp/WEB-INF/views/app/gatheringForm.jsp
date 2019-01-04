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
    <h2>Zorganizuj zbiórkę</h2>
    <form:form method="post" modelAttribute="gathering">

        <div class="form-group">
            <h2>Wybierz potrzebujących:</h2>
            <c:forEach items="${receivers}" var="receiver">
                <div class="form-group form-group--checkbox">

                    <label>
                        <form:checkbox path="receivers" value="${receiver.id}"/>
                        <span class="checkbox"></span>
                        <span class="description">${receiver.name}</span>
                    </label>

                </div>
            </c:forEach>
        </div>

        <div class="form-group">
            <h2>Wybierz rodzaj datków:</h2>
            <c:forEach items="${goods}" var="good">
                <div class="form-group form-group--checkbox">

                    <label>
                        <form:checkbox path="goods" value="${good.id}"/>
                        <span class="checkbox"></span>
                        <span class="description">${good.name}</span>
                    </label>

                </div>

            </c:forEach>
        </div>

        <h2>Dane dla kuriera:</h2>
        <div class="form-group">
            <form:input path="street" placeholder="Adres" required="true"/>
            <form:errors path="street" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="city" placeholder="Miasto" required="true"/>
            <form:errors path="city" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="postalCode" placeholder="Kod pocztowy" required="true"/>
            <form:errors path="postalCode" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="telephone" placeholder="Numer telefonu" required="true"/>
            <form:errors path="telephone" element="div"/>
        </div>

        <div class="form-group">
            <h2>Opisz krótko swoją zbiórkę:</h2>
            <form:textarea path="description" placeholder="Opis" required="true"/>
            <form:errors path="description" element="div"/>
        </div>

        <div class="form-group">
            <form:input type="date"  path="date" placeholder="Data" required="true"/>
            <form:errors path="date" element="div"/>
        </div>

        <div class="form-group">
            <form:input type="time"  path="time" placeholder="Godzina" required="true"/>
            <form:errors path="time" element="div"/>
        </div>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Dodaj zbiórkę</button>
        </div>
    </form:form>
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
<script src="/resources/js/app.js"></script>
</body>
</html>
