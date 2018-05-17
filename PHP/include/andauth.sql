-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 May 2018, 15:49:37
-- Sunucu sürümü: 10.1.30-MariaDB
-- PHP Sürümü: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `andauth`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(100) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `unique_id`, `name`, `number`, `province`, `district`, `email`, `encrypted_password`, `salt`, `image`, `created_at`, `updated_at`) VALUES
(7, '5ae8885e545314.36657315', 'Tolga Kenaralp', '5331702716', 'Bilecik', 'Merkez', 'tolgakenaralp@gmail.com', 'CfVR8BoTOl9xUFk9Idn4tqQlJCs4MjAwZmMzZWY5', '8200fc3ef9', NULL, '2018-05-01 18:31:42', NULL),
(8, '5af17fd175ac09.78129724', 'Samet Aydn', '5331702716', 'Bilecik', 'Merkez', 'sametay@gmail.com', 'g4kpHnLtOK7PlRNFHLDqyGQyvb5lZmZmYzFiODNh', 'efffc1b83a', '1526561485377.png', '2018-05-08 13:45:37', '2018-05-17 15:51:26'),
(9, '5af1a1a8ce0db3.93138640', 'Ugur Can Salan', '5331702716', 'Istanbul', 'Beyoglu', 'ugur@gmail.com', '72RqOxMkWWfTkEEGbp5tI2ilgyFhYzcwZDdiNDc1', 'ac70d7b475', '1526564770227.png', '2018-05-08 16:10:00', '2018-05-17 16:46:11');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
