<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section class="login-page">
    <h2>Szczegóły zbiórki</h2>
</section>

<section class="help" id="help">
    <div class="help--slides active" >
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Zbierane przedmioty:</div>
                    <c:forEach items="${gathering.goods}" var="good">
                        <div class="text">${good.name}</div>
                    </c:forEach>
                </div>
                <div class="col">
                    <div class="title">Potrzebujący:</div>
                    <c:forEach items="${gathering.receivers}" var="receiver">
                        <div class="text">${receiver.name}</div>
                    </c:forEach>
                </div>
                <div class="col">
                    <div class="title">Dane organizacyjne:</div>
                    <div class="text">Adres: ${gathering.street}</div>
                    <div class="text">Miasto: ${gathering.city}</div>
                    <div class="text">Kod pocztowy: ${gathering.postalCode}</div>
                    <div class="text">Telefon: ${gathering.telephone}</div>
                    <div class="text">Data: ${gathering.date}</div>
                    <div class="text">Opis zbiórki: ${gathering.description}</div>
                </div>
            </li>
        </ul>
    </div>
</section>

<jsp:include page="appFooter.jsp"/>
