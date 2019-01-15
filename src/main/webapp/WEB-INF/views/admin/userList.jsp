<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="help" id="help">
    <h2>Pozostali administratorzy</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">
                        <a href="/admin/addUser" class="btn btn--highlighted">Dodaj nowego użytkownika</a>
                    </div>
                </div>
            </li>

            <c:if test="${not empty users}">
                <c:forEach var="user" items="${users}">
                    <li>
                        <div class="col">
                            <div class="title"><a class="btn" href="/admin/userPage/${user.id}">${user.email}</a></div>
                            <div class="text">${user.firstName} ${user.lastName}</div>
                        </div>
                        <div class="col">
                            <div class="title">
                                <a href="/admin/modAccess/${user.id}" class="btn">
                                    <c:if  test="${user.enabled==true}">Zablokuj konto</c:if>
                                    <c:if  test="${user.enabled==false}">Odblokuj konto</c:if>
                                </a>
                                <a href="/admin/modAccount/${user.id}" class="btn">Edytuj</a>
                                <a href="/admin/changeRole/${user.id}" class="btn">->ADMIN</a>
                            </div>
                            <div class="text">Dostępne akcje</div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty users}">
                <div class="col">
                    <div class="title">Brak użytkowników w bazie</div>
                </div>
            </c:if>
        </ul>
    </div>
</section>


<jsp:include page="adminFooter.jsp"/>
