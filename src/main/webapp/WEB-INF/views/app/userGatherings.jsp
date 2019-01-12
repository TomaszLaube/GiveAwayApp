<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section>
    <div>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title"><h2>Zaplanowane zbiórki</h2></div>
                </div>
                <div class="col">
                    <div class="title"><h2>Przeprowadzone zbiórki</h2></div>
                </div>
            </li>
            <li>
                <div class="col">
                    <c:if test="${not empty activeGatherings}">
                        <div class="title">Data: Opis</div>
                        <c:forEach items="${activeGatherings}" var="activeG">
                            <div class="title">
                                    ${activeG.date}: ${activeG.description}
                                <a href="/app/gatheringDetails/${activeG.id}" class="btn btn--small">Szczegóły</a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty activeGatherings}">
                        <div class="title">Brak zaplanowanych zbiórek</div>
                    </c:if>
                </div>
                <div class="col">
                    <c:if test="${not empty inactiveGatherings}">
                        <div class="title">Data: Opis</div>
                        <c:forEach items="${inactiveGatherings}" var="inactiveG">
                            <div class="title">
                                    ${inactiveG.date}: ${inactiveG.description}
                                <a href="/app/gatheringDetails/${inactiveG.id}" class="btn btn--small">Szczegóły</a>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty inactiveGatherings}">
                        <div class="title">Brak przeprowadzonych zbiórek</div>
                    </c:if>
                </div>
            </li>
        </ul>
    </div>
</section>

<jsp:include page="appFooter.jsp"/>
