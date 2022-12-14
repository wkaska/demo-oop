<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<?= app()->route->getPrefix() ?>/public/static/style/style.css">
    <title>Main</title>
</head>
<body>
<header>
    <nav>

        <?php
        if (!app()->auth::check()):
            ?>
            <a href="<?= app()->route->getUrl('/login') ?>">Вход</a>
            <a href="<?= app()->route->getUrl('/signup') ?>">Регистрация</a>
        <?php
        elseif (app()->auth::user()->isAdmin()):
            ?>
            <a href="<?= app()->route->getUrl('/showUsers') ?>">Пользователи</a>
            <a href="<?= app()->route->getUrl('/books') ?>">Книги</a>
            <a href="<?= app()->route->getUrl('/logout') ?>">Выход (<?= app()->auth::user()->name ?>)</a>
        <?php
        else:
            ?>
            <a href="<?= app()->route->getUrl('/selfProfile') ?>">Профиль</a>
            <a href="<?= app()->route->getUrl('/books') ?>">Книги</a>
            <a href="<?= app()->route->getUrl('/logout') ?>">Выход (<?= app()->auth::user()->name ?>)</a>
        <?php
        endif;
        ?>
    </nav>
</header>
<main>
    <?= $content ?? '' ?>
</main>


</body>
</html>
