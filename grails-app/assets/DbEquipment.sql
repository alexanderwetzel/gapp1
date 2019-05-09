--
--
--
-- Host: localhost
-- Generation Time: May 08, 2019 at 01:26 PM
-- Server version: 10.1.37-MariaDB
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DbEquipment`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `element_type` varchar(255) NOT NULL,
  `designationen` varchar(255) NOT NULL,
  `element_filename` varchar(255) NOT NULL,
  `designationde` varchar(255) NOT NULL,
  `element_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `version`, `element_type`, `designationen`, `element_filename`, `designationde`, `element_path`) VALUES
(1, 6, '2', 'equi oneeee', 'equi 1', 'equi eins', 'unknownaaa'),
(3, 0, '2', 'equi two', 'equi 2', 'equi zwei', 'unkmown uu');

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `parameter_name` varchar(255) NOT NULL,
  `parameter_group` varchar(255) NOT NULL,
  `parameter_unit` varchar(255) NOT NULL,
  `parameter_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id`, `version`, `parameter_name`, `parameter_group`, `parameter_unit`, `parameter_value`) VALUES
(1, 0, 'Wasser', 'Wasser', 'bar', '10'),
(2, 0, 'Strom', 'Strom', 'V', '220'),
(3, 0, 'Gas', 'Gas', '5', 'bar'),
(4, 0, 'Luft', 'Luft', 'bar', '10');

-- --------------------------------------------------------

--
-- Table structure for table `parameter_equipment`
--

CREATE TABLE `parameter_equipment` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `equipment_id` bigint(20) NOT NULL,
  `parameter_group` varchar(255) NOT NULL,
  `parameter_id` bigint(20) NOT NULL,
  `parameter_unit` varchar(255) NOT NULL,
  `parameter_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Dumping data for table `parameter_equipment`
--

INSERT INTO `parameter_equipment` (`id`, `version`, `equipment_id`, `parameter_group`, `parameter_id`, `parameter_unit`, `parameter_value`) VALUES
(1, 0, 3, 'Gas', 3, '5', 'bar'),
(2, 0, 3, 'Strome', 2, 'Ve', '220e'),
(3, 0, 3, 'Lufte', 4, 'bare', '10e'),
(4, 0, 1, 'Wasser', 1, 'bar', '10'),
(5, 0, 1, 'Strom', 2, 'V', '220');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parameter_equipment`
--
ALTER TABLE `parameter_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf47tgkcdpdixqkmy7vehb8oim` (`equipment_id`),
  ADD KEY `FKb8v80ksiotm3w6dprteqw85xv` (`parameter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parameter_equipment`
--
ALTER TABLE `parameter_equipment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parameter_equipment`
--
ALTER TABLE `parameter_equipment`
  ADD CONSTRAINT `FKb8v80ksiotm3w6dprteqw85xv` FOREIGN KEY (`parameter_id`) REFERENCES `parameter` (`id`),
  ADD CONSTRAINT `FKf47tgkcdpdixqkmy7vehb8oim` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
