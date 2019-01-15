<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="help" id="help">
    <h2>Szczegółowe dane datku o ID: ${offer.id}</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">

            <li>
                <div class="col">
                    <div class="title">
                        ${offer.bagNum}
                    </div>
                    <div class="text">
                        Ilość 60L worków
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        <a href="/orgDetails/${offer.institution.id}" class="btn btn--small">${offer.institution.name}</a>
                    </div>
                    <div class="text">
                        Wybrana organizacja
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">
                        <c:forEach var="good" items="${offer.goods}">
                            ${good.name},
                        </c:forEach>
                    </div>
                    <div class="text">
                        Przekazywane przedmioty
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        <c:forEach var="receiver" items="${offer.receivers}">
                            ${receiver.name},
                        </c:forEach>
                    </div>
                    <div class="text">
                        Wybrani potrzebujący
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">
                        Poszczególne statusy
                    </div>
                    <div class="text">
                        Przeczytano wiadomość:
                        <c:if test="${offer.opened == true}">
                            TAK
                        </c:if>
                        <c:if test="${offer.opened == false}">
                            NIE
                        </c:if>
                    </div>
                    <div class="text">
                        Wysłano paczkę:
                        <c:if test="${offer.sent == true}">
                            TAK
                        </c:if>
                        <c:if test="${offer.sent == false}">
                            NIE
                        </c:if>
                    </div>
                    <div class="text">
                        Odebrano paczkę:
                        <c:if test="${offer.received == true}">
                            TAK
                        </c:if>
                        <c:if test="${offer.received == false}">
                            NIE
                        </c:if>
                    </div>
                </div>
                <div class="col">
                    <div class="title">Dane do wysyłki:</div>
                    <div class="text">Miasto: ${offer.postalCode} ${offer.city}</div>
                    <div class="text">Adres: ${offer.street}</div>
                    <div class="text">Numer telefonu: ${offer.telephone}</div>
                    <div class="text">Data wysyłki: ${offer.date}</div>
                    <div class="text">Instrukcje dla kuriera: ${offer.additionalInstructions}</div>
                </div>
            </li>
        </ul>
    </div>
</section>


<jsp:include page="adminFooter.jsp"/>