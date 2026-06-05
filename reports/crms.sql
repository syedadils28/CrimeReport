-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2026 at 05:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_news`
--

CREATE TABLE `daily_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` enum('Crime Alert','Missing Person','General Notice','Wanted Criminal','Safety Tip','Station Update') NOT NULL DEFAULT 'General Notice',
  `image` varchar(255) DEFAULT NULL,
  `posted_by_id` int(11) NOT NULL,
  `posted_by_role` enum('admin','police') NOT NULL,
  `posted_by_name` varchar(100) NOT NULL,
  `station_name` varchar(150) DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `views` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` enum('General','Crime Alert','Missing Person','Notice','Update') DEFAULT 'General',
  `posted_by` int(11) NOT NULL,
  `posted_by_role` enum('admin','police') NOT NULL,
  `posted_by_name` varchar(100) NOT NULL,
  `station_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `category`, `posted_by`, `posted_by_role`, `posted_by_name`, `station_id`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'Cybercrime', 'Cybercrime incidents have been on the rise in recent months. Citizens are advised to be cautious of phishing emails, online fraud, and identity theft. Do not share OTPs, bank details, or personal information with unknown callers or websites. Report any suspicious activity to your nearest cyber cell or call the national cybercrime helpline.', '1774875093_home.jpg', 'Crime Alert', 4, 'police', 'Syed Sameer s', 1, 1, '2026-03-30 18:21:33', '2026-05-17 20:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `AdminEmail` varchar(200) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2026-03-06 14:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chargesheet`
--

