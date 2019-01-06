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
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj Agata
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Ustawienia</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="#" class="btn btn--without-border active">Start</a></li>
            <li><a href="#" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#" class="btn btn--without-border">O nas</a></li>
            <li>
                <a href="#" class="btn btn--without-border"
                >Fundacje i organizacje</a
                >
            </li>
            <li><a href="#" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br />
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>






<section>
    <div>
        <form:form method="post" action="/app/createGiveAwayThird" modelAttribute="newOffer">

            <div>
                <h3>Podaj dane do wysyłki:</h3>

                <div >
                    <label>
                        Miasto:
                        <form:input path="city" placeholder="Miasto" required="true" />
                        <form:errors path="city"/>
                    </label>
                </div>

                <div >
                    <label>
                        Adres:
                        <form:input path="street" placeholder="Adres" required="true" />
                        <form:errors path="street"/>
                    </label>
                </div>

                <div >
                    <label>
                        Kod pocztowy:
                        <form:input path="postalCode" placeholder="Kod pocztowy" required="true" />
                        <form:errors path="postalCode"/>
                    </label>
                </div>
                <div >
                    <label>
                        Numer telefonu:
                        <form:input path="telephone" placeholder="Numer telefonu" required="true" />
                        <form:errors path="telephone"/>
                    </label>
                </div>
                <div >
                    <label>
                        Data odbioru:
                        <form:input path="date" type="date" placeholder="Data" required="true" />
                        <form:errors path="date"/>
                    </label>
                </div>

                <div >
                    <label>
                        Instrukcje dla kuriera:
                        <form:textarea path="additionalInstructions" placeholder="Instrukcje dla kuriera" required="true" />
                        <form:errors path="additionalInstructions"/>
                    </label>
                </div>

            </div>
            <form:hidden path="institution" value="${newOffer.institution.id}"/>
            <form:hidden path="user" value="${newOffer.user.id}"/>
            <form:hidden path="bagNum" value="${newOffer.bagNum}"/>
            <button type="submit" class="btn">Dalej</button>
        </form:form>



    </div>
</section>






<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
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

<script src="/resources/js/app.js"></script>
</body>
</html>
