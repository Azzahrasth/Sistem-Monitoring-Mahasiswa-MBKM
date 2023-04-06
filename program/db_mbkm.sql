/*
Navicat MySQL Data Transfer

Source Server         : LATIHAN
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_mbkm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-06-03 14:59:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dosen`
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('1', '920200419941231201', 'Andini Setya Arianti, S.D');
INSERT INTO `dosen` VALUES ('2', '920200419930811201', 'Ani Anisyah, S.Pd., M.T.');
INSERT INTO `dosen` VALUES ('3', '197112232006041001', 'Dr. Asep Wahyudin, M.T.');
INSERT INTO `dosen` VALUES ('4', '197607102010121002', 'Budi Laksono Putro, M.T.');
INSERT INTO `dosen` VALUES ('5', '197505152008011014', 'Eddy Prasetyo Nugroho, M.');
INSERT INTO `dosen` VALUES ('6', '196402141990031003', 'Drs. H. Eka Fitrajaya Rahman');
INSERT INTO `dosen` VALUES ('7', '920171219850822101', 'Eki Nugraha, M.Kom.');
INSERT INTO `dosen` VALUES ('8', '196711211991011001', 'Dr. H. Enjang Ali Nurdin,');
INSERT INTO `dosen` VALUES ('9', '196711211991011001', 'Enjun Junaeti, M.Si.');
INSERT INTO `dosen` VALUES ('10', '198607082018031001', 'Erlangga, MT');
INSERT INTO `dosen` VALUES ('11', '920171219890224201', 'Erna Piantari, S.Kom., M.');
INSERT INTO `dosen` VALUES ('12', '198008102009121003', 'Harsa Wara Prabawa, S.Si.');
INSERT INTO `dosen` VALUES ('13', '197005022008121001', 'Herbert Siregar, M.T.');
INSERT INTO `dosen` VALUES ('14', '195607141984031002', 'Drs. H. Heri Sutarno, M.T');
INSERT INTO `dosen` VALUES ('15', '197506012008121001', 'Jajang Kusnendar, M.T.');
INSERT INTO `dosen` VALUES ('16', '197809262008121001', 'Lala Septem Riza, Ph.D.');
INSERT INTO `dosen` VALUES ('17', '197909292006041002', 'Dr. Muhammad Nursalman, M');
INSERT INTO `dosen` VALUES ('18', '196603252001121001', 'Prof. Dr. Munir, M.IT.');
INSERT INTO `dosen` VALUES ('19', '920200419891122201', 'Nusuki Syariati Fathimah,');
INSERT INTO `dosen` VALUES ('20', '198705242014042002', 'Dr. Rani Megasari, M.T.');
INSERT INTO `dosen` VALUES ('21', '197711252006041002', 'Rizky Rahman J., M.Kom.');
INSERT INTO `dosen` VALUES ('22', '198109182009122003', 'Rosa Ariani Sukamto, M.T.');
INSERT INTO `dosen` VALUES ('23', '197304242008121001', 'Dr. Wahyudin, M.T.');
INSERT INTO `dosen` VALUES ('24', '196601011991031005', 'Prof. Dr. H. Wawan Setiaw');
INSERT INTO `dosen` VALUES ('25', '198903252015041001', 'Yaya Wihardi, M.Kom.');
INSERT INTO `dosen` VALUES ('26', '199005302019031013', 'Yudi Ahmad Hambali, MT');
INSERT INTO `dosen` VALUES ('27', '197507072003121003', 'Dr. Yudi Wibisono, M.T.');
INSERT INTO `dosen` VALUES ('28', '197407252006041002', 'Rasim, M.T.');

-- ----------------------------
-- Table structure for `konversi_mk`
-- ----------------------------
DROP TABLE IF EXISTS `konversi_mk`;
CREATE TABLE `konversi_mk` (
  `id_konversi_mk` int(11) NOT NULL AUTO_INCREMENT,
  `id_mhs` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `status_acc` varchar(255) NOT NULL DEFAULT 'Belum diacc',
  PRIMARY KEY (`id_konversi_mk`),
  KEY `id_mhs3` (`id_mhs`),
  KEY `id_matkul3` (`id_matkul`),
  CONSTRAINT `id_matkul3` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_mhs3` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id_mhs`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of konversi_mk
-- ----------------------------
INSERT INTO `konversi_mk` VALUES ('2', '26', '5', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('5', '26', '14', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('8', '26', '31', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('9', '26', '63', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('10', '26', '52', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('11', '1', '31', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('12', '1', '63', 'Belum diacc');
INSERT INTO `konversi_mk` VALUES ('16', '18', '31', 'Sudah diacc');
INSERT INTO `konversi_mk` VALUES ('18', '18', '56', 'Sudah diacc');
INSERT INTO `konversi_mk` VALUES ('20', '34', '39', 'Sudah diacc');

-- ----------------------------
-- Table structure for `mata_kuliah`
-- ----------------------------
DROP TABLE IF EXISTS `mata_kuliah`;
CREATE TABLE `mata_kuliah` (
  `id_matkul` int(11) NOT NULL AUTO_INCREMENT,
  `kode_matkul` varchar(10) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `sks` int(1) NOT NULL,
  `semester_mk` int(1) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  PRIMARY KEY (`id_matkul`),
  KEY `id_dosen5` (`id_dosen`),
  CONSTRAINT `id_dosen5` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mata_kuliah
-- ----------------------------
INSERT INTO `mata_kuliah` VALUES ('1', 'IK501', 'Pengujian dan Pemeliharaan', '2', '6', '6');
INSERT INTO `mata_kuliah` VALUES ('2', 'IK511', 'Rekayasa Aplikasi Kemarit', '2', '5', '20');
INSERT INTO `mata_kuliah` VALUES ('3', 'IK521', 'Service Computing Enginee', '2', '4', '26');
INSERT INTO `mata_kuliah` VALUES ('4', 'IK531', 'Game Application Developm', '2', '5', '8');
INSERT INTO `mata_kuliah` VALUES ('5', 'IK541', 'Teknik Interfacing', '3', '4', '22');
INSERT INTO `mata_kuliah` VALUES ('6', 'IK551', 'Manajemen Kualitas Perang', '3', '4', '5');
INSERT INTO `mata_kuliah` VALUES ('7', 'IK561', 'Rekayasa Aplikasi Bisnis', '2', '4', '18');
INSERT INTO `mata_kuliah` VALUES ('8', 'IK571', 'Rekayasa Informasi', '3', '5', '12');
INSERT INTO `mata_kuliah` VALUES ('9', 'IK581', 'Software Quality Assuranc', '2', '6', '6');
INSERT INTO `mata_kuliah` VALUES ('10', 'IK591', 'Teknik Kompilasi', '3', '6', '8');
INSERT INTO `mata_kuliah` VALUES ('11', 'IK502', 'Pengolahan Citra Digital', '2', '4', '16');
INSERT INTO `mata_kuliah` VALUES ('12', 'IK512', 'Intelligent Games', '2', '5', '9');
INSERT INTO `mata_kuliah` VALUES ('13', 'IK522', 'Pengolahan Bahasa Alami', '2', '5', '4');
INSERT INTO `mata_kuliah` VALUES ('14', 'IK532', 'Deep Learning', '3', '4', '6');
INSERT INTO `mata_kuliah` VALUES ('15', 'IK542', 'Computer Vision', '2', '4', '5');
INSERT INTO `mata_kuliah` VALUES ('16', 'IK552', 'Internet of Things', '2', '5', '28');
INSERT INTO `mata_kuliah` VALUES ('17', 'IK562', 'Kontrol dan Robotika', '3', '5', '11');
INSERT INTO `mata_kuliah` VALUES ('18', 'IK572', 'Expert System', '3', '5', '12');
INSERT INTO `mata_kuliah` VALUES ('19', 'IK582', 'Speech Recognition and Sy', '3', '4', '2');
INSERT INTO `mata_kuliah` VALUES ('20', 'IK340', 'Sistem Cerdas', '2', '5', '23');
INSERT INTO `mata_kuliah` VALUES ('21', 'IK503', 'Teknik Audio dan Video', '2', '4', '25');
INSERT INTO `mata_kuliah` VALUES ('22', 'IK513', 'Game Programming', '2', '6', '23');
INSERT INTO `mata_kuliah` VALUES ('23', 'IK523', 'Visual Communication Desi', '2', '4', '12');
INSERT INTO `mata_kuliah` VALUES ('24', 'IK533', 'Audio and Video Manipulat', '2', '6', '17');
INSERT INTO `mata_kuliah` VALUES ('25', 'IK543', 'Multimedia Production', '3', '6', '3');
INSERT INTO `mata_kuliah` VALUES ('26', 'IK553', 'Sosial dan Inovasi Media', '2', '5', '27');
INSERT INTO `mata_kuliah` VALUES ('27', 'IK563', 'Teknik Animasi', '3', '5', '16');
INSERT INTO `mata_kuliah` VALUES ('28', 'IK573', 'Open Distance Learning', '3', '5', '8');
INSERT INTO `mata_kuliah` VALUES ('29', 'IK504', 'Mobile Networking', '2', '5', '7');
INSERT INTO `mata_kuliah` VALUES ('30', 'IK514', 'Teknologi Cloud', '2', '4', '18');
INSERT INTO `mata_kuliah` VALUES ('31', 'IK524', 'Administrasi Jaringan', '2', '5', '1');
INSERT INTO `mata_kuliah` VALUES ('32', 'IK534', 'Teknologi Nirkabel', '3', '6', '25');
INSERT INTO `mata_kuliah` VALUES ('33', 'IK544', 'Komputer Forensik', '2', '4', '5');
INSERT INTO `mata_kuliah` VALUES ('34', 'IK554', 'Desain Jaringan Telekomun', '2', '5', '9');
INSERT INTO `mata_kuliah` VALUES ('35', 'IK564', 'Keamanan Sistem Informasi', '3', '5', '23');
INSERT INTO `mata_kuliah` VALUES ('36', 'IK574', 'Jaringan Komputer Lanjut', '3', '4', '23');
INSERT INTO `mata_kuliah` VALUES ('37', 'IK515', 'Computational Statistics', '2', '4', '27');
INSERT INTO `mata_kuliah` VALUES ('38', 'IK525', 'Sistem Pendukung Keputusa', '3', '4', '14');
INSERT INTO `mata_kuliah` VALUES ('39', 'IK535', 'Data Visualization', '2', '4', '28');
INSERT INTO `mata_kuliah` VALUES ('40', 'IK555', 'Data Analysis', '2', '4', '26');
INSERT INTO `mata_kuliah` VALUES ('41', 'IK565', 'Time Series Data Analysis', '2', '4', '13');
INSERT INTO `mata_kuliah` VALUES ('42', 'IK575', 'Data Management', '2', '6', '13');
INSERT INTO `mata_kuliah` VALUES ('43', 'IK585', 'Financial Technology', '3', '4', '9');
INSERT INTO `mata_kuliah` VALUES ('44', 'IK370', 'Teknik Simulasi dan Pemod', '2', '6', '17');
INSERT INTO `mata_kuliah` VALUES ('45', 'IK506', 'Perencanaan Strategik Sis', '3', '6', '15');
INSERT INTO `mata_kuliah` VALUES ('46', 'IK516', 'Arsitektur dan Integrasi ', '2', '5', '2');
INSERT INTO `mata_kuliah` VALUES ('47', 'IK526', 'Sistem Informasi Akuntans', '2', '6', '27');
INSERT INTO `mata_kuliah` VALUES ('48', 'IK536', 'Sistem Informasi Pendidik', '3', '4', '23');
INSERT INTO `mata_kuliah` VALUES ('49', 'IK546', 'Audit Sistem Informasi', '2', '4', '1');
INSERT INTO `mata_kuliah` VALUES ('50', 'IK556', 'IT Infrastructure and Eme', '2', '4', '26');
INSERT INTO `mata_kuliah` VALUES ('51', 'IK566', 'Business Intelligence', '2', '4', '16');
INSERT INTO `mata_kuliah` VALUES ('52', 'IK576', 'Aplikasi Sistem Fungsi Bi', '2', '5', '21');
INSERT INTO `mata_kuliah` VALUES ('53', 'IK586', 'Sistem Informasi Geografi', '3', '5', '25');
INSERT INTO `mata_kuliah` VALUES ('54', 'KU108', 'Pendidikan Jasmani dan Ol', '2', '4', '12');
INSERT INTO `mata_kuliah` VALUES ('55', 'KU400', 'Kuliah Kerja Nyata', '2', '6', '6');
INSERT INTO `mata_kuliah` VALUES ('56', 'IK120', 'Paradigma Pemrograman', '2', '6', '1');
INSERT INTO `mata_kuliah` VALUES ('57', 'IK227', 'Teknik Riset Operasi', '2', '4', '11');
INSERT INTO `mata_kuliah` VALUES ('58', 'IK190', 'Etika Profesi Teknologi I', '2', '4', '13');
INSERT INTO `mata_kuliah` VALUES ('59', 'IK140', 'Bahasa Inggris', '2', '6', '23');
INSERT INTO `mata_kuliah` VALUES ('60', 'IK150', 'Statistika', '2', '5', '23');
INSERT INTO `mata_kuliah` VALUES ('61', 'IK430', 'E-Business', '2', '6', '1');
INSERT INTO `mata_kuliah` VALUES ('62', 'IK420', 'Seminar', '2', '6', '20');
INSERT INTO `mata_kuliah` VALUES ('63', 'IK180', 'Aljabar Linier dan Matrik', '2', '4', '5');
INSERT INTO `mata_kuliah` VALUES ('64', 'IK210', 'Metode Numerik', '2', '4', '7');
INSERT INTO `mata_kuliah` VALUES ('65', 'IK410', 'Kewirausahaan Ilmu Komput', '2', '5', '15');
INSERT INTO `mata_kuliah` VALUES ('66', 'IK360', 'Kapita Selekta', '2', '5', '27');
INSERT INTO `mata_kuliah` VALUES ('67', 'IK590', 'MATA KULIAH PPL - KM UPI ', '4', '4', '24');
INSERT INTO `mata_kuliah` VALUES ('68', 'IK530', 'Mobile Application Develo', '3', '4', '25');
INSERT INTO `mata_kuliah` VALUES ('69', 'IK350', 'Interaksi Manusia dan Kom', '3', '4', '27');
INSERT INTO `mata_kuliah` VALUES ('70', 'IK510', 'Komputasi Paralel dan Ter', '3', '6', '24');
INSERT INTO `mata_kuliah` VALUES ('71', 'IK380', 'Basis Data Non Relational', '2', '5', '10');
INSERT INTO `mata_kuliah` VALUES ('72', 'IK330', 'Manajemen Proyek Perangka', '3', '4', '27');
INSERT INTO `mata_kuliah` VALUES ('73', 'IK520', 'Project Keahlian', '3', '4', '5');

-- ----------------------------
-- Table structure for `mengikuti`
-- ----------------------------
DROP TABLE IF EXISTS `mengikuti`;
CREATE TABLE `mengikuti` (
  `id_mengikuti` int(11) NOT NULL AUTO_INCREMENT,
  `id_program` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `status_lolos` varchar(20) NOT NULL DEFAULT 'Belum Lolos',
  `file_pendaftaran` varchar(25) NOT NULL,
  `file_lolos` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_mengikuti`),
  KEY `id_program5` (`id_program`),
  KEY `id_mhs5` (`id_mhs`),
  CONSTRAINT `id_mhs5` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id_mhs`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_program5` FOREIGN KEY (`id_program`) REFERENCES `program` (`id_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mengikuti
-- ----------------------------
INSERT INTO `mengikuti` VALUES ('1', '1', '26', '2020', 'Sudah Lolos', 'a.exe', 'c.exe');
INSERT INTO `mengikuti` VALUES ('4', '1', '1', '2020', 'Sudah Lolos', 'b.exe', 'd.exe');
INSERT INTO `mengikuti` VALUES ('6', '12', '8', '2022', 'Sudah Lolos', 'Modul 10 - Fungsi.pdf', 'Modul1 - Pengenalan Varia');
INSERT INTO `mengikuti` VALUES ('9', '9', '18', '2022', 'Sudah Lolos', 'kuis 2 grostr21.pdf', 'kuis 2 grostr21.pdf');
INSERT INTO `mengikuti` VALUES ('11', '11', '34', '2022', 'Sudah Lolos', 'kuis 2 grostr21.pdf', 'kuis 3 string.pdf');

-- ----------------------------
-- Table structure for `mhs`
-- ----------------------------
DROP TABLE IF EXISTS `mhs`;
CREATE TABLE `mhs` (
  `id_mhs` int(11) NOT NULL AUTO_INCREMENT,
  `nim` int(11) NOT NULL,
  `nama_mhs` varchar(25) NOT NULL,
  `semester` int(1) NOT NULL,
  `jumlah_sks` int(2) NOT NULL,
  `status_mbkm` varchar(25) NOT NULL DEFAULT 'Tidak mengikuti',
  `id_pm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mhs`),
  KEY `id_pm2` (`id_pm`),
  CONSTRAINT `id_pm2` FOREIGN KEY (`id_pm`) REFERENCES `pm` (`id_pm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mhs
-- ----------------------------
INSERT INTO `mhs` VALUES ('1', '2108061', 'Achmad Fauzan', '5', '0', 'Progres', '2');
INSERT INTO `mhs` VALUES ('2', '2105673', 'Alghaniyu Naufal Hamid', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('3', '2101147', 'Amida Zulfa Laila', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('4', '2101114', 'Anandita Kusumah Mulyadi', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('5', '2102671', 'Anderfa Jalu Kawani', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('6', '2102585', 'Apri Anggara Yudha', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('7', '2102268', 'Audry Leonardo Loo', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('8', '2100901', 'Azzahra Siti Hadjar', '4', '0', 'Progres', '1');
INSERT INTO `mhs` VALUES ('9', '2103727', 'Cantika Putri Arbiliansya', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('10', '2100195', 'Davin Fausta Putra Sanjay', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('11', '2105879', 'Farhan Muzhaffar Tiras Pu', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('12', '2103703', 'Fauziyyah Zayyan Nur', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('13', '2105927', 'Febry Syaman Hasan', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('14', '2102292', 'Harold Vidian Exaudi Sima', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('15', '2108077', 'Hestina Dwi Hartiwi', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('16', '2103507', 'Indah Resti Fauzi', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('17', '2102421', 'Kania Dinda Fasya', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('18', '2100991', 'Khana Yusdiana', '6', '0', 'Progres', '1');
INSERT INTO `mhs` VALUES ('19', '2108804', 'Laelatusya\'diyah', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('20', '2102204', 'Mohamad Asyqari Anugrah', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('21', '2100137', 'Muhamad Nur Yasin Amadudi', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('22', '2102665', 'Muhammad Cahyana Bintang ', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('23', '2108927', 'Muhammad Fahru Rozi', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('24', '2105997', 'Muhammad Fakhri Fadhlurra', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('25', '2100187', 'Muhammad Hilmy Rasyad Sof', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('26', '2102313', 'Muhammad Kamal Robbani', '5', '0', 'Sedang', '1');
INSERT INTO `mhs` VALUES ('27', '2100192', 'Muhammad Rayhan Nur', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('28', '2102843', 'Najma Qalbi Dwiharani', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('29', '2105885', 'Qurrotu\' Ainii', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('30', '2108938', 'Rafi Arsalan', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('31', '2100846', 'Rafly Putra Santoso', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('32', '2105745', 'Ridwan Albana', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('33', '2101103', 'Rifqi Fajar Indrayani', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('34', '2106000', 'Sabila Rosad', '4', '2', 'Progres', '28');
INSERT INTO `mhs` VALUES ('35', '2108067', 'Villeneuve Andhira Suwand', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('36', '2102159', 'Virza Raihan Kurniawan', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('37', '2103207', 'Yasmin Fathanah Zakiyyah', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('38', '2102545', 'Zahra Fitria Maharani', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('39', '2108799', 'Ade Mulyana', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('40', '2101310', 'Akmal Zulkifli', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('41', '2107377', 'Alif Faturahman Firdaus', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('42', '2100702', 'Ananda Myzza Marhelio', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('43', '2103551', 'Ardyn Rezky Fahreza', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('44', '2101990', 'Ayesha Ali Firdaus', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('45', '2105899', 'Azzahra Alika Putri Yudha', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('46', '2102296', 'Azzahra Fahriza Fitriani', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('47', '2106836', 'Bayu Wicaksono', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('48', '2100506', 'Destira Lestari Saraswati', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('49', '2103842', 'Dicki Fathurohman', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('50', '2108805', 'Elsa Nabiilah', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('51', '2106515', 'Fachri Najm Noer Kartiman', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('52', '2101294', 'Fikry Idham Dwiyana', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('53', '2101769', 'Ibnu Adeng Kurnia', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('54', '2103303', 'Ihsan Ghozi Zulfikar', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('55', '2103949', 'Jovian Einstain Pratama H', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('56', '2109276', 'M Salman Kesuma', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('57', '2102165', 'Mia Karisma Haq', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('58', '2106416', 'Mochamad Khaairi', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('59', '2101989', 'Mohammad Labib Husain', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('60', '2101995', 'Muhamad Firdaus', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('61', '2101677', 'Muhammad Alam Basalamah', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('62', '2100812', 'Muhammad Azka Atqiya', '4', '21', 'Sedang', null);
INSERT INTO `mhs` VALUES ('63', '2100543', 'Muhammad Daffa Yusuf Fadh', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('64', '2100543', 'Muhammad Fadhillah Nursya', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('65', '2106923', 'Muhammad Fadlan Ghafur', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('66', '2107264', 'Muhammad Fikri Kafilli', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('67', '2107922', 'Muhammad Rizki', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('68', '2107980', 'Muhammad Yusuf Bahtiar', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('69', '2106413', 'Nadhief Athallah Isya', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('70', '2106791', 'Rachman Faiz Maulana', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('71', '2106238', 'Raisyad Jullfikar', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('72', '2101963', 'Rasyid Andriansyah', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('73', '2108724', 'Ravindra Maulana Sahman', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('74', '2109103', 'Riska Nurohmah', '5', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('75', '2102746', 'Shandy Nuary Dwilata', '4', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('76', '2101330', 'Talitha Syahla', '6', '0', 'Progres', null);
INSERT INTO `mhs` VALUES ('77', '2106330', 'Wildan Mauli Darojat', '4', '0', 'Progres', null);

-- ----------------------------
-- Table structure for `pm`
-- ----------------------------
DROP TABLE IF EXISTS `pm`;
CREATE TABLE `pm` (
  `id_pm` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah_mhs_mbkm` int(11) NOT NULL DEFAULT 0,
  `id_dosen` int(11) NOT NULL,
  PRIMARY KEY (`id_pm`),
  KEY `id_dosen3` (`id_dosen`),
  CONSTRAINT `id_dosen3` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pm
-- ----------------------------
INSERT INTO `pm` VALUES ('1', '4', '1');
INSERT INTO `pm` VALUES ('2', '2', '2');
INSERT INTO `pm` VALUES ('3', '0', '3');
INSERT INTO `pm` VALUES ('4', '0', '4');
INSERT INTO `pm` VALUES ('5', '0', '5');
INSERT INTO `pm` VALUES ('6', '0', '6');
INSERT INTO `pm` VALUES ('7', '0', '7');
INSERT INTO `pm` VALUES ('8', '0', '8');
INSERT INTO `pm` VALUES ('9', '0', '9');
INSERT INTO `pm` VALUES ('10', '0', '10');
INSERT INTO `pm` VALUES ('11', '0', '11');
INSERT INTO `pm` VALUES ('12', '0', '12');
INSERT INTO `pm` VALUES ('13', '0', '13');
INSERT INTO `pm` VALUES ('14', '0', '14');
INSERT INTO `pm` VALUES ('15', '0', '15');
INSERT INTO `pm` VALUES ('16', '0', '16');
INSERT INTO `pm` VALUES ('17', '0', '17');
INSERT INTO `pm` VALUES ('18', '0', '18');
INSERT INTO `pm` VALUES ('19', '0', '19');
INSERT INTO `pm` VALUES ('20', '0', '20');
INSERT INTO `pm` VALUES ('21', '0', '21');
INSERT INTO `pm` VALUES ('22', '0', '22');
INSERT INTO `pm` VALUES ('23', '0', '23');
INSERT INTO `pm` VALUES ('24', '0', '24');
INSERT INTO `pm` VALUES ('25', '0', '25');
INSERT INTO `pm` VALUES ('26', '0', '26');
INSERT INTO `pm` VALUES ('27', '0', '27');
INSERT INTO `pm` VALUES ('28', '2', '28');

-- ----------------------------
-- Table structure for `program`
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `nama_program` varchar(25) NOT NULL,
  `jumlah_koversi_sks` int(2) NOT NULL,
  PRIMARY KEY (`id_program`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of program
-- ----------------------------
INSERT INTO `program` VALUES ('1', 'Bangkit by Google, Goto, ', '20');
INSERT INTO `program` VALUES ('2', 'Indonesian International ', '20');
INSERT INTO `program` VALUES ('3', 'Kampus Mengajar', '20');
INSERT INTO `program` VALUES ('4', 'Riset atau Penelitian', '40');
INSERT INTO `program` VALUES ('5', 'Studi Independen', '40');
INSERT INTO `program` VALUES ('6', 'Wirausaha', '40');
INSERT INTO `program` VALUES ('7', 'Pejuang Muda Kampus Merde', '20');
INSERT INTO `program` VALUES ('8', 'Pertukaran Mahasiswa Merd', '40');
INSERT INTO `program` VALUES ('9', 'Proyek Kemanusiaan', '40');
INSERT INTO `program` VALUES ('10', 'Kementerian ESDM - GERILY', '20');
INSERT INTO `program` VALUES ('11', 'Magang', '20');
INSERT INTO `program` VALUES ('12', 'Membangu Desa (KKN)', '40');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(15) NOT NULL,
  `id_mhs` int(11) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_dosen7` (`id_dosen`),
  KEY `id_mhs7` (`id_mhs`),
  CONSTRAINT `id_dosen7` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_mhs7` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id_mhs`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'achmadfauzan@upi.edu', '2108061A', 'mahasiswa', '1', null);
INSERT INTO `user` VALUES ('2', 'alghaniyunaufalhamid@upi.edu', '2105673A', 'mahasiswa', '2', null);
INSERT INTO `user` VALUES ('3', 'amidazulfalaila@upi.edu', '2101147A', 'mahasiswa', '3', null);
INSERT INTO `user` VALUES ('4', 'ananditakusumahmulyadi@upi.edu', '2101114A', 'mahasiswa', '4', null);
INSERT INTO `user` VALUES ('5', 'anderfajalukawani@upi.edu', '2102671A', 'mahasiswa', '5', null);
INSERT INTO `user` VALUES ('6', 'aprianggarayudha@upi.edu', '2102585A', 'mahasiswa', '6', null);
INSERT INTO `user` VALUES ('7', 'audryleonardoloo@upi.edu', '2102268A', 'mahasiswa', '7', null);
INSERT INTO `user` VALUES ('8', 'azzahrasitihadjar@upi.edu', '2100901A', 'mahasiswa', '8', null);
INSERT INTO `user` VALUES ('9', 'cantikaputriarbiliansyah@upi.edu', '2103727A', 'mahasiswa', '9', null);
INSERT INTO `user` VALUES ('10', 'davinfaustaputrasanjaya@upi.edu', '2100195A', 'mahasiswa', '10', null);
INSERT INTO `user` VALUES ('11', 'farhanmuzhaffartirasputra@upi.edu', '2105879A', 'mahasiswa', '11', null);
INSERT INTO `user` VALUES ('12', 'fauziyyahzayyannur@upi.edu', '2103703A', 'mahasiswa', '12', null);
INSERT INTO `user` VALUES ('13', 'febrysyamanhasan@upi.edu', '2105927A', 'mahasiswa', '13', null);
INSERT INTO `user` VALUES ('14', 'haroldvidianexaudisimarmata@upi.edu', '2102292A', 'mahasiswa', '14', null);
INSERT INTO `user` VALUES ('15', 'hestinadwihartiwi@upi.edu', '2108077A', 'mahasiswa', '15', null);
INSERT INTO `user` VALUES ('16', 'indahrestifauzi@upi.edu', '2103507A', 'mahasiswa', '16', null);
INSERT INTO `user` VALUES ('17', 'kaniadindafasya@upi.edu', '2102421A', 'mahasiswa', '17', null);
INSERT INTO `user` VALUES ('18', 'khanayusdiana@upi.edu', '2100991A', 'mahasiswa', '18', null);
INSERT INTO `user` VALUES ('19', 'laelatusyadiyah@upi.edu', '2108804A', 'mahasiswa', '19', null);
INSERT INTO `user` VALUES ('20', 'mohamadasyqarianugrah@upi.edu', '2102204A', 'mahasiswa', '20', null);
INSERT INTO `user` VALUES ('21', 'muhamadnuryasinamadudin@upi.edu', '2100137A', 'mahasiswa', '21', null);
INSERT INTO `user` VALUES ('22', 'muhammadcahyanabintangfajar@upi.edu', '2102665A', 'mahasiswa', '22', null);
INSERT INTO `user` VALUES ('23', 'muhammadfahrurozi@upi.edu', '2108927A', 'mahasiswa', '23', null);
INSERT INTO `user` VALUES ('24', 'muhammadfakhrifadhlurrahman@upi.edu', '2105997A', 'mahasiswa', '24', null);
INSERT INTO `user` VALUES ('25', 'muhammadhilmyrasyadsofyan@upi.edu', '2100187A', 'mahasiswa', '25', null);
INSERT INTO `user` VALUES ('26', 'muhammadkamalrobbani@upi.edu', '2102313A', 'mahasiswa', '26', null);
INSERT INTO `user` VALUES ('27', 'muhammadrayhannur@upi.edu', '2100192A', 'mahasiswa', '27', null);
INSERT INTO `user` VALUES ('28', 'najmaqalbidwiharani@upi.edu', '2102843A', 'mahasiswa', '28', null);
INSERT INTO `user` VALUES ('29', 'qurrotuainii@upi.edu', '2105885A', 'mahasiswa', '29', null);
INSERT INTO `user` VALUES ('30', 'rafiarsalan@upi.edu', '2108938A', 'mahasiswa', '30', null);
INSERT INTO `user` VALUES ('31', 'raflyputrasantoso@upi.edu', '2100846A', 'mahasiswa', '31', null);
INSERT INTO `user` VALUES ('32', 'ridwanalbana@upi.edu', '2105745A', 'mahasiswa', '32', null);
INSERT INTO `user` VALUES ('33', 'rifqifajarindrayani@upi.edu', '2101103A', 'mahasiswa', '33', null);
INSERT INTO `user` VALUES ('34', 'sabilarosad@upi.edu', '2106000A', 'mahasiswa', '34', null);
INSERT INTO `user` VALUES ('35', 'villeneuveandhirasuwandhi@upi.edu', '2108067A', 'mahasiswa', '35', null);
INSERT INTO `user` VALUES ('36', 'virzaraihankurniawan@upi.edu', '2102159A', 'mahasiswa', '36', null);
INSERT INTO `user` VALUES ('37', 'yasminfathanahzakiyyah@upi.edu', '2103207A', 'mahasiswa', '37', null);
INSERT INTO `user` VALUES ('38', 'zahrafitriamaharani@upi.edu', '2102545A', 'mahasiswa', '38', null);
INSERT INTO `user` VALUES ('39', 'ademulyana@upi.edu', '2108799A', 'mahasiswa', '39', null);
INSERT INTO `user` VALUES ('40', 'akmalzulkifli@upi.edu', '2101310A', 'mahasiswa', '40', null);
INSERT INTO `user` VALUES ('41', 'aliffaturahmanfirdaus@upi.edu', '2107377A', 'mahasiswa', '41', null);
INSERT INTO `user` VALUES ('42', 'anandamyzzamarhelio@upi.edu', '2100702A', 'mahasiswa', '42', null);
INSERT INTO `user` VALUES ('43', 'ardynrezkyfahreza@upi.edu', '2103551A', 'mahasiswa', '43', null);
INSERT INTO `user` VALUES ('44', 'ayeshaalifirdaus@upi.edu', '2101990A', 'mahasiswa', '44', null);
INSERT INTO `user` VALUES ('45', 'azzahraalikaputriyudha@upi.edu', '2105899A', 'mahasiswa', '45', null);
INSERT INTO `user` VALUES ('46', 'azzahrafahrizafitriani@upi.edu', '2102296A', 'mahasiswa', '46', null);
INSERT INTO `user` VALUES ('47', 'bayuwicaksono@upi.edu', '2106836A', 'mahasiswa', '47', null);
INSERT INTO `user` VALUES ('48', 'destiralestarisaraswati@upi.edu', '2100506A', 'mahasiswa', '48', null);
INSERT INTO `user` VALUES ('49', 'dickifathurohman@upi.edu', '2103842A', 'mahasiswa', '49', null);
INSERT INTO `user` VALUES ('50', 'elsanabiilah@upi.edu', '2108805A', 'mahasiswa', '50', null);
INSERT INTO `user` VALUES ('51', 'fachrinajmnoerkartiman@upi.edu', '2106515A', 'mahasiswa', '51', null);
INSERT INTO `user` VALUES ('52', 'fikryidhamdwiyana@upi.edu', '2101294A', 'mahasiswa', '52', null);
INSERT INTO `user` VALUES ('53', 'ibnuadengkurnia@upi.edu', '2101769A', 'mahasiswa', '53', null);
INSERT INTO `user` VALUES ('54', 'ihsanghozizulfikar@upi.edu', '2103303A', 'mahasiswa', '54', null);
INSERT INTO `user` VALUES ('55', 'jovianeinstainpratamahutasoit@upi.edu', '2103949A', 'mahasiswa', '55', null);
INSERT INTO `user` VALUES ('56', 'msalmankesuma@upi.edu', '2109276A', 'mahasiswa', '56', null);
INSERT INTO `user` VALUES ('57', 'miakarismahaq@upi.edu', '2102165A', 'mahasiswa', '57', null);
INSERT INTO `user` VALUES ('58', 'mochamadkhaairi@upi.edu', '2106416A', 'mahasiswa', '58', null);
INSERT INTO `user` VALUES ('59', 'mohammadlabibhusain@upi.edu', '2101989A', 'mahasiswa', '59', null);
INSERT INTO `user` VALUES ('60', 'muhamadfirdaus@upi.edu', '2101995A', 'mahasiswa', '60', null);
INSERT INTO `user` VALUES ('61', 'muhammadalambasalamah@upi.edu', '2101677A', 'mahasiswa', '61', null);
INSERT INTO `user` VALUES ('62', 'muhammadazkaatqiya@upi.edu', '2100812A', 'mahasiswa', '62', null);
INSERT INTO `user` VALUES ('63', 'muhammaddaffayusuffadhilah@upi.edu', '2100543A', 'mahasiswa', '63', null);
INSERT INTO `user` VALUES ('64', 'muhammadfadhillahnursyawal@upi.edu', '2100543A', 'mahasiswa', '64', null);
INSERT INTO `user` VALUES ('65', 'muhammadfadlanghafur@upi.edu', '2106923A', 'mahasiswa', '65', null);
INSERT INTO `user` VALUES ('66', 'muhammadfikrikafilli@upi.edu', '2107264A', 'mahasiswa', '66', null);
INSERT INTO `user` VALUES ('67', 'muhammadrizki@upi.edu', '2107922A', 'mahasiswa', '67', null);
INSERT INTO `user` VALUES ('68', 'muhammadyusufbahtiar@upi.edu', '2107980A', 'mahasiswa', '68', null);
INSERT INTO `user` VALUES ('69', 'nadhiefathallahisya@upi.edu', '2106413A', 'mahasiswa', '69', null);
INSERT INTO `user` VALUES ('70', 'rachmanfaizmaulana@upi.edu', '2106791A', 'mahasiswa', '70', null);
INSERT INTO `user` VALUES ('71', 'raisyadjullfikar@upi.edu', '2106238A', 'mahasiswa', '71', null);
INSERT INTO `user` VALUES ('72', 'rasyidandriansyah@upi.edu', '2101963A', 'mahasiswa', '72', null);
INSERT INTO `user` VALUES ('73', 'ravindramaulanasahman@upi.edu', '2108724A', 'mahasiswa', '73', null);
INSERT INTO `user` VALUES ('74', 'riskanurohmah@upi.edu', '2109103A', 'mahasiswa', '74', null);
INSERT INTO `user` VALUES ('75', 'shandynuarydwilata@upi.edu', '2102746A', 'mahasiswa', '75', null);
INSERT INTO `user` VALUES ('76', 'talithasyahla@upi.edu', '2101330A', 'mahasiswa', '76', null);
INSERT INTO `user` VALUES ('77', 'wildanmaulidarojat@upi.edu', '2106330A', 'mahasiswa', '77', null);
INSERT INTO `user` VALUES ('78', 'andinisetyaarianti@upi.edu', 'dosen1', 'dosen', null, '1');
INSERT INTO `user` VALUES ('79', 'anianisyah@upi.edu', 'dosen2', 'dosen', null, '2');
INSERT INTO `user` VALUES ('80', 'asepwahyudin@upi.edu', 'dosen3', 'dosen', null, '3');
INSERT INTO `user` VALUES ('81', 'budilaksonoputro@upi.edu', 'dosen4', 'dosen', null, '4');
INSERT INTO `user` VALUES ('82', 'eddyprasetyonugroho@upi.edu', 'dosen5', 'dosen', null, '5');
INSERT INTO `user` VALUES ('83', 'ekafitrajayarahman@upi.edu', 'dosen6', 'dosen', null, '6');
INSERT INTO `user` VALUES ('84', 'ekinugraha@upi.edu', 'dosen7', 'dosen', null, '7');
INSERT INTO `user` VALUES ('85', 'enjangalinurdin@upi.edu', 'dosen8', 'dosen', null, '8');
INSERT INTO `user` VALUES ('86', 'enjunjunaeti@upi.edu', 'dosen9', 'dosen', null, '9');
INSERT INTO `user` VALUES ('87', 'erlangga@upi.edu', 'dosen10', 'dosen', null, '10');
INSERT INTO `user` VALUES ('88', 'ernapiantari@upi.edu', 'dosen11', 'dosen', null, '11');
INSERT INTO `user` VALUES ('89', 'harsawaraprabawa@upi.edu', 'dosen12', 'dosen', null, '12');
INSERT INTO `user` VALUES ('90', 'herbertsiregar@upi.edu', 'dosen13', 'dosen', null, '13');
INSERT INTO `user` VALUES ('91', 'herisutarno@upi.edu', 'dosen14', 'dosen', null, '14');
INSERT INTO `user` VALUES ('92', 'jajangkusnendar@upi.edu', 'dosen15', 'dosen', null, '15');
INSERT INTO `user` VALUES ('93', 'lalaseptemriza@upi.edu', 'dosen16', 'dosen', null, '16');
INSERT INTO `user` VALUES ('94', 'muhammadnursalman@upi.edu', 'dosen17', 'dosen', null, '17');
INSERT INTO `user` VALUES ('95', 'munir@upi.edu', 'dosen18', 'dosen', null, '18');
INSERT INTO `user` VALUES ('96', 'Nusuki Syariati Fathimah, S.Pd., M.Pd.', 'dosen19', 'dosen', null, '19');
INSERT INTO `user` VALUES ('97', 'ranimegasari@upi.edu', 'dosen20', 'dosen', null, '20');
INSERT INTO `user` VALUES ('98', 'rizkyrahman@upi.edu', 'dosen21', 'dosen', null, '21');
INSERT INTO `user` VALUES ('99', 'rosaarianisukamto@upi.edu', 'dosen22', 'dosen', null, '22');
INSERT INTO `user` VALUES ('100', 'wahyudin@upi.edu', 'dosen23', 'dosen', null, '23');
INSERT INTO `user` VALUES ('101', 'wawansetiawan@upi.edu', 'dosen24', 'dosen', null, '24');
INSERT INTO `user` VALUES ('102', 'yayawihardi@upi.edu', 'dosen25', 'dosen', null, '25');
INSERT INTO `user` VALUES ('103', 'yudiahmadhambali@upi.edu', 'dosen26', 'dosen', null, '26');
INSERT INTO `user` VALUES ('104', 'yudiwibisono@upi.edu', 'dosen27', 'dosen', null, '27');
INSERT INTO `user` VALUES ('105', 'rasim@upi.edu', 'dosen28', 'dosen', null, '28');

-- ----------------------------
-- View structure for `v_progres`
-- ----------------------------
DROP VIEW IF EXISTS `v_progres`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_progres` AS select count(`mhs`.`status_mbkm`) AS `progres` from `mhs` where `mhs`.`status_mbkm` = 'Progres';

-- ----------------------------
-- View structure for `v_sedang`
-- ----------------------------
DROP VIEW IF EXISTS `v_sedang`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sedang` AS select count(`mhs`.`jumlah_sks`) AS `sedang` from `mhs` where `mhs`.`status_mbkm` = 'Sedang';

-- ----------------------------
-- View structure for `v_tercapai`
-- ----------------------------
DROP VIEW IF EXISTS `v_tercapai`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tercapai` AS select count(`mhs`.`jumlah_sks`) AS `tercapai` from `mhs` where `mhs`.`status_mbkm` = 'Tercapai';
DELIMITER ;;
CREATE TRIGGER `tr_jmlh_mhs_mbkm` AFTER UPDATE ON `mhs` FOR EACH ROW BEGIN
UPDATE pm SET
pm.jumlah_mhs_mbkm=pm.jumlah_mhs_mbkm+1
WHERE pm.id_pm=NEW.id_pm;
END
;;
DELIMITER ;
