<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>

<section class="login-page">
    <h2>Dodaj admina</h2>
    <form:form method="post" modelAttribute="admin">

        <div class="form-group">
            <form:input path="email" placeholder="Email" required="true"/>
            <form:errors path="email" element="div"/>
            <c:if test="${emailExists}">
                <div class="error">Ten adres email jest już zajęty</div>
            </c:if>
        </div>

        <div class="form-group">
            <form:input path="firstName" placeholder="Imię" required="true"/>
            <form:errors path="firstName" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="lastName" placeholder="Nazwisko" required="true"/>
            <form:errors path="lastName" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="password" type="password" placeholder="Hasło" required="true"/>
            <form:errors path="password" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="checkPassword" type="password" placeholder="Powtórz hasło" required="true"/>
            <form:errors path="checkPassword" element="div"/>
            <c:if test="${incorrectPasswordCheck}">
                <div class="error">Powtórz poprawnie hasło</div>
            </c:if>
        </div>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Załóż konto</button>
        </div>
        <form:hidden path="name" value="N/A"/>
        <form:hidden path="description" value="N/A"/>
    </form:form>
</section>

<jsp:include page="adminFooter.jsp"/>