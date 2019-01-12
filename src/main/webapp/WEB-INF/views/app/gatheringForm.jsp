<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="appHeader.jsp"/>

<section class="login-page">
    <h2>Zorganizuj zbiórkę</h2>
    <form:form method="post" modelAttribute="gathering">

        <div>
            <ul class="help--slides-items">
                <li>
                    <div class="col">
                        <div class="title">
                            Wybierz potrzebujących:
                        </div>
                        <c:forEach items="${receivers}" var="receiver">
                            <div class="title">
                                <form:checkbox path="receivers"
                                               value="${receiver.id}"/>
                                    ${receiver.name}
                            </div>
                        </c:forEach>
                        <c:if test="${emptyReceivers}">
                            <div class="error">Nie wybrano żadnej opcji</div>
                        </c:if>
                    </div>
                    <div class="col">
                        <div class="title">
                            Wybierz przedmioty:
                        </div>
                        <c:forEach items="${goods}" var="good">
                            <div class="title">
                                <form:checkbox path="goods"
                                               value="${good.id}"/>
                                    ${good.name}
                            </div>
                        </c:forEach>
                        <c:if test="${emptyGoods}">
                            <div class="error">Nie wybrano żadnej opcji</div>
                        </c:if>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Miasto:</div>
                        <div class="title">
                            <form:input path="city" placeholder="Miasto" required="true"/>
                        </div>
                        <div class="error"><form:errors path="city"/></div>
                    </div>
                    <div class="col">
                        <div class="text">Adres:</div>
                        <div class="title">
                            <form:input path="street" placeholder="Adres" required="true"/>
                        </div>
                        <div class="error"><form:errors path="street"/></div>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Kod pocztowy:</div>
                        <div class="title">
                            <form:input path="postalCode" placeholder="Kod pocztowy" required="true"/>
                        </div>
                        <div class="error"><form:errors path="postalCode"/></div>
                    </div>
                    <div class="col">
                        <div class="text">Numer telefonu:</div>
                        <div class="title">
                            <form:input path="telephone" placeholder="Numer telefonu" required="true"/>
                        </div>
                        <div class="error"><form:errors path="telephone"/></div>
                    </div>
                </li>
                <li>
                    <div class="col">
                        <div class="text">Data odbioru:</div>
                        <div class="title">
                            <form:input path="date" type="date" placeholder="Data" required="true"/>
                        </div>
                        <div class="error"><form:errors path="date"/></div>
                    </div>
                    <div class="col">
                        <div class="text">Opisz cel swojej zbiórki:</div>
                        <div class="title">
                            <form:textarea path="description" placeholder="Instrukcje dla kuriera"
                                           required="true"/>
                        </div>
                        <div class="error"><form:errors path="description"/></div>
                    </div>
                </li>
                <li>
                    <div class="form-group form-group--buttons">
                        <button class="btn" type="submit">Dodaj zbiórkę</button>
                    </div>
                </li>
            </ul>



        </div>
    </form:form>
</section>

<jsp:include page="appFooter.jsp"/>
