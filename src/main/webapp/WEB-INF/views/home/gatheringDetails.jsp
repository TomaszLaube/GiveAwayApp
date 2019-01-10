<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>


<section class="help">
    <h2>Fundacja "${org.name}"</h2>

    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">O zbiórce</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Dane organizacyjne</a></li>
        <li data-id="3"><a href="#" class="btn btn--without-border">Dane kontaktowe</a></li>
    </ul>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">

        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Przyjmowane datki</div>
                    <c:forEach items="${gathering.goods}" var="good">
                        <div class="text">${good.name}</div>
                    </c:forEach>

                </div>

                <div class="col">
                    <div class="title">Wspierane osoby</div>
                    <c:forEach items="${gathering.receivers}" var="receiver">
                        <div class="text">${receiver.name}</div>
                    </c:forEach>
                </div>
            </li>
        </ul>
    </div>

    <!-- SLIDE 2 -->
    <div class="help--slides" data-id="2">
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Data:</div>
                </div>
                <div class="col">
                    <div class="title">${gathering.date}</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Miasto:</div>
                </div>
                <div class="col">
                    <div class="title">${gathering.city}</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Kod pocztowy:</div>
                </div>
                <div class="col">
                    <div class="title">${gathering.postalCode}</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">Adres:</div>
                </div>
                <div class="col">
                    <div class="title">${gathering.street}</div>
                </div>
            </li>
        </ul>
    </div>

    <!-- SLIDE 3 -->
    <div class="help--slides" data-id="3">
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Organizator: ${gathering.user.firstName} ${gathering.user.lastName}</div>
                    <div class="text">email:${gathering.user.email} | telefon kontaktowy: ${gathering.telephone}</div>
                </div>

                <div class="col">
                    <div class="title">Cel i misja: ${gathering.description}</div>
                    <div class="text">${gathering.description}</div>
                </div>
            </li>
        </ul>
    </div>
</section>


<section class="help" id="help">
    <h2>Poznaj nasze pozostałe zbiórki lokalne</h2>

    <div class="help--slides active">
        <ul class="help--slides-items">
            <c:forEach items="${activeGatherings}" var="otherGathering">
                <c:if test="${gathering.id!=otherGathering.id}">
                    <li>
                        <div class="col">
                            <div class="title">Zbiórka <a href="/gatheringDetails/${otherGathering.id}"
                                                          class="btn btn--without-border">${otherGathering.city}
                                - ${otherGathering.user.firstName} ${otherGathering.user.lastName}</a></div>
                            <div class="subtitle">${otherGathering.description}</div>
                        </div>

                        <div class="col">
                            <div class="text"><c:forEach var="good"
                                                         items="${otherGathering.goods}">${good.name}, </c:forEach></div>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</section>

<jsp:include page="homeFooter.jsp"/>