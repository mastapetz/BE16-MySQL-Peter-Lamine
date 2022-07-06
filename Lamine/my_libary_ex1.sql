CREATE Database `my_homelibary`(
    `books` varchar,
    `authors`varchar; 
)
CREATE TABLE `authors` (
 `Author_ID` int(11) DEFAULT NULL,
 `Biography` varchar(150) NOT NULL,
 `genre` int(11) NOT NULL,
 `f_name` varchar(30) NOT NULL,
 `l_name` varchar(30) NOT NULL,
 `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `books` (
 `Book_ID` int(11) NOT NULL,
 `Titel` varchar(50) DEFAULT NULL,
 `Genre` varchar(20) NOT NULL,
 `Buying_date` date NOT NULL,
 `author` varchar(50) NOT NULL,
 PRIMARY KEY (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8