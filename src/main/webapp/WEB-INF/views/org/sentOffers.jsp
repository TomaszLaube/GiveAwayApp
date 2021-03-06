<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="orgHeader.jsp"/>


<section>
    <div>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title"><h2>Wysłane datki</h2></div>
                </div>
                <div class="col">
                    <div class="title"><h2>Akcje</h2></div>
                </div>
            </li>
            <c:if test="${not empty sentOffers}">
                <c:forEach var="offer" items="${sentOffers}">
                    <li>
                        <div class="col">
                            <div class="title"><c:if test="${offer.opened==false}"><span
                                    class="notification">NOWA</span></c:if> ${offer.date}</div>
                            <div class="title">${offer.user.firstName} ${offer.user.lastName}</div>
                        </div>
                        <div class="col">
                            <div class="title">
                                <a href="/org/offerDetails/${offer.id}" class="btn">Szczegóły</a>
                                <a href="/org/updateOffer/${offer.id}" class="btn">Oznacz jako dostarczone</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty sentOffers}">
                <li>
                    <div class="col">
                        <div class="title">Brak wysłanych datków</div>
                    </div>
                    <div class="col"></div>
                </li>
            </c:if>
        </ul>
    </div>
</section>


<jsp:include page="orgFooter.jsp"/>