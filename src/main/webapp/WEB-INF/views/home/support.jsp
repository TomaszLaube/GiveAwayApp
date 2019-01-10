<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="homeHeader.jsp"/>

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


<jsp:include page="homeFooter.jsp"/>