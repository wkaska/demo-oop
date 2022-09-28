<h2>Регистрация нового пользователя</h2>
<h3><?= $message ?? ''; ?></h3>
<div class="view-form">
<form method="post">
    <input name="csrf_token" type="hidden" value="<?= app()->auth::generateCSRF() ?>"/>
    <label>Имя <input type="text" name="name"></label>
    <label>Фамилия <input type="text" name="surname"></label>
    <label>Отчество <input type="text" name="patronymic"></label>
    <label>Адрес <input type="text" name="address"></label>
    <label>Номер телефона <input placeholder="+7" type="tel" name="phone_number"></label>
    <label>Логин <input type="text" name="login"></label>
    <label>Пароль <input type="password" name="password"></label>
    <button>Зарегистрироваться</button>
</form>
</div>