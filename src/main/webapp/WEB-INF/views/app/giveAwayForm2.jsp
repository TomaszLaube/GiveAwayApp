<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="formHeader.jsp"/>


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
                    <div class="title">Wybrane miasto:</div>
                    <div class="text">${location.name}</div>
                </div>
            </li>
        </ul>
    </div>

    <h2>Wybierz organizację która odbierze Twoje datki:</h2>


    <form method="post" action="/app/createGiveAwaySecond">
        <div>
            <ul class="help--slides-items">
                <c:forEach var="org" items="${filteredOrgs}">
                    <li>
                        <div class="col">
                            <div class="title">
                                <input type="radio" required value="${org.id}" name="orgId">
                                Organizacja "${org.name}"
                            </div>
                            <div class="text">
                                Cel i misja: ${org.description}
                            </div>
                        </div>
                    </li>
                </c:forEach>
                <li>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <button type="submit" class="btn">Dalej</button>
                </li>
            </ul>
        </div>
        <div>

        </div>
    </form>


</section>


<jsp:include page="appFooter.jsp"/>