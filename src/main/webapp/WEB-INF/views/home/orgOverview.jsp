<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="homeHeader.jsp"/>

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