<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section class="login-page">
    <h2>Szczegóły datku</h2>
</section>


<section class="help" id="help">
    <div class="help--slides active" >
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Oddawane przedmioty:</div>
                    <c:forEach items="${offer.goods}" var="good">
                        <div class="text">${good.name}</div>
                    </c:forEach>
                </div>
                <div class="col">
                    <div class="title">Potrzebujący:</div>
                    <c:forEach items="${offer.receivers}" var="receiver">
                        <div class="text">${receiver.name}</div>
                    </c:forEach>
                </div>
                <div class="col">
                    <div class="title">Dane do wysyłki:</div>
                    <div class="text">Adres: ${offer.street}</div>
                    <div class="text">Miasto: ${offer.city}</div>
                    <div class="text">Kod pocztowy: ${offer.postalCode}</div>
                    <div class="text">Telefon: ${offer.telephone}</div>
                    <div class="text">Data wysyłki: ${offer.date}</div>
                    <div class="text">Instrukcje dla kuriera: ${offer.additionalInstructions}</div>
                </div>
                <c:if test="${offer.user.id == user.id}">
                    <c:if test="${not offer.sent}">
                        <div class="col">
                            <div class="title">
                                <a href="/app/sentOffer/${offer.id}" class="btn">Oznacz jako wysłane</a>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </li>
        </ul>
    </div>
</section>
<jsp:include page="appFooter.jsp"/>

