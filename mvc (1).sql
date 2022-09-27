-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 27 2022 г., 22:18
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `the_year_of_publishing` date NOT NULL,
  `is_it_a_new_edition` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `demand` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `author`, `title`, `the_year_of_publishing`, `is_it_a_new_edition`, `description`, `demand`, `price`) VALUES
(43, 'Стивен Кинг', 'Сияние', '2022-09-13', 'Росс', 'Роман американского писателя Стивена Кинга, написанный в жанрах психологического ужаса и готической литературы, впервые опубликованный в 1977 году издательством «Doubleday». Название было вдохновлено словами из песни Джона Леннона «Instant Karma!»', 0, 2000),
(44, 'Стивен Кинг', 'Кладбище домашних животных', '2022-09-07', 'Росс', 'Роман американского писателя Стивена Кинга, написанный в жанре готической литературы и впервые опубликованный в 1983 году издательством «Doubleday». Согласно основной сюжетной линии, семейная пара — Рейчел и Луис Криды, вместе с двумя детьми, переезжают в город Ладлоу.', 0, 1500),
(45, 'Джоан Роулинг', 'Гарри Поттер', '2022-08-30', 'Серия романов', 'Книги представляют собой хронику приключений юного волшебника Гарри Поттера, а также его друзей Рона Уизли и Гермионы Грейнджер, обучающихся в школе чародейства и волшебства Хогвартс.', 0, 350);

-- --------------------------------------------------------

--
-- Структура таблицы `library_cards`
--

CREATE TABLE `library_cards` (
  `id` int(11) NOT NULL,
  `id_reader` varchar(255) NOT NULL,
  `id_book` int(11) NOT NULL,
  `date_of_receiving` date NOT NULL,
  `delivery_date` date NOT NULL,
  `passed` varchar(20) NOT NULL DEFAULT 'Нет'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `library_cards`
--

INSERT INTO `library_cards` (`id`, `id_reader`, `id_book`, `date_of_receiving`, `delivery_date`, `passed`) VALUES
(39, '123', 43, '2022-09-28', '2022-10-07', 'Да'),
(40, 'nik', 45, '2022-08-31', '2022-09-02', 'Нет');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `publishing_houses`
--

CREATE TABLE `publishing_houses` (
  `id_PH` int(11) NOT NULL,
  `title_publishing_house` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `publishing_houses`
--

INSERT INTO `publishing_houses` (`id_PH`, `title_publishing_house`) VALUES
(23, 'Росс'),
(24, 'Серия романов');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` int(255) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `password`, `isAdmin`, `address`, `phone_number`) VALUES
(21, '1', '', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', 1, '', ''),
(22, 'nikita', 'neste', 'wkaska', '123', '202cb962ac59075b964b07152d234b70', 1, 'city Tomsk', '+79234446622'),
(23, 'Никита', 'Нестеров', 'Денисович', 'nik', 'f64609172efea86a5a6fbae12ab86d33', 0, 'Обручева', '+79234166926');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_it_a_new_edition` (`is_it_a_new_edition`);

--
-- Индексы таблицы `library_cards`
--
ALTER TABLE `library_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publishing_houses`
--
ALTER TABLE `publishing_houses`
  ADD PRIMARY KEY (`id_PH`),
  ADD UNIQUE KEY `title_publishing_house` (`title_publishing_house`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `library_cards`
--
ALTER TABLE `library_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `publishing_houses`
--
ALTER TABLE `publishing_houses`
  MODIFY `id_PH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`is_it_a_new_edition`) REFERENCES `publishing_houses` (`title_publishing_house`);

--
-- Ограничения внешнего ключа таблицы `library_cards`
--
ALTER TABLE `library_cards`
  ADD CONSTRAINT `library_cards_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `library_cards_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `users` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
