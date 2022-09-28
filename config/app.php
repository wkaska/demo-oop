<?php
return [
    //Класс аутентификации
    'auth' => \Src\Auth\Auth::class,
    //Клас пользователя
    'identity'=>\Model\User::class,
    //Классы для middleware
    'routeMiddleware' => [
        'auth' => \Middlewares\AuthMiddleware::class,
        'isAdmin' => \Middlewares\IsAdminMiddleware::class,
    ],
    'routeAppMiddleware' => [
        'csrf' => \Middlewares\CSRFMiddleware::class,
        'trim' => \Middlewares\TrimMiddleware::class,
        'specialChars' => \Middlewares\SpecialCharsMiddleware::class,
    ],
    'validators' => [
       'required' => \Validators\RequireValidator::class,
       'unique' => \Validators\UniqueValidator::class,
        'loginRegex' => \Validators\LoginValidator::class,
        'NumberRegex' => \Validators\NumberValidator::class,
        'PasswordRegex' => \Validators\PasswordValidator::class,
        'TitleRegex' => \Validators\TitleValidator::class,
   ]
];