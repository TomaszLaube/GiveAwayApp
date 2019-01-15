<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="login-page">
    <h2>Edytuj dane konta organizacji</h2>
    <form:form method="post" action="/admin/modOrg/${org.id}" modelAttribute="org">
        <div>
            <ul class="help--slides-items">
                <li>
                    <div class="col">
                        <div class="title">
                            Wybierz potrzebujących:
                        </div>
                        <c:forEach items="${receivers}" var="receiver">
                            <c:set var="usedReceiver" value="${false}" scope="session"/>
                            <c:forEach items="${org.orgReceivers}" var="orgReceiver">
                                <c:if test="${orgReceiver.id==receiver.id}">
                                    <c:set var="usedReceiver" value="${true}" scope="session"/>
                                </c:if>
                            </c:forEach>
                            <div class="title">
                                <c:if test="${usedReceiver == true}">
                                    <form:checkbox path="orgReceivers"
                                                   value="${receiver.id}" checked="true"/>
                                    ${receiver.name}
                                </c:if>
                                <c:if test="${usedReceiver == false}">
                                    <form:checkbox path="orgReceivers"
                                                   value="${receiver.id}"/>
                                    ${receiver.name}
                                </c:if>
                            </div>
                        </c:forEach>
                        <c:if test="${emptyReceivers}">
                            <div class="notification">Nie wybrano żadnej opcji</div>
                        </c:if>
                    </div>
                    <div class="col">
                        <div class="title">
                            Wybierz przedmioty:
                        </div>
                        <c:forEach items="${goods}" var="good">
                            <c:set var="usedGood" value="${false}" scope="session"/>
                            <c:forEach items="${org.orgGoods}" var="orgGood">
                                <c:if test="${orgGood.id==good.id}">
                                    <c:set var="usedGood" value="${true}" scope="session"/>
                                </c:if>
                            </c:forEach>
                            <div class="title">
                                <c:if test="${usedGood == true}">
                                    <form:checkbox path="orgGoods"
                                                   value="${good.id}" checked="true"/>
                                    ${good.name}
                                </c:if>
                                <c:if test="${usedGood == false}">
                                    <form:checkbox path="orgGoods"
                                                   value="${good.id}"/>
                                    ${good.name}
                                </c:if>
                            </div>
                        </c:forEach>
                        <c:if test="${emptyGoods}">
                            <div class="notification">Nie wybrano żadnej opcji</div>
                        </c:if>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Email:</div>
                        <div class="title">
                            <form:input path="email" placeholder="Email" required="true"/>
                        </div>
                        <div class="notification"><form:errors path="email"/></div>
                    </div>
                    <div class="col">
                        <div class="text">Nazwa:</div>
                        <div class="title">
                            <form:input path="name" placeholder="Nazwa" required="true"/>
                        </div>
                        <div class="notification"><form:errors path="name"/></div>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Lokalizacja:</div>
                        <div class="title">
                            <form:select path="location" required="true">
                                <c:forEach items="${locations}" var="location">
                                    <c:if test="${location.id==org.location.id}">
                                        <form:option value="${location.id}" selected="true">${location.name}</form:option>
                                    </c:if>
                                    <c:if test="${location.id!=org.location.id}">
                                        <form:option value="${location.id}">${location.name}</form:option>
                                    </c:if>

                                </c:forEach>
                            </form:select>
                            <div class="notification">
                                <form:errors path="location" element="div"/>
                            </div>
                        </div>

                    </div>
                    <div class="col">
                        <div class="text">Cel i misja:</div>
                        <div class="title">
                            <form:textarea path="description" placeholder="Cel i misja" required="true"/>
                        </div>
                        <div class="notification"><form:errors path="description"/></div>
                    </div>
                </li>
                <li>
                    <div class="form-group form-group--buttons">
                        <button class="btn" type="submit">Aktualizuj konto</button>
                    </div>
                </li>
            </ul>
        </div>
        <form:hidden path="firstName" value="${user.firstName}"/>
        <form:hidden path="lastName" value="${user.lastName}"/>
        <form:hidden path="id" value="${user.id}"/>
        <form:hidden path="password" value="${user.password}"/>
        <form:hidden path="enabled" value="${user.enabled}"/>
        <form:hidden path="validated" value="${user.validated}"/>
        <form:hidden path="org" value="${user.org}"/>
    </form:form>
    <h2>Zmiana hasła</h2>
    <form action="/org/changePassword" method="post">
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Aktualne hasło" name="oldPassword" required/>
            <c:if test="${incorrectOldPassword}">
                <div class="notification">Niepoprawne hasło</div>
            </c:if>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Nowe hasło" name="newPassword" required/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Powtórz nowe hasło" name="newPasswordCheck" required/>
            <c:if test="${incorrectNewPassword}">
                <div class="notification">Wprowadź nowe hasło dwukrotnie</div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Zmień hasło</button>
        </div>
    </form>
</section>


<jsp:include page="adminFooter.jsp"/>
