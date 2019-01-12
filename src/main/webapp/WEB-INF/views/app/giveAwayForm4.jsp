<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<jsp:include page="formHeader.jsp"/>

<section class="help" id="help">
    <h2>Podsumowanie</h2>
    <div>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Wybrani potrzebujący:</div>
                    <div class="text">
                        <c:forEach var="receiver" items="${newOffer.receivers}">
                            ${receiver.name},
                        </c:forEach>
                    </div>
                </div>
                <div class="col">
                    <div class="title">Wybrane przedmioty:</div>
                    <div class="text">
                        <c:forEach items="${newOffer.goods}" var="good">
                            ${good.name},
                        </c:forEach>
                    </div>
                    <div class="text">(Ilość 60-litrowych worków: ${newOffer.bagNum})</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Wybrana organizacja:</div>
                    <div class="text">${newOffer.institution.name}: ${newOffer.institution.description}</div>
                </div>
                <div class="col">
                    <div class="title">Dane dla kuriera:</div>
                    <div class="text">
                        <ul>
                            <li>Miasto: ${newOffer.city}</li>
                            <li>Kod pocztowy: ${newOffer.postalCode}</li>
                            <li>Adres: ${newOffer.street}</li>
                            <li>Numer telefonu: ${newOffer.telephone}</li>
                            <li>Data wysyłki: ${newOffer.date}</li>
                            <li>Instrukcje dla kuriera: ${newOffer.additionalInstructions}</li>
                        </ul>
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <a href="/app/createGiveAway" class="btn">Powtorz</a>
                </div>
                <div class="col">
                    <form method="post" action="/app/addGiveAway">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                        <input type="submit" class="btn" value="Potwierdzam">
                    </form>
                </div>
            </li>
        </ul>


    </div>
</section>

<jsp:include page="appFooter.jsp"/>
