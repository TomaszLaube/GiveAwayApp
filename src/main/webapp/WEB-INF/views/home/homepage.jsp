<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="#slogan" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90" id="slogan">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br />
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>

            <ul class="slogan--buttons">
                <li><a href="/app/createGiveAway" class="btn btn--large">Oddaj rzeczy</a></li>
                <li><a href="/app/addGathering" class="btn btn--large">Zorganizuj zbiórkę</a></li>
            </ul>
        </div>
    </div>
</header>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${bagNum}</em>
            <h3>Oddanych worków</h3>
            <p>Każdy worek ma pojemność aż 60 litrów!</p>
        </div>

        <div class="stats--item">
            <em>${orgNum}</em>
            <h3>Wspartych organizacji</h3>
            <p>Każdy może wesprzeć jedną (bądź wiele) organizacji.</p>
        </div>

        <div class="stats--item">
            <em>${gatheringNum}</em>
            <h3>Zorganizowanych zbiórek</h3>
            <p>Możesz samodzielnie zorganizować lokalną zbiórkę używając naszego portalu</p>
        </div>
    </div>
</section>

<section class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="/register" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us" id="about">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero optio esse quisquam illo omnis.</p>
        <img src="resources/images/signature.svg" class="about-us--text-signature" alt="Signature" />
    </div>
    <div class="about-us--image"><img src="resources/images/about-us.jpg" alt="People in circle" /></div>
</section>

<section class="help" id="help">
    <h2>Komu pomagamy?</h2>

    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">Organizacjom</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Lokalnym zbiórkom</a></li>
    </ul>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy. Możesz sprawdzić czym się zajmują, komu pomagają i czego potrzebują.</p>

        <ul class="help--slides-items">
            <c:forEach items="${allOrgs}" var="org">
                <li>
                    <div class="col">
                        <div class="title">Fundacja <a href="/orgDetails/${org.id}" class="btn btn--without-border">"${org.name}"</a></div>
                        <div class="subtitle">Cel i misja: ${org.description}</div>
                    </div>

                    <div class="col"><div class="text"><c:forEach var="good" items="${org.orgGoods}">${good.name}, </c:forEach></div></div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- SLIDE 2 -->
    <div class="help--slides" data-id="2">
        <p>W naszej bazie znajdziesz również listę lokalnych zbiórek, których organizatorami są nasi użytkownicy.</p>
        <ul class="help--slides-items">
            <c:forEach items="${activeGatherings}" var="gathering">
                <li>
                    <div class="col">
                        <div class="title">Zbiórka <a href="/gatheringDetails/${gathering.id}" class="btn btn--without-border">${gathering.city} - ${gathering.user.firstName} ${gathering.user.lastName}</a></div>
                        <div class="subtitle">${gathering.description}</div>
                    </div>

                    <div class="col"><div class="text"><c:forEach var="good" items="${gathering.goods}">${good.name}, </c:forEach></div></div>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>

<jsp:include page="homeFooter.jsp"/>