<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<footer>
    <div class="contact" id="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form method="post" action="/contactForm" class="form--contact">

            <div class="form-group"><input type="email" name="email" placeholder="Adres email" required/></div>
            <div class="form-group form-group--50"><input type="text" name="firstName" placeholder="Imię" required/></div>
            <div class="form-group form-group--50"><input type="text" name="lastName" placeholder="Nazwisko" required /></div>

            <div class="form-group"><textarea name="message" placeholder="Wiadomość" rows="3" required></textarea></div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="/resources/images/icon-facebook.svg"/></a> <a href="#" class="btn btn--small"><img src="resources/images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>

<script src="/resources/js/app.js"></script>
</body>
</html>