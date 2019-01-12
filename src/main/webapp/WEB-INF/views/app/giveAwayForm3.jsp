<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<jsp:include page="formHeader.jsp"/>

<%--
--%>
<section class="help" id="help">
    <h2>Dotychczasowe kryteria przekazania datku:</h2>
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
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Liczba 60L worków:</div>
                    <div class="text">${newOffer.bagNum}</div>
                </div>
                <div class="col">
                    <div class="title">Wybrana organizacja:</div>
                    <div class="text">${newOffer.institution.name}: ${newOffer.institution.description}</div>
                </div>
            </li>
        </ul>
    </div>

    <h2>Podaj dane do wysyłki:</h2>

    <form:form method="post" action="/app/createGiveAwayThird" modelAttribute="newOffer">
        <div>
            <ul class="help--slides-items">
                <li>
                    <div class="col">
                        <div class="text">Miasto:</div>
                        <div class="title">
                            <form:input path="city" placeholder="Miasto" required="true"/>
                            <form:errors path="city"/>
                        </div>
                    </div>
                    <div class="col">
                        <div class="text">Adres:</div>
                        <div class="title">
                            <form:input path="street" placeholder="Adres" required="true"/>
                            <form:errors path="street"/>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Kod pocztowy:</div>
                        <div class="title">
                            <form:input path="postalCode" placeholder="Kod pocztowy" required="true"/>
                            <form:errors path="postalCode"/>
                        </div>
                    </div>
                    <div class="col">
                        <div class="text">Numer telefonu:</div>
                        <div class="title">
                            <form:input path="telephone" placeholder="Numer telefonu" required="true"/>
                            <form:errors path="telephone"/>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Data odbioru:</div>
                        <div class="title">
                            <form:input path="date" type="date" placeholder="Data" required="true"/>
                            <form:errors path="date"/>
                        </div>
                    </div>
                    <div class="col">
                        <div class="text">Instrukcje dla kuriera:</div>
                        <div class="title">
                            <form:textarea path="additionalInstructions" placeholder="Instrukcje dla kuriera"
                                           required="true"/>
                            <form:errors path="additionalInstructions"/>
                        </div>
                    </div>
                </li>
                <li>
                    <form:hidden path="institution" value="${newOffer.institution.id}"/>
                    <form:hidden path="user" value="${newOffer.user.id}"/>
                    <form:hidden path="bagNum" value="${newOffer.bagNum}"/>
                    <button type="submit" class="btn">Dalej</button>
                </li>
            </ul>
        </div>
    </form:form>

</section>





<jsp:include page="appFooter.jsp"/>