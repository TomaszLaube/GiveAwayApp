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
            <li><a href="/app/createGiveAway" class="btn btn--highlighted">Oddaj rzeczy</a></li>
            <li><a href="/app/addGathering" class="btn btn--highlighted">Zorganizuj zbiórkę</a></li>
            <li><a href="/app/editUser" class="btn">Edytuj profil</a></li>
            <li><a href="/app/userOffers" class="btn">Przekazane datki</a></li>
            <li><a href="/app/userGatherings" class="btn">Organizowane zbiórki</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Witaj, xxx</h2>
</section>

<section class="stats">
    <div class="container container--40">


        <div class="stats--item">
            <em>Zaplanowane zbiórki</em>
            <h3><ul>
                <c:forEach var="activeG" items="${activeGatherings}">
                    <li>${activeG.date}, ${activeG.description}</li>
                    <a href="/app/gatheringDetails/${activeG.id}" class="btn btn--highlighted">Szczegóły</a>
                </c:forEach>
            </ul></h3>

        </div>

        <div class="stats--item">
            <em>Poprzednie zbiórki</em>
            <h3><ul>
                <c:forEach var="inactiveG" items="${inactiveGatherings}">
                    <li>${activeG.date}, ${inactiveG.description}</li>
                    <a href="/app/gatheringDetails/${inactiveG.id}" class="btn btn--highlighted">Szczegóły</a>
                </c:forEach>
            </ul></h3>

        </div>




    </div>
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
