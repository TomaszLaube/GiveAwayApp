<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="loginHeader.jsp"/>


<section class="help">
    <h2>Fundacja "${org.name}"</h2>

    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">O placówce</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Statystyki</a></li>
        <li data-id="3"><a href="#" class="btn btn--without-border">Dane kontaktowe</a></li>
    </ul>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">

        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Przyjmowane datki</div>
                    <c:forEach items="${org.orgGoods}" var="good">
                        <div class="text">${good.name}</div>
                    </c:forEach>

                </div>

                <div class="col">
                    <div class="title">Wspierane osoby</div>
                    <c:forEach items="${org.orgReceivers}" var="receiver">
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
                    <div class="title">${receivedNum}*</div>
                    <div class="text">Otrzymanych przesyłek z datkami</div>
                </div>
                <div class="col">
                    <div class="text">*Dane obliczane w czasie rzeczywistym</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">${sentNum}*</div>
                    <div class="text">Przesyłek będących w drodze do placówki</div>
                </div>
                <div class="col">
                    <div class="text">*Dane obliczane w czasie rzeczywistym</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">${newNum}*</div>
                    <div class="text">Nowych datków w systemie</div>
                </div>
                <div class="col">
                    <div class="text">*Dane obliczane w czasie rzeczywistym</div>
                </div>
            </li>
        </ul>
    </div>

    <!-- SLIDE 3 -->
    <div class="help--slides" data-id="3">
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Email: ${org.email}</div>
                    <div class="subtitle">${org.location.name}- tu znajduje się nasza siedziba</div>
                </div>

                <div class="col">
                    <div class="text">Cel i misja: ${org.description}</div>
                </div>
            </li>
        </ul>
    </div>
</section>


<section class="help" id="help">
    <h2>Poznaj nasze pozostałe zaufane organizacje</h2>

    <div class="help--slides active">
        <ul class="help--slides-items">
            <c:forEach items="${allOrgs}" var="otherOrg">
                <c:if test="${org.id!=otherOrg.id}">
                    <li>
                        <div class="col">
                            <div class="title">Fundacja <a href="/orgDetails/${otherOrg.id}"
                                                           class="btn btn--without-border">"${otherOrg.name}"</a></div>
                            <div class="subtitle">Cel i misja: ${otherOrg.description}</div>
                        </div>

                        <div class="col">
                            <div class="text"><c:forEach var="good" items="${otherOrg.orgGoods}">${good.name}, </c:forEach></div>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</section>

<jsp:include page="homeFooter.jsp"/>