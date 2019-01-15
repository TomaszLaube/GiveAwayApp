<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>

<section class="login-page">
    <h2>Edytuj podstawowe dane</h2>
    <form:form method="post" modelAttribute="user">
        <label class="description" for="emailId">Adres Email:</label>
        <div class="form-group">

            <form:input path="email" placeholder="Email" required="true" id="emailId"/>
            <form:errors path="email" element="div"/>
            <c:if test="${emailExists}">
                <div class="error">Ten adres email jest już zajęty</div>
            </c:if>
        </div>
        <label class="description" for="firstNameId">Imię:</label>
        <div class="form-group">

            <form:input path="firstName" placeholder="Imię" required="true" id="firstNameId"/>
            <form:errors path="firstName" element="div"/>
        </div>
        <label class="description" for="lastNameId">Nazwisko:</label>
        <div class="form-group">

            <form:input path="lastName" placeholder="Nazwisko" required="true" id="lastNameId"/>
            <form:errors path="lastName" element="div"/>
        </div>

        <form:hidden path="id" value="${user.id}"/>
        <form:hidden path="password" value="${user.password}"/>
        <form:hidden path="enabled" value="${user.enabled}"/>
        <form:hidden path="validated" value="${user.validated}"/>
        <form:hidden path="name" value="${user.name}"/>
        <form:hidden path="description" value="${user.description}"/>

        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Aktualizuj konto</button>
        </div>
    </form:form>

    <h2>Zmiana hasła użytkownika ${user.firstName} ${user.lastName}</h2>
    <form action="/admin/changePassword/${user.id}" method="post">
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Nowe hasło" name="newPassword" required/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Powtórz nowe hasło" name="newPasswordCheck" required/>
            <c:if test="${incorrectNewPassword}">
                <div class="error">Wprowadź nowe hasło dwukrotnie</div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Ustaw hasło</button>
        </div>
    </form>
</section>

<jsp:include page="adminFooter.jsp"/>
