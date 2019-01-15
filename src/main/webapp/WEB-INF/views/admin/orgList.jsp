<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="adminHeader.jsp"/>



<section class="help" id="help">
    <h2>Lista zaufanych instytucji</h2>
    <div class="help--slides active">
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">
                        <a href="/admin/addOrg" class="btn btn--highlighted">Dodaj nową instytucję</a>
                    </div>
                </div>
            </li>

            <c:if test="${not empty orgs}">
                <c:forEach var="org" items="${orgs}">
                    <li>
                        <div class="col">
                            <div class="title"><a class="btn" href="/admin/orgDetails/${org.id}">${org.name}</a></div>
                            <div class="text">${org.email}</div>
                        </div>
                        <div class="col">
                            <div class="title">
                                <a href="/admin/modAccess/${org.id}" class="btn">
                                    <c:if test="${org.enabled==true}">Zablokuj konto</c:if>
                                    <c:if test="${org.enabled==false}">Odblokuj konto</c:if>
                                </a>
                                <a href="/admin/modAccount/${org.id}" class="btn">Edytuj dane</a>
                            </div>
                            <div class="text">Dostępne akcje</div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty orgs}">
                <div class="col">
                    <div class="title">Brak zaufanych instytucji w bazie</div>
                </div>
            </c:if>
        </ul>
    </div>
</section>

<jsp:include page="adminFooter.jsp"/>