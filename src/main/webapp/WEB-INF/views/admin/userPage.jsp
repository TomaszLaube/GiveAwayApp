<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="help" id="help">
    <h2>Szczegółowe dane użytkownika o ID: ${user.id}</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">

            <li>
                <div class="col">
                    <div class="title">
                        ${user.email}
                    </div>
                    <div class="text">
                        Adres email
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        ${user.firstName} ${user.lastName}
                    </div>
                    <div class="text">
                        Imię i nazwisko
                    </div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">
                        <c:forEach var="role" items="${user.roles}">
                            ${role.name}
                        </c:forEach>
                    </div>
                    <div class="text">
                        Poziom dostępu
                    </div>
                </div>
                <div class="col">
                    <div class="title">
                        <c:if test="${user.enabled==true}">
                            Przyznany
                        </c:if>
                        <c:if test="${user.enabled==false}">
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
                        <c:if test="${user.validated==true}">
                            Zakończony
                        </c:if>
                        <c:if test="${user.validated==false}">
                            Niezakończony
                        </c:if>
                    </div>
                    <div class="text">Status walidacji konta</div>
                </div>
                <div class="col">
                    <div class="title"></div>
                    <div class="text"></div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Lista datków</div>
                    <div class="text">
                        <c:forEach var="offer" items="${user.offers}">
                            <a href="/admin/offerDetails/${offer.id}" class="btn">${offer.date} ${offer.institution.name}</a><br>
                        </c:forEach>
                    </div>
                </div>
                <div class="col">
                    <div class="title">Lista zbiórek</div>
                    <div class="text">
                        <c:forEach items="${user.gatherings}" var="gathering">
                            <a href="/gatheringDetails/${gathering.id}" class="btn">${gathering.date} ${gathering.city}</a><br>
                        </c:forEach>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</section>


<jsp:include page="adminFooter.jsp"/>