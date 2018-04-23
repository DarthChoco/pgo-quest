SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Tabellenstruktur für Tabelle `actual_quests`
--

CREATE TABLE IF NOT EXISTS `actual_quests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_count` int(11) NOT NULL,
  `quest` int(11) NOT NULL,
  `pokestop` int(11) NOT NULL,
  `reward_count` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  `day` date NOT NULL,
  `user` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `quest` (`quest`,`pokestop`,`day`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=1 ;


--
-- Tabellenstruktur für Tabelle `pokestops`
--

CREATE TABLE IF NOT EXISTS `pokestops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET latin1 COLLATE latin1_german2_ci NOT NULL,
  `area` int(11) NOT NULL,
  `pgoid` int(11) NOT NULL,
  `location` varchar(120) CHARACTER SET latin1 COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `pokestops`
--

INSERT INTO `pokestops` (`id`, `name`, `area`, `pgoid`, `location`) VALUES
(1, 'Holzfee', 1, 0, '52.456857, 9.979853');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest` text COLLATE latin1_german2_ci NOT NULL,
  `quest_multi` text COLLATE latin1_german2_ci NOT NULL,
  `rare` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=55 ;

--
-- Daten für Tabelle `quests`
--

INSERT INTO `quests` (`id`, `quest`, `quest_multi`, `rare`) VALUES
(1, 'Brüte ein Ei aus.', 'Brüte [ANZAHL] Eier aus.', 0),
(2, 'Drehe einen PokéStop, den du noch nicht besucht hast.', 'Drehe [ANZAHL] PokéStop, die du noch nicht besucht hast.', 0),
(3, 'Drehe einen PokéStop.', 'Drehe [ANZAHL] PokéStops.', 0),
(4, 'Entwickle ein Pokémon vom Typ Feuer.', 'Entwickle [ANZAHL] Pokémon vom Typ Feuer.', 0),
(5, 'Entwickle ein Pokémon.', 'Entwickle [ANZAHL] Pokémon.', 0),
(6, 'Fange ein Ditto.', 'Fange [ANZAHL] Ditto.', 0),
(7, 'Fange ein Geckarbor oder Hydropi.', 'Fange [ANZAHL] Geckarbor oder Hydropi.', 0),
(8, 'Fange ein Mauzi oder Eneco.', 'Fange [ANZAHL] Mauzi oder Eneco.', 0),
(9, 'Fange ein Myrapla oder Knofensa.', 'Fange [ANZAHL] Myrapla oder Knofensa.', 0),
(10, 'Fange ein Pokémon und nutze dabei eine Beere.', 'Fange [ANZAHL] Pokémon und nutze dabei eine Beere.', 0),
(11, 'Fange ein Pokémon unter dem Einfluss eines Wettereffekts.', 'Fange [ANZAHL] Pokémon unter dem Einfluss eines Wettereffekts.', 0),
(12, 'Fange ein Pokémon vom Typ Boden', 'Fange [ANZAHL] Pokémon vom Typ Boden.', 0),
(13, 'Fange ein Pokémon vom Typ Drache.', 'Fange [ANZAHL] Pokémon vom Typ Drache.', 0),
(14, 'Fange ein Pokémon vom Typ Dunkel.', 'Fange [ANZAHL] Pokémon vom Typ Dunkel', 0),
(15, 'Fange ein Pokémon vom Typ Eis.', 'Fange [ANZAHL] Pokémon vom Typ Eis.', 0),
(16, 'Fange ein Pokémon vom Typ Elektro.', 'Fange [ANZAHL] Pokémon vom Typ Elektro.', 0),
(17, 'Fange ein Pokémon vom Typ Fee.', 'Fange [ANZAHL] Pokémon vom Typ Fee.', 0),
(18, 'Fange ein Pokémon vom Typ Feuer.', 'Fange [ANZAHL] Pokémon vom Typ Feuer.', 0),
(19, 'Fange ein Pokémon vom Typ Flug.', 'Fange [ANZAHL] Pokémon vom Typ Flug.', 0),
(20, 'Fange ein Pokémon vom Typ Geist.', 'Fange [ANZAHL] Pokémon vom Typ Geist.', 0),
(21, 'Fange ein Pokémon vom Typ Gestein.', 'Fange [ANZAHL] Pokémon vom Typ Gestein.', 0),
(22, 'Fange ein Pokémon vom Typ Gift.', 'Fange [ANZAHL] Pokémon vom Typ Gift.', 0),
(23, 'Fange ein Pokémon vom Typ Gras, Feuer oder Boden.', 'Fange [ANZAHL] Pokémon vom Typ Gras, Feuer oder Boden.', 0),
(24, 'Fange ein Pokémon vom Typ Gras.', 'Fange [ANZAHL] Pokémon vom Typ Gras.', 0),
(25, 'Fange ein Pokémon vom Typ Käfer.', 'Fange [ANZAHL] Pokémon vom Typ Käfer', 0),
(26, 'Fange ein Pokémon vom Typ Kampf.', 'Fange [ANZAHL] Pokémon vom Typ Kampf.', 0),
(27, 'Fange ein Pokémon vom Typ Normal.', 'Fange [ANZAHL] Pokémon vom Typ Normal.', 0),
(28, 'Fange ein Pokémon vom Typ Psycho.', 'Fange [ANZAHL] Pokémon vom Typ Psycho.', 0),
(29, 'Fange ein Pokémon vom Typ Stahl.', 'Fange [ANZAHL] Pokémon vom Typ Stahl.', 0),
(30, 'Fange ein Pokémon vom Typ Wasser.', 'Fange [ANZAHL] Pokémon vom Typ Wasser.', 0),
(31, 'Fange ein Pokémon.', 'Fange [ANZAHL] Pokémon.', 0),
(32, 'Fange ein Taubsi oder Kramurx.', 'Fange [ANZAHL] Taubsi oder Kramurx.', 0),
(33, 'Fange ein Wablu.', 'Fange [ANZAHL] Wablu.', 0),
(34, 'Gewinne einen Arenakampf.', 'Gewinne [ANZAHL] Arenakämpfe.', 0),
(35, 'Gewinne einen Level 3 Raid oder höher.', 'Gewinne [ANZAHL] Level 3 Raids oder höher.', 0),
(36, 'Gewinne einen Raid.', 'Gewinne [ANZAHL] Raids.', 0),
(37, 'Kämpfe in einer Arena.', 'Kämpfe in [ANZAHL] Arenen.', 0),
(38, 'Kämpfe in einem Raid.', 'Kämpfe in [ANZAHL] Raids.', 0),
(39, 'Lande einen einfach fabelhaften Curveball Wurf.', 'Lande [ANZAHL] einfach fabelhafte Curveball Würfe.', 0),
(40, 'Lande einen einfach fabelhaften Wurf.', 'Lande [ANZAHL] einfach fabelhafte Würfe in Reihe.', 0),
(41, 'Lande einen großartigen Curveball Wurf.', 'Lande [ANZAHL] großartige Curveball Würfe.', 0),
(42, 'Lande einen großartigen Wurf.', 'Lande [ANZAHL] großartige Würfe.', 0),
(43, 'Lande einen guten Curveball Wurf.', 'Lande [ANZAHL] gute Curveball Würfe.', 0),
(44, 'Lande einen guten Wurf.', 'Lande [ANZAHL] gute Würfe.', 0),
(45, 'Nutze ein Power up bei einem Pokémon.', 'Nutze ein Power up bei [ANZAHL] Pokémon.', 0),
(46, 'Nutze eine supereffektive Sturmattacke in einem Arenakampf.', 'Nutze eine supereffektive Sturmattacke in [ANZAHL] Arenakämpfe.', 0),
(47, 'Verdiene ein Bonbon durch Spazieren mit deinem Kumpel.', 'Verdiene [ANZAHL] Bonbons durch Spazieren mit deinem Kumpel.', 0),
(48, 'Verschicke ein Pokémon.', 'Verschicke [ANZAHL] Pokémon.', 0),
(49, 'Lande [ANZAHL] einfach fabelhafte Würfe.', 'Lande [ANZAHL] einfach fabelhafte Würfe.', 0),
(50, 'Lande [ANZAHL] einfach fabelhaftein Reihe.', 'Lande [ANZAHL] einfach fabelhaftein Reihe.', 0),
(51, 'Lande [ANZAHL] großartige Curveball Würfe in Reihe.', 'Lande [ANZAHL] großartige Curveball Würfe in Reihe.', 0),
(52, 'Lande [ANZAHL] großartige Würfe in Reihe.', 'Lande [ANZAHL] großartige Würfe in Reihe.', 0),
(53, 'Lande [ANZAHL] gute Curveball Würfe in Reihe.', 'Lande [ANZAHL] gute Curveball Würfe in Reihe.', 0),
(54, 'Lande [ANZAHL] gute Würfe in Reihe.', 'Lande [ANZAHL] gute Würfe in Reihe.', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reward`
--

CREATE TABLE IF NOT EXISTS `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reward` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=20 ;

--
-- Daten für Tabelle `reward`
--

INSERT INTO `reward` (`id`, `reward`) VALUES
(1, 'Sternenstaub'),
(2, 'Hypertrank'),
(3, 'Top-Trank'),
(4, 'Beleber'),
(5, 'Top-Beleber'),
(6, 'Sofort-TM'),
(7, 'Lade-TM'),
(8, 'Sternenstück'),
(9, 'Glücksei'),
(10, 'Pokeball'),
(11, 'Superball'),
(12, 'Hyperball'),
(13, 'Lockmodul'),
(14, 'Himmbere'),
(15, 'Sananabeere'),
(16, 'Trank'),
(17, 'Supertrank'),
(18, 'Pokemon fangen'),
(19, 'Sonderbonbon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
