<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="formHeader.jsp"/>




<section class="help" id="help">
    <h2>Wybierz co i komu chcesz przekazać</h2>
    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">Rzeczy i potrzebujący</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Liczba worków</a></li>
        <li data-id="3"><a href="#" class="btn btn--without-border">Wybór miasta</a></li>
    </ul>
    <form:form method="post" modelAttribute="offer">

        <!-- SLIDE 1 -->
        <div class="help--slides active" data-id="1">

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
            </ul>

        </div>

        <!-- SLIDE 2 -->
        <div class="help--slides" data-id="2">
            <h2>Podaj ilość 60l worków do przekazania:</h2>
            <ul class="help--slides-items">
                <li>
                    <form:input path="bagNum" type="number" step="1" min="1" required="true"/>
                    <form:errors path="bagNum"/>
                </li>
            </ul>

        </div>

        <!-- SLIDE 3 -->
        <div class="help--slides" data-id="3">
            <h2>Wybierz docelowe miasto wysyłki:</h2>
            <ul class="help--slides-items">
                <li>
                    <select name="locationId">
                        <c:forEach var="city" items="${locations}">
                            <option value="${city.id}">${city.name}</option>
                        </c:forEach>
                    </select>
                </li>
                <li>
                    <button type="submit" class="btn">Dalej</button>
                </li>
            </ul>
        </div>
    </form:form>
</section>

<jsp:include page="appFooter.jsp"/>
