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
            <li class="logged-user">
                MENU
                <ul class="dropdown">
                    <li><a href="/org/dashboard" class="btn--without-border" >Pulpit</a></li>
                    <li><a href="/org/newOffers" class="btn--without-border">Nowe datki</a></li>
                    <li><a href="/org/sentOffers" class="btn--without-border">Wysłane datki</a></li>
                    <li><a href="/org/receivedOffers" class="btn--without-border">Odebrane datki</a></li>
                    <li><a href="/org/updateAccount" class="btn--without-border">Edytuj konto</a></li>
                </ul>
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
            <li><a href="/" class="btn btn--without-border">Start</a></li>
            <li><a href="/support" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/about" class="btn btn--without-border">O nas</a></li>
            <li><a href="/orgOverview" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>