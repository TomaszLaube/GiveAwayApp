<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section>
    <div>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title"><h2>Niewysłane datki</h2></div>
                </div>
                <div class="col">
                    <div class="title"><h2>Wysłane datki</h2></div>
                </div>
            </li>
            <li>
                <div class="col">
                    <c:if test="${not empty newUserOffers}">
                        <div class="title">Odbiorca/Wysyłka</div>
                        <c:forEach items="${newUserOffers}" var="notSent">
                            <div class="title">
                                    ${notSent.institution.name}/${notSent.date}
                                <a href="/app/offerDetails/${notSent.id}" class="btn btn--small">Szczegóły</a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty newUserOffers}">
                        <div class="title">Brak niewysłanych datków</div>
                    </c:if>
                </div>
                <div class="col">
                    <c:if test="${not empty sentUserOffers}">
                        <div class="title">Odbiorca/Wysyłka</div>
                        <c:forEach items="${sentUserOffers}" var="sent">
                            <div class="title">
                                    ${sent.institution.name}/${sent.date} <a href="/app/offerDetails/${sent.id}"
                                                                             class="btn btn--small">Szczegóły</a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty sentUserOffers}">
                        <div class="title">Brak wysłanych datków</div>
                    </c:if>
                </div>
            </li>
        </ul>
    </div>
</section>

<jsp:include page="appFooter.jsp"/>
