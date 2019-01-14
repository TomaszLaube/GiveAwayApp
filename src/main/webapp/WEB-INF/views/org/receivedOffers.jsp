<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="orgHeader.jsp"/>

<section>
    <div>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title"><h2>Odebrane datki</h2></div>
                </div>
                <div class="col">
                    <div class="title"><h2>Akcje</h2></div>
                </div>
            </li>
            <c:if test="${not empty receivedOffers}">
                <c:forEach var="offer" items="${receivedOffers}">
                    <li>
                        <div class="col">
                            <div class="title">${offer.date}</div>
                            <div class="title">${offer.user.firstName} ${offer.user.lastName}</div>
                        </div>
                        <div class="col">
                            <div class="title">
                                <a href="/org/offerDetails/${offer.id}" class="btn">Szczegóły</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty receivedOffers}">
                <li>
                    <div class="col">
                        <div class="title">Brak odebranych datków</div>
                    </div>
                    <div class="col"></div>
                </li>
            </c:if>
        </ul>
    </div>
</section>

<jsp:include page="orgFooter.jsp"/>