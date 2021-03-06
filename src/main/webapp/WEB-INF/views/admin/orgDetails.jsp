<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="help" id="help">
    <h2>Szczegółowe dane organizacji o ID: ${org.id}</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">

            <li>
                <div class="col">
                    <div class="title">
                        ${org.email}
                    </div>
                    <div class="text">
                        Adres email
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        ${org.name}
                    </div>
                    <div class="text">
                        Nazwa
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">
                        <c:forEach var="role" items="${org.roles}">
                            ${role.name}
                        </c:forEach>
                    </div>
                    <div class="text">
                        Poziom dostępu
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        <c:if test="${org.enabled==true}">
                            Przyznany
                        </c:if>
                        <c:if test="${org.enabled==false}">
                            Odebrany
                        </c:if>
                    </div>
                    <div class="text">
                        Dostęp do konta
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">
                        <c:if test="${org.validated==true}">
                            Zakończony
                        </c:if>
                        <c:if test="${org.validated==false}">
                            Niezakończony
                        </c:if>
                    </div>
                    <div class="text">Status walidacji konta</div>
                </div>
                <div class="col">
                    <div class="title">
                        <c:if test="${org.org==true}">OK</c:if>
                        <c:if test="${org.org==false}">BŁĄÐ</c:if>
                    </div>
                    <div class="text">Flaga organizacji</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">${org.location.name}</div>
                    <div class="text">Lokalizacja</div>
                </div>
                <div class="col">
                    <div class="title">Cel i misja</div>
                    <div class="text">${org.description}</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Przyjmowane datki</div>
                    <c:forEach var="good" items="${org.orgGoods}">
                        <div class="text">${good.name}</div>
                    </c:forEach>
                </div>
                <div class="col">
                    <div class="title">Wspierane osoby</div>
                    <c:forEach var="receiver" items="${org.orgReceivers}">
                        <div class="text">${receiver.name}</div>
                    </c:forEach>
                </div>
            </li>
        </ul>
    </div>
</section>

<jsp:include page="adminFooter.jsp"/>