CREATE TABLE `tbl_chargesheet` (
  `id` int(11) NOT NULL,
  `FIRID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PoliceID` int(11) NOT NULL,
  `ChargeSheet` text NOT NULL,
  `ChargeSheetDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_chargesheet`
--

INSERT INTO `tbl_chargesheet` (`id`, `FIRID`, `UserID`, `PoliceID`, `ChargeSheet`, `ChargeSheetDate`) VALUES
(1, 1, 1, 3, 'bbjasabjcvsdbj', '2026-03-06 14:33:48'),
(2, 1, 1, 3, 'hgfdjhvx', '2026-03-06 14:34:49'),
(3, 7, 4, 4, 'investigation is completed the person xyz has been comitted this crime further action willbe taken by us.', '2026-05-16 08:54:18'),
(4, 10, 4, 4, 'Accused fraudulently offered work-from-home data entry job with salary of ₹35,000/month. Directed victim to fake website and collected ₹5,000 via UPI as refundable security deposit. No job was provided and accused became unreachable thereafter.', '2026-05-17 15:09:45'),
(5, 9, 4, 4, 'Accused along with accomplice threatened complainant at knifepoint near Karol Bagh Metro and forcibly took Samsung Galaxy S24 mobile phone (₹80,000) and wallet containing ₹3,500 cash and Aadhaar card.', '2026-05-17 15:11:29'),
(6, 8, 4, 4, 'On 15th April 2026 at approximately 8:45 PM, accused entered Sharma General Store, Chandni Chowk with intent to rob. When owner Suresh Sharma (48) resisted, accused inflicted multiple fatal blunt force injuries to his head and neck resulting in death.', '2026-05-17 15:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_crimecategory`
--

CREATE TABLE `tbl_crimecategory` (
  `id` int(11) NOT NULL,
  `CrimeCategory` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_crimecategory`
--

INSERT INTO `tbl_crimecategory` (`id`, `CrimeCategory`, `CreationDate`) VALUES
(1, 'Robbery', '2026-03-06 14:28:04'),
(2, 'Murder', '2026-03-06 14:28:04'),
(3, 'Theft', '2026-03-06 14:28:04'),
(4, 'Drug Trafficking', '2026-03-06 14:28:04'),
(5, 'Cybercrime', '2026-03-06 14:28:04'),
(6, 'rape and murder', '2026-03-15 09:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_criminal`
--

CREATE TABLE `tbl_criminal` (
  `id` int(11) NOT NULL,
  `CriminalName` varchar(200) NOT NULL,
  `CriminalPhoto` varchar(200) DEFAULT NULL,
  `CriminalAddress` text NOT NULL,
  `CrimeCategoryID` int(11) NOT NULL,
  `PoliceStationID` int(11) NOT NULL,
  `PoliceID` int(11) NOT NULL,
  `DateOfCrime` date NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_criminal`
--

INSERT INTO `tbl_criminal` (`id`, `CriminalName`, `CriminalPhoto`, `CriminalAddress`, `CrimeCategoryID`, `PoliceStationID`, `PoliceID`, `DateOfCrime`, `CreationDate`) VALUES
(2, 'Rajesh Verma', '', '45, Kucha Mahajani, Chandni Chowk, New Delhi - 110006', 2, 1, 4, '2026-04-21', '2026-05-17 14:54:03'),
(3, 'Arjun Singh', '', '12, Ramjas Road, Karol Bagh, New Delhi - 110005', 1, 1, 4, '2026-03-11', '2026-05-17 14:58:27'),
(4, 'Mohit Sharma', '', '7, Nai Sarak, Chandni Chowk, New Delhi - 110006', 3, 1, 4, '2026-02-07', '2026-05-17 15:01:34'),
(5, 'Salim Khan', '', '23, Bara Hindu Rao, Sadar Bazaar, New Delhi - 110006', 4, 1, 4, '2026-01-29', '2026-05-17 15:03:22'),
(6, 'Vikram Yadav', '', '8, Gali Paranthe Wali, Paharganj, New Delhi - 110055', 6, 1, 4, '2026-05-13', '2026-05-17 15:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fir`
--

CREATE TABLE `tbl_fir` (
  `id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PoliceStationID` int(11) NOT NULL,
  `CrimeCategoryID` int(11) NOT NULL,
  `FIRSubject` varchar(300) NOT NULL,
  `FIRDetail` text NOT NULL,
  `FIRDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `FIRStatus` varchar(50) NOT NULL DEFAULT 'Pending' COMMENT 'Pending,Inprogress,Solved',
  `PoliceRemark` text DEFAULT NULL,
  `PoliceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_fir`
--

INSERT INTO `tbl_fir` (`id`, `UserID`, `PoliceStationID`, `CrimeCategoryID`, `FIRSubject`, `FIRDetail`, `FIRDate`, `FIRStatus`, `PoliceRemark`, `PoliceID`) VALUES
(5, 4, 1, 5, 'I later discovered that money was withdrawn from my account without my permission.', 'On 15 March 2025, around 10:30 in the morning, I received a message on my phone saying that my bank account needed verification. When I clicked the link and entered my details, I later discovered that money was withdrawn from my account without my permission. I realized that this was a cybercrime fraud. I was shocked and immediately contacted the bank and reported the incident to the cybercrime police.', '2026-03-15 08:35:22', 'Pending', NULL, NULL),
(6, 4, 1, 1, 'He forcefully took money from the cash counter and ran away quickly', 'On 15 March 2025 at about 8:00 PM, while I was walking near the market area, a man suddenly came and threatened a shopkeeper with a knife. He forcefully took money from the cash counter and ran away quickly. I witnessed the entire incident and I am 100% sure it was a robbery. I was shocked and immediately informed the police about what happened.', '2026-03-15 08:36:02', 'Inprogress', 'The avidence are against the person xyz', 4),
(7, 4, 1, 3, 'I am sure that someone stole my bicycle during the night', 'On 15 March 2025 at around 7:00 AM, when I came outside my house, I noticed that my bicycle which I had parked in front of my house was missing. I also saw that the lock was broken and thrown on the ground. I am sure that someone stole my bicycle during the night. I was shocked and immediately reported the theft to the police.', '2026-03-15 08:36:39', 'Inprogress', NULL, 4),
(8, 4, 1, 2, 'Murder of Shopkeeper During Robbery Attempt', 'On 15th April 2026, at approximately 8:45 PM, the complainant, Ramesh Kumar (neighbor), reported that the owner of a general store named Sharma General Store, located at Chandni Chowk, Central Delhi, was found dead inside his shop. The deceased, identified as Suresh Sharma, aged 48 years, had sustained multiple fatal injuries on his head and neck, apparently caused by a blunt object.', '2026-05-16 09:30:40', 'Solved', 'Based on informer tip, suspect Rajesh Verma (34 yrs, s/o Mahesh Verma, r/o Room No. 12, Anand Lodge, Paharganj) apprehended at 06:30 hrs. During search of his room, recovered: iron rod (suspected murder weapon, blood stains present), cash ₹18,500, and victim\'s mobile phone (Samsung Galaxy A15). All items seized under proper panchnama. Rajesh Verma arrested and produced before Duty Magistrate. Remanded to police custody for 5 days. Fingerprints of accused matched with those lifted from crime scene.', 5),
(9, 4, 1, 1, 'Mobile Phone Snatched at Knifepoint Near Karol Bagh Metro', 'One of the accused pulled out a sharp knife and threatened the complainant, demanding his mobile phone and wallet. Out of fear for his life, the complainant handed over his Samsung Galaxy S24 mobile phone (approximate value ₹80,000) and wallet containing 3,500 in cash and an Aadhaar card.', '2026-05-16 09:34:12', 'Inprogress', NULL, 4),
(10, 4, 1, 5, 'Online Job Fraud Money Collected on False Promise', 'The accused offered the complainant a\r\nwork-from-home data entry job with a monthly salary\r\nof 35,000. Upon showing interest, the complainant\r\nwas directed to a fake website\r\nwww.techhiresolutions-jobs.com and asked to register by paying a refundable security deposit of ₹5,000 via UPI.', '2026-05-16 09:39:40', 'Pending', '', 4),
(11, 4, 2, 4, 'Illegal Supply of Narcotics Seized Near Laxmi Nagar Metro', 'The sender\'s address was found to be fake. CCTV footage revealed the parcel was dropped by an unidentified male, approximately 30-35 years old, wearing a blue jacket and helmet. The accused fled on a black motorcycle before police arrived. The seized contraband has been sent for forensic examination.\r\n\r\nFurther investigation is in progress to trace the accused and the intended recipient.', '2026-05-16 09:45:01', 'Pending', NULL, NULL),
(12, 4, 2, 3, 'House Theft During Owner\'s Absence in Residential Colony', 'Upon returning, the complainant noticed that the main door lock of her house was broken and the house had been ransacked. On inspecting the premises, the following items were found missing:\r\n\r\nGold jewellery-150 grams (approximate value ₹9,00,000)\r\n\r\nSilver jewellery - 300 grams (approximate value ₹25,000)\r\n\r\nCash-85,000\r\n\r\nOne laptop - Dell Inspiron (approximate value ¥55,000)\r\n\r\nOne Samsung Smart TV-43 inch (approximate value 40,000)\r\n\r\nImportant documents including property papers and bank passbooks', '2026-05-16 09:48:48', 'Pending', NULL, NULL),
(13, 4, 2, 2, 'Murder Over Property Dispute Between Brothers', 'As per the complainant\'s statement, the deceased and the accused-their younger brother Manoj Kumar Verma, aged 38 years - had been engaged in a long-standing dispute over the ownership of their ancestral property located at Shakarpur, East Delhi, valued at approximately 85,00,000.', '2026-05-16 09:56:24', 'Pending', NULL, NULL),
(14, 4, 3, 5, 'Fake Customer Care Number - Banking Details Stolen', 'Believing the call to be genuine, the complainant shared the requested information. Within minutes, the complainant received SMS alerts showing the following unauthorized transactions from his account:\r\n₹49,500 — transferred to unknown UPI ID\r\n₹32,000 — online purchase on a foreign website\r\n₹18,750 — withdrawn via net banking\r\nTotal fraudulent amount: ₹1,00,250', '2026-05-16 09:59:29', 'Pending', NULL, NULL),
(15, 4, 3, 1, 'Chain Snatching Near Connaught Place', 'On 14/05/2026 at approximately 6:00 PM, I, the complainant, was walking near Connaught Place, New Delhi, when two unknown persons riding a black motorcycle (number not noted) approached from behind. One of the persons grabbed and snatched a gold chain weighing approximately 10 grams from my neck and the motorcycle fled towards Barakhamba Road at high speed. The total estimated value of the stolen gold chain is ₹45,000. I raised an alarm but the accused could not be apprehended. I request the police to register this FIR and take necessary action to recover the stolen property and arrest the accused persons.', '2026-05-16 12:20:31', 'Pending', NULL, NULL),
(16, 4, 3, 4, 'Drug Smuggling Caught at Connaught Place Market', 'On 13/05/2026 at 4:30 PM, based on a tip-off, two accused persons were found near Connaught Place Inner Circle carrying 2 kg of ganja concealed in vegetable bags. Both were detained on spot. Public witnesses present. Action requested under NDPS Act 1985.', '2026-05-16 12:24:54', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_police`
--

CREATE TABLE `tbl_police` (
  `id` int(11) NOT NULL,
  `PoliceStationID` int(11) NOT NULL,
  `PoliceID` varchar(100) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` varchar(15) NOT NULL,
  `Address` text NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Inactive,1=Active',
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_police`
--

INSERT INTO `tbl_police` (`id`, `PoliceStationID`, `PoliceID`, `Name`, `Email`, `MobileNumber`, `Address`, `Password`, `Status`, `CreationDate`) VALUES
(4, 1, 'CNTD02', 'Syed Sameer s', 'syedsameers@gmail.com', '09448927651', 'Main Road Near Bus Stand Gyarej Camp Singanamane Bhadra Reservoir Project Bhadravati Shivamogga\r\nGyarej Camp', '81dc9bdb52d04dc20036dbd8313ed055', 0, '2026-03-07 03:42:32'),
(5, 1, 'CNTD01', 'ram', 'ram234@gmail.com', '09448927651', 'Main Road Near Bus Stand Gyarej Camp Singanamane Bhadra Reservoir Project Bhadravati Shivamogga\r\nGyarej Camp', 'f925916e2754e5e03f75dd58a5733251', 0, '2026-03-27 14:27:21'),
(6, 1, 'CNTD03', 'Khazi Atifulla', 'khaziatifulla@gmail.com', '9606200528', 'Main Road Near Bus Stand Gyarej Camp Singanamane Bhadra Reservoir Project Bhadravati Shivamogga\r\nGyarej Camp', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2026-05-18 06:17:52'),
(7, 3, 'RCND001', 'Syed Sameer s', 'syedsameers2007@gmail.com', '09448927651', 'Main Road Near Bus Stand Gyarej Camp Singanamane Bhadra Reservoir Project Bhadravati Shivamogga\r\nGyarej Camp', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2026-06-03 12:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_policestation`
--

CREATE TABLE `tbl_policestation` (
  `id` int(11) NOT NULL,
  `PoliceStationName` varchar(200) NOT NULL,
  `PoliceStationCode` varchar(100) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_policestation`
--

INSERT INTO `tbl_policestation` (`id`, `PoliceStationName`, `PoliceStationCode`, `CreationDate`) VALUES
(1, 'Central Delhi Police Stations', 'CDP502', '2026-03-06 14:28:04'),
(2, 'Laxmi Nagar East Delhi Police Stations', 'LND09', '2026-03-06 14:28:04'),
(3, 'Rajeev Chowk Police Station New Delhi', 'RCPSD212', '2026-03-06 14:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `MobileNumber` varchar(15) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Inactive,1=Active',
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `FullName`, `Email`, `MobileNumber`, `Password`, `Status`, `RegistrationDate`) VALUES
(4, 'syedsameers', 'sameer1234@gmail.com', '9448927651', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2026-03-15 07:39:54'),
(5, 'umar', 'syedsameers2007@gmail.com', '09448927651', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2026-06-04 15:46:25'),
(6, 'Syed Sameer s', 'syedsameers@gmail.com', '09448927651', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2026-06-05 15:05:59'),
(7, 'syedadils', 'syedadils280404@gmail.com', '1234567890', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2026-06-05 15:17:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily_news`
--
ALTER TABLE `daily_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_news_active` (`is_active`),
  ADD KEY `idx_news_created` (`created_at`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_chargesheet`
--
ALTER TABLE `tbl_chargesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_crimecategory`
--
ALTER TABLE `tbl_crimecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_criminal`
--
ALTER TABLE `tbl_criminal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fir`
--
ALTER TABLE `tbl_fir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_police`
--
ALTER TABLE `tbl_police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_policestation`
--
ALTER TABLE `tbl_policestation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_news`
--
ALTER TABLE `daily_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_chargesheet`
--
ALTER TABLE `tbl_chargesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_crimecategory`
--
ALTER TABLE `tbl_crimecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_criminal`
--
ALTER TABLE `tbl_criminal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_fir`
--
ALTER TABLE `tbl_fir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_police`
--
ALTER TABLE `tbl_police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_policestation`
--
ALTER TABLE `tbl_policestation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
