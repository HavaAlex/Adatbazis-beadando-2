-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jún 01. 18:00
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szebale_foglalkoztatas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalkozasok`
--

CREATE TABLE `foglalkozasok` (
  `fid` int(11) DEFAULT NULL,
  `megyeid` int(11) NOT NULL,
  `mezogazdasag` int(11) DEFAULT NULL,
  `ipar` int(11) DEFAULT NULL,
  `szolgatatas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `foglalkozasok`
--

INSERT INTO `foglalkozasok` (`fid`, `megyeid`, `mezogazdasag`, `ipar`, `szolgatatas`) VALUES
(101, 1, 3174, 142912, 608871),
(102, 2, 27073, 59101, 113044),
(103, 3, 7535, 48733, 87689),
(104, 4, 12570, 41535, 75758),
(105, 5, 7231, 74157, 138928),
(106, 6, 18795, 43974, 93966),
(107, 7, 8806, 74183, 94035),
(108, 8, 8300, 70517, 105677),
(109, 9, 14656, 58620, 117214),
(110, 10, 5575, 42101, 67350),
(111, 11, 10130, 46417, 84702),
(112, 12, 3544, 60125, 67493),
(113, 13, 2605, 30785, 42677),
(114, 14, 14579, 142899, 314191),
(115, 15, 7128, 31683, 73255),
(116, 16, 8686, 52961, 111929),
(117, 17, 8137, 32959, 48948),
(118, 18, 5971, 43708, 59418),
(119, 19, 6292, 61038, 80341),
(120, 20, 6034, 47786, 67885);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lakosok`
--

CREATE TABLE `lakosok` (
  `megyeid` int(11) NOT NULL,
  `lakoszam` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `lakosok`
--

INSERT INTO `lakosok` (`megyeid`, `lakoszam`) VALUES
(1, 1695814),
(2, 539971),
(3, 399652),
(4, 388847),
(5, 730435),
(6, 424615),
(7, 428676),
(8, 440000),
(9, 548981),
(10, 322194),
(11, 410131),
(12, 315334),
(13, 216040),
(14, 1146560),
(15, 331253),
(16, 581312),
(17, 244910),
(18, 264892),
(19, 365889),
(20, 294824);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megyek`
--

CREATE TABLE `megyek` (
  `megyeid` int(11) NOT NULL,
  `regioid` int(11) DEFAULT NULL,
  `megyenev` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `megyek`
--

INSERT INTO `megyek` (`megyeid`, `regioid`, `megyenev`) VALUES
(1, 1, 'Budapest\r'),
(2, 7, 'Bács-Kiskun\r'),
(3, 4, 'Baranya\r'),
(4, 7, 'Békés\r'),
(5, 5, 'Borsod-Abaúj-Zemplén\r'),
(6, 7, 'Csongrád\r'),
(7, 2, 'Fejér\r'),
(8, 3, 'Győr-Moson-Sopron\r'),
(9, 6, 'Hajdú-Bihar\r'),
(10, 5, 'Heves\r'),
(11, 6, 'Jász-Nagykun-Szolnok\r'),
(12, 2, 'Komárom-Esztergom\r'),
(13, 5, 'Nógrád\r'),
(14, 1, 'Pest\r'),
(15, 4, 'Somogy\r'),
(16, 6, 'Szabolcs-Szatmár-Bereg\r'),
(17, 4, 'Tolna\r'),
(18, 3, 'Vas\r'),
(19, 2, 'Veszprém\r'),
(20, 3, 'Zala');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `regiok`
--

CREATE TABLE `regiok` (
  `regioid` int(11) NOT NULL,
  `regionev` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `regiok`
--

INSERT INTO `regiok` (`regioid`, `regionev`) VALUES
(1, 'Közép-Magyarország\r'),
(2, 'Közép-Dunántúl\r'),
(3, 'Nyugat-Dunántúl\r'),
(4, 'Dél-Dunántúl\r'),
(5, 'Észak-Magyarország\r'),
(6, 'Észak-Alföld\r'),
(7, 'Dél-Alföld'),
(8, 'Kaukázus');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `foglalkozasok`
--
ALTER TABLE `foglalkozasok`
  ADD PRIMARY KEY (`megyeid`);

--
-- A tábla indexei `lakosok`
--
ALTER TABLE `lakosok`
  ADD PRIMARY KEY (`megyeid`);

--
-- A tábla indexei `megyek`
--
ALTER TABLE `megyek`
  ADD PRIMARY KEY (`megyeid`),
  ADD KEY `fk_megyek_regiok` (`regioid`);

--
-- A tábla indexei `regiok`
--
ALTER TABLE `regiok`
  ADD PRIMARY KEY (`regioid`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `megyek`
--
ALTER TABLE `megyek`
  ADD CONSTRAINT `fk_megyek_foglalkozasok` FOREIGN KEY (`megyeid`) REFERENCES `foglalkozasok` (`megyeid`),
  ADD CONSTRAINT `fk_megyek_lakosok` FOREIGN KEY (`megyeid`) REFERENCES `lakosok` (`megyeid`),
  ADD CONSTRAINT `fk_megyek_regiok` FOREIGN KEY (`regioid`) REFERENCES `regiok` (`regioid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
