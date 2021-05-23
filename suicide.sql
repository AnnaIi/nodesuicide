-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 23 2021 г., 18:40
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `suicide`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `suicide_method`
--

CREATE TABLE `suicide_method` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suicide_method`
--

INSERT INTO `suicide_method` (`id`, `description`) VALUES
(1, 'Механическая асфиксия, заключающаяся в удушении петлёй под воздействием тяжести тела.'),
(2, 'Огнестрельное ранение'),
(3, 'Утопление');

-- --------------------------------------------------------

--
-- Структура таблицы `suicide_person`
--

CREATE TABLE `suicide_person` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `born_date` date NOT NULL,
  `death_date` date DEFAULT NULL,
  `info` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suicide_person`
--

INSERT INTO `suicide_person` (`id`, `name`, `born_date`, `death_date`, `info`) VALUES
(1, 'Цветаева Марина Ивановна', '1892-10-08', '1941-08-31', 'Русская поэтесса Серебряного века, прозаик, переводчица.'),
(2, 'Есенин Сергей Александрович', '1895-10-03', '1925-11-18', 'Русский поэт, представитель новокрестьянской поэзии и лирики, а в более позднем периоде творчества — имажинизма (литературное направление).'),
(3, 'Маяковский Владимир Владимирович', '1893-07-19', '1930-04-14', 'Русский советский поэт. Футурист. Один из наиболее значимых поэтов XX века.\r\n\r\nПомимо поэзии, ярко проявил себя как драматург, киносценарист, кинорежиссёр, киноактёр, художник, редактор журналов «ЛЕФ» («Левый фронт»), «Новый ЛЕФ».'),
(4, 'Осаму Дадзай', '1909-06-19', '1948-06-13', 'Японский писатель, считается одним из выдающихся писателей-фантастов Японии 20-го века'),
(5, 'Хемингуэй Эрнест Миллер ', '1899-07-21', '1961-07-02', 'Американский писатель, военный корреспондент, лауреат Нобелевской премии по литературе 1954 года.');

-- --------------------------------------------------------

--
-- Структура таблицы `suicide_place`
--

CREATE TABLE `suicide_place` (
  `id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suicide_place`
--

INSERT INTO `suicide_place` (`id`, `place`) VALUES
(1, 'Деревня Елабуга'),
(2, 'Гостиница \"Англетер\", Санкт-Петербург'),
(3, 'Москва, Лубянка'),
(4, 'Токийский водосборник Тамагава'),
(5, 'Дом Хемингуэя в Кетчуме');

-- --------------------------------------------------------

--
-- Структура таблицы `suicide_suicide`
--

CREATE TABLE `suicide_suicide` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `is_successful` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  `method_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suicide_suicide`
--

INSERT INTO `suicide_suicide` (`id`, `date`, `is_successful`, `description`, `method_id`, `person_id`, `tool_id`, `place_id`) VALUES
(1, '31.08.1941', 1, '31 августа Марина Ивановна осталась в доме Бродельщиковых одна, сказавшись нездоровой. Георгий с хозяйкой ушли на воскресник – расчищать место под аэродром. Хозяин с маленьким внуком отправились на рыбалку.\r\n\r\nОбнаружила её хозяйка, вернувшись с работы, в сенях дома на балке. Есть легенда, что в тот роковой день поэт использовала верёвку, которую дал ей Борис Пастернак для связки багажа.', 1, 1, 1, 1),
(2, '28.11.1895', 1, '28 декабря 1925 года Есенина нашли мёртвым в ленинградской гостинице «Англетер» его друг Г. Ф. Устинов с супругой. В момент смерти поэта дверь внутрь номера была наглухо заперта, её взламывали ломом. После взлома дверей вошедшие друзья Есенина увидели страшную картину: весь номер был перевёрнут вверх дном, на шее лежавшего на диване поэта была подвешена петля, сделанная из разорванной простыни. Последнее стихотворение поэта — «До свиданья, друг мой, до свиданья…» — по свидетельству Вольфа Эрлиха, было передано ему накануне: Есенин жаловался, что в номере нет чернил, и он вынужден был писать своей кровью.', 1, 2, 1, 2),
(3, '14.04.1930', 1, 'Я успела дойти до парадной двери и услышала выстрел. Заметалась, боялась вернуться. Потом вошла и увидела ещё не рассеявшийся дым от выстрела. На груди Маяковского было небольшое кровавое пятно. Я бросилась к нему, я повторяла: «Что вы сделали?..» Он пытался приподнять голову. Потом голова упала, и он стал страшно бледнеть… Появились люди, мне кто-то сказал: «Бегите, встречайте карету „Скорой помощи“»… Выбежала, встретила. Вернулась, а на лестнице мне кто-то говорит: «Поздно. Умер…»\r\n— Вероника Полонская', 2, 3, 2, 3),
(4, '13.06.1948', 1, 'Весной 1948 года были созданы повесть «Исповедь „неполноценного“ человека» («Нингэн сиккаку») и рассказ «Вишни» («Ото»). Первые главы повести появились в июньском номере журнала «Тэмбо», но, не дождавшись, пока повесть будет опубликована полностью, Дадзай ушел из этого мира. Дописав «Исповедь…» и вложив в неё всю свою душу, Дадзай почувствовал себя изнурённым и опустошённым. Его терзала бессонница, обострился процесс в лёгких, открылось кровохарканье. Больной и измученный, он написал свой последний рассказ «Гуд бай» и вместе с Ямадзаки Томиэ бросился в один из токийских водосборников — Тамагава. Это было 13 июня 1948 года', 3, 4, 3, 4),
(5, '02.07.1961', 1, '2 июля 1961 года в своём доме в Кетчуме, через несколько дней после выписки из клиники Майо, Хемингуэй застрелился из любимого ружья марки W.&C. Scott & Son модель Monte Carlo B, не оставив предсмертной записки.', 2, 5, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `suicide_tool`
--

CREATE TABLE `suicide_tool` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suicide_tool`
--

INSERT INTO `suicide_tool` (`id`, `description`) VALUES
(1, 'Верёвка'),
(2, 'Огнестрельное орудие (модель неизвестна)'),
(3, 'Вода'),
(4, 'Ружьё марки W.&C. Scott & Son модель Monte Carlo B');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suicide_method`
--
ALTER TABLE `suicide_method`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suicide_person`
--
ALTER TABLE `suicide_person`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suicide_place`
--
ALTER TABLE `suicide_place`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suicide_suicide`
--
ALTER TABLE `suicide_suicide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suicide_suicide_method_id_1b6bef69_fk_suicide_method_id` (`method_id`),
  ADD KEY `suicide_suicide_person_id_470dec23_fk_suicide_person_id` (`person_id`),
  ADD KEY `suicide_suicide_tool_id_6d0d1732_fk_suicide_tool_id` (`tool_id`),
  ADD KEY `suicide_suicide_place_id_02a2cc90_fk_suicide_place_id` (`place_id`);

--
-- Индексы таблицы `suicide_tool`
--
ALTER TABLE `suicide_tool`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `suicide_method`
--
ALTER TABLE `suicide_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `suicide_person`
--
ALTER TABLE `suicide_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `suicide_place`
--
ALTER TABLE `suicide_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `suicide_suicide`
--
ALTER TABLE `suicide_suicide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `suicide_tool`
--
ALTER TABLE `suicide_tool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `suicide_suicide`
--
ALTER TABLE `suicide_suicide`
  ADD CONSTRAINT `suicide_suicide_method_id_1b6bef69_fk_suicide_method_id` FOREIGN KEY (`method_id`) REFERENCES `suicide_method` (`id`),
  ADD CONSTRAINT `suicide_suicide_person_id_470dec23_fk_suicide_person_id` FOREIGN KEY (`person_id`) REFERENCES `suicide_person` (`id`),
  ADD CONSTRAINT `suicide_suicide_place_id_02a2cc90_fk_suicide_place_id` FOREIGN KEY (`place_id`) REFERENCES `suicide_place` (`id`),
  ADD CONSTRAINT `suicide_suicide_tool_id_6d0d1732_fk_suicide_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `suicide_tool` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
