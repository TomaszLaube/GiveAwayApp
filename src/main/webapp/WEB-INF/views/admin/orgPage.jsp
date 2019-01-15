<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>


<section class="help" id="help">
    <h2>Pozostali administratorzy</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">
            <c:if test="${not empty admins}">
                <c:forEach var="admin" items="${admins}">
                    <li>
                        <div class="col">
                            <div class="title"><a class="btn" href="/admin/userPage/${admin.id}">${admin.email}</a></div>
                            <div class="text">${admin.firstName} ${admin.lastName}</div>
                        </div>
                        <div class="col">
                            <div class="title">
                                <a href="/admin/modAccess/${adminToList.id}" class="btn">Blokuj</a>
                                <a href="/admin/modAccount/${adminToList.id}" class="btn">Edytuj admina</a>
                                <a href="/admin/changeRole/${adminToList.id}" class="btn">Zmien role</a>
                            </div>
                            <div class="text">Dostępne akcje</div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty admins}">
                <div class="col">
                    <div class="title">Brak innych administratorów w bazie</div>
                </div>
            </c:if>
        </ul>
    </div>
</section>


<jsp:include page="adminFooter.jsp"/>