-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 04:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `Admin_name` varchar(50) NOT NULL,
  `Admin_pass` varchar(10) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `Admin_name`, `Admin_pass`, `role`) VALUES
(1001, 'Sourin Saha', '1234', 'ceo'),
(1002, 'test_user', '1234', '1st t'),
(1003, 'test user', '43349546', 'manager ');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(14) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `User_email` varchar(50) NOT NULL,
  `doc_name` varchar(25) NOT NULL,
  `dept_name` varchar(25) NOT NULL,
  `appontment_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_name`, `User_email`, `doc_name`, `dept_name`, `appontment_date`) VALUES
(1000101001, 'Sourin Saha', '', 'Prosun Sarker', 'Urology & Kidneys', '05-08-2023'),
(1000101002, 'biva', '', 'biva', 'biva', '22-22-22'),
(1000101003, 'SOURIN SAHA', '', 'sourin', 'sourin', '2023-06-21'),
(1000101004, 'shubham Mukherjee', '', 'sourin', 'sourin', '2023-07-01'),
(1000101005, 'SOURIN SAHA', '', 'SAYAN', 'gynecologist', '2023-06-24'),
(1000101006, 'SOURIN SAHA', '', 'Dr. Prosun Sarker', 'Urology and Kidneys', '2023-07-01'),
(1000101007, 'subrata dey', '', 'AVEN SANKOWA MANDI', 'OPHTHALMOLOGY', ''),
(1000101008, 'subrata dey', '', 'AVEN SANKOWA MANDI', 'OPHTHALMOLOGY', '2023-06-20'),
(1000101009, 'SOURIN SAHA', 'sourinsaha2001@gmail.com', 'dr. Shubham Kumer', 'Orthopedics', '2023-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(3) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `dept_about` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_about`) VALUES
(51, 'Urology and Kidneys', 'Urology is a part of health care that deals with diseases of the male and female urinary tract (kidneys, ureters, bladder and urethra). It also deals with the male organs that are able to make babies (penis, testes, scrotum, prostate, etc.). Since health problems in these body parts can happen to everyone, urologic health is important.\r\n\r\nUrology is known as a surgical specialty. Besides surgery, a urologist is a doctor with wisdom of internal medicine, pediatrics, gynecology and other parts of health care. This is because a urologist encounters a wide range of clinical problems. The scope of urology is big and the American Urological Association has named seven subspecialty parts:\r\n\r\n    Pediatric Urology (children\'s urology)\r\n    Urologic Oncology (urologic cancers)\r\n    Renal (kidney) Transplant\r\n    Male Infertility\r\n    Calculi (urinary tract stones)\r\n    Female Urology\r\n    Neurourology (nervous system control of genitourinary organs)\r\n'),
(52, 'Cardiology department', 'Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and valvular heart disease.'),
(53, 'Nurology', 'Hear nurology is done'),
(54, 'OPHTHALMOLOGY', 'OPHTHALMOLOGY\r\nName of Department : OPHTHALMOLOGY\r\n’TARACHAND - MOHANLAL BHATEWARA EYE DEPARTMENT: a comprehensive eye department was established on November 2001 . In the past 17 years we have treated more than ------- patients at this hospital. More than ------- eye surgeries for various eye diseases have also been performed in this period.\r\n\r\nDMH is a registered hospital and patients can get cashless or reimbursement facility with all major Health Insurance Providers and certain large corporate (e.g. Tata Motors), depending on their eligibility.\r\n\r\nWe take special pride in our services for senior citizens as well as economically weaker sections.\r\n\r\nOur fully functional and well-equipped OPD and Operation Theater cover a broad spectrum eye care facilities, with latest technological advances.\r\n\r\nDepartment of ophthalmology is equipped with state of the art equipments and is run by eye specialists who are highly qualified in the various ophthalmic sub specialties.'),
(55, 'Physiotherapist', 'Physiotherapy is a branch of science that aims to teach the techniques and treatments to restore a patient’s mobility. According to the World Health Organization (WHO) report, every 10,000 people should have access to a physiotherapist. India, on the other hand, barely has roughly 5000 registered physiotherapists. As a result, India has roughly a demand for 95,000 physiotherapists.\r\n\r\nBachelor of Physiotherapy (BPT), Bachelor of Occupational Therapy (BOT), and Diploma in Physiotherapy are among the well-known Physiotherapy Courses After 12th. Students should study Biology, Chemistry, and Physics in classes 10 - 12 and secure a minimum of 50% marks to be eligible for any Physiotherapy course.\r\n\r\nCMC Vellore, SRIHER Chennai, Jamia Hamdard University, and KMC Mangalore are among the Top Physiotherapy Colleges in India. The majority of physiotherapy colleges conduct common entrance tests for admission; however, some colleges consider merit-based admission.'),
(56, 'gynecologist', 'A gynecologist is a doctor who specializes in female reproductive health. They diagnose and treat issues related to the female reproductive tract. This includes the uterus, fallopian tubes, and ovaries and breasts.\r\n\r\nAnyone with female organs may see a gynecologist.  80% of those who see one are between 15 to 45 years old. \r\n\r\nWhat Does a Gynecologist Do?\r\nGynecologists give reproductive and sexual health services that include pelvic exams, Pap tests, cancer screenings, and testing and treatment for vaginal infections.\r\n\r\nThey diagnose and treat reproductive system disorders such as endometriosis, infertility, ovarian cysts, and pelvic pain. They may also care for people with ovarian, cervical, and other reproductive cancers.\r\n\r\nSome gynecologists also practice as obstetricians, who give care during pregnancy and birth. If a gynecologist has expertise in obstetrics, they’re called an OB-GYN.\r\n\r\nEducation and Training\r\nGynecologists are physicians who have completed specialized training in the female reproductive system. Like any medical doctor, a gynecologist must complete medical school followed by a residency. In the United States, residency programs and the certification process cover obstetrics and gynecology in combination.\r\n\r\nThe process involves:\r\n\r\nFour years’ worth of medical school\r\nFour years of residency\r\nSuccessful completion of the Qualifying Exam, a written test\r\nDocumented experience in patient care\r\nSuccessful completion of the Certifying Exam, an oral test\r\nAfter becoming board-certified, a gynecologist may have advanced subspecialty training. Areas of training include:\r\n\r\nBreast care\r\nFamily planning\r\nMinimally invasive surgery\r\nPediatric and adolescent gynecology\r\nPelvic medicine and reconstructive surgery\r\nReasons to See a Gynecologist\r\nYou may want to see a gynecologist if:\r\n\r\nYou’re Due for a Checkup\r\n\r\nIt’s important to have regular visits with your gynecologist to maintain your reproductive health. According to the American College of Obstetricians and Gynecologists, these visits should start between the ages of 13 and 15.\r\n\r\nDepending on your health history and how old you are, your gynecologist may use this visit to screen for problems like cervical or breast cancer. The well visit is also your chance to ask the gynecologist about reproductive health concerns like birth control.\r\n\r\nYou Have Discomfort in Your Pelvic Region\r\n\r\nPain in the lower belly, also known as the pelvic region, may be a sign of a problem with the reproductive organs. Common causes of pelvic pain include menstrual cramps, ovarian cysts, endometriosis, and ectopic pregnancy.\r\n\r\nYou Have Concerns about Your Period or Getting Pregnant\r\n\r\nYou can make an appointment with a gynecologist if you have changes in your monthly period, including unusual pain or bleeding. If you are in your 40s or 50s, your gynecologist can help you to figure out if you might be going through menopause.\r\n\r\nGynecologists can also help you with questions about pregnancy, including how to avoid getting pregnant and what to do if you think you might be pregnant.\r\n\r\nYou Have a Discharge Your Concerned About\r\n\r\nIf you’re having an unusual discharge or odor, a gynecologist can diagnose the cause and offer treatment.\r\n\r\nWhat to Expect at the Gynecologist\r\nYour gynecologists will exam your reproductive system, both internally and externally. They’ll examine your breasts and check for any lumps or cysts.\r\n\r\nThey’ll then examine your vulva, which is located outside of the vagina. \r\n\r\nThe next step is usually an internal pelvic exam. The doctor will use a special instrument called a speculum to see inside the vagina and look at the cervix.\r\n\r\nTo see inside the body, a gynecologist uses a tool known as a speculum, which the doctor inserts into the vagina. It helps to widen the vagina and help the doctor to see the cervix, located between the vagina and the uterus.\r\n\r\nDuring the pelvic exam, the gynecologist may do a procedure known called a Pap smear. It lets the doctor collect a sample of cells from the cervix to check for infection.\r\n\r\nYour doctor may also press on your abdomen and pelvis, and may insert a gloved finger into your rectum to check for any problems.\r\n\r\nIf your gynecologist diagnoses you with a medical condition, they may give you treatment or refer you to a specialist. Depending on the problem, your treatments may involve medication, surgery, or a wait-and-see approach. '),
(57, 'Orthopedics', 'Banga pa thik kora hoi'),
(58, 'Genaral Medicine', 'required for every day life'),
(59, 'Operating theatre (OT)', 'Every emergency work handles here.'),
(60, ' Radiology department ', 'The Radiology Department of the SRM Medical College Hospital has advanced imaging facilities and a team of qualified and experienced faculties.  The department provides 24-hour service to the hospital and also involves students in the diagnostic procedures. The teaching faculty, completely dedicated to this area of expertise are given the responsibility to train students. The faculty members and students present topics in Continuing Medical Education programs, Indian Radiological Association meetings, as well as state and national conferences. Apart from diagnostic procedures done with MRI 1.5 Tesla, 128 slice CT, Doppler USG and Digital X-ray, the department also provides Interventional Procedures through Digital Subtraction Angiography (DSA).'),
(61, 'Nutrition and dietetics', 'diatecians are here'),
(63, 'Oncology department', 'cancer department'),
(64, 'Outpatient Department (OPD)', 'outdoor petient vsited here');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(10) NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `doc_degree` varchar(30) NOT NULL,
  `doc_hospital` varchar(40) NOT NULL,
  `dept_id` int(10) NOT NULL,
  `rateing` float NOT NULL DEFAULT 3,
  `doc_pass` int(20) NOT NULL DEFAULT 1234
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `doc_name`, `doc_degree`, `doc_hospital`, `dept_id`, `rateing`, `doc_pass`) VALUES
(101, 'Dr. Prosun Sarker', 'M.B.B.S. , M.D.', 'AIIMS Delhi', 51, 5, 1234),
(102, 'Dr. Saroj Tripathi', 'M.B.B.S. , M.D.', 'AIIMS Delhi', 51, 3, 1234),
(103, 'AVEN SANKOWA MANDI', 'M.D., M.B.B.S ', 'Appalo', 54, 3, 1234),
(104, 'SAYAN BANERJEE', 'M.D. M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 56, 3, 1234),
(105, 'Dr. Ashim Dutta', 'M.D. M.B.B.S M.CH', 'SANAKA MEDICAL INSTITUTE OF ORTHOPEDICS', 57, 3, 1234),
(106, 'dr. Shubham Kumer', 'M.D. M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 57, 3.9, 1234),
(107, 'Bhupendra Kisor Roychoudhury', 'M.D. M.B.B.S M.CH', 'SANAKA MEDICAL INSTITUTE OF ORTHOPEDICS', 56, 4.67, 1234),
(108, 'Ram Charan Ghosh', 'M.D. M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 55, 3.98, 1234),
(109, 'Anirban Das', 'M.B.B.S,M.Ch', 'AIIMS Pune', 52, 2.89, 1234),
(110, 'Rohan kumar', 'M.B.B.S,M.Ch', 'AIIMS Pune', 59, 4.06, 1234),
(111, 'Sayantan Banerjee', 'M.B.B.S ', 'B.P Poddar ', 60, 4.5, 1234),
(112, 'Soumen Mondal', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 59, 3.7, 1234),
(113, 'Soumen Mondal', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 59, 3.7, 1234),
(114, 'Ronit Barman', 'M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 56, 4, 1234),
(115, 'Koushik Thakur', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 61, 3.9, 1234),
(116, 'Amit Konar', 'M.B.B.S ,M.CH', 'AIIMS PUNE', 62, 3.8, 1234),
(117, 'Utpal Varma', 'M.B.B.S, M.D', 'NIMTALA MEDICAL COLLEGE', 64, 4.5, 1234),
(118, 'Souvik das', 'M.B.B.S ,M.CH', 'AIIMS PUNE', 55, 4.2, 1234),
(119, 'Souvik das', 'M.B.B.S ,M.CH', 'AIIMS PUNE', 55, 4.2, 1234),
(120, 'Soma Dhar', 'M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 53, 4.2, 1234),
(121, 'Mukesh Kumar', 'M.B.B.S', 'AIIMS PUNE', 52, 4.1, 1234),
(122, 'Debjit Mondal', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 51, 3.7, 1234),
(123, 'Ritam Mukherjee', 'M.B.B.S ,M.CH', 'AIIMS PUNE', 54, 3.8, 1234),
(124, 'Arjun Banerjee', 'M.B.B.S, M.D', 'NIMTALA MEDICAL COLLEGE', 57, 3.5, 1234),
(125, 'Disha Dutta', 'M.B.B.S ,M.CH', 'MANKAR HOSPITAL', 63, 3.9, 1234),
(126, 'Angshuman Mukherjee', 'M.B.B.S', 'NIMTALA MEDICAL COLLEGE', 63, 4.6, 1234),
(127, 'Sourav Barman ', 'M.B.B.S ,M.CH', 'AIIMS PUNE', 52, 4.7, 1234),
(128, 'Rakesh Saha', 'M.B.B.S, M.D', 'B.P Poddar', 64, 3.8, 1234),
(129, 'Sohom Nandi ', 'M.B.B.S ,M.CH', 'AIIMS DELHI', 63, 3.4, 1234),
(130, 'Soumik Mondal', 'M.B.B.S', 'AIIMS DELHI', 59, 4.5, 1234),
(131, 'Subham Barman', 'M.B.B.S, M.D', 'NIMTALA MEDICAL COLLEGE', 60, 4.6, 1234),
(132, 'Nirman Das', 'M.B.B.S', 'MANKAR HOSPITAL', 60, 3.7, 1234),
(133, 'Rounak Banerjee', 'M.B.B.S ,M.CH', 'NIMTALA MEDICAL COLLEGE', 58, 3.9, 1234),
(134, 'Niloy Guha', 'M.B.B.S', 'B.P Poddar', 57, 4, 1234),
(135, 'Sayan Das', 'M.B.B.S, M.D', 'AIIMS DELHI', 54, 3.5, 1234),
(136, 'Sayani Das', 'M.B.B.S ,M.CH', 'NIMTALA MEDICAL COLLEGE', 55, 3.9, 1234),
(137, 'Kuldip Chatterjee', 'M.B.B.S, M.D', 'B.P Poddar', 61, 3.6, 1234),
(138, 'Sonali Saha', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 51, 4.1, 1234),
(139, 'Nandita Mondal', 'M.B.B.S', 'AIIMS DELHI', 62, 4.2, 1234),
(140, 'Arun Das', 'M.B.B.S ,M.CH', 'Appalo Hospital', 63, 4.3, 1234),
(141, 'Debopriyo Ghosh', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 62, 4.5, 1234),
(142, 'Deepak Yadav', 'M.B.B.S ,M.CH', 'NIMTALA MEDICAL COLLEGE', 53, 5, 1234),
(143, 'Suraj Singh', 'M.B.B.S', 'B.P Poddar', 51, 4.3, 1234),
(144, 'Taracharan Chatterjee', 'M.B.B.S, M.D', 'AIIMS PUNE', 64, 4.6, 1234),
(145, 'Raju Dey', 'M.B.B.S ,M.CH', 'AIIMS DELHI', 57, 4.3, 1234),
(146, 'Shuvojit Nayek', 'M.B.B.S', 'MANKAR HOSPITAL', 52, 3.8, 1234),
(147, 'Nilanjan Konar ', 'M.B.B.S, M.D', 'Appalo Hospital', 51, 4, 1234),
(148, 'Sneha Mondal', 'M.B.B.S ,M.CH', 'NIMTALA MEDICAL COLLEGE', 54, 4.2, 1234),
(149, 'Sudip Das', 'M.B.B.S', 'B.P Poddar', 59, 4.7, 1234),
(150, 'Sandipan Mukherjee', 'M.B.B.S, M.D', 'MANKAR HOSPITAL', 64, 5, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `F_name` varchar(100) NOT NULL,
  `L_name` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Country` varchar(19) NOT NULL,
  `password` varchar(30) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `dob` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `F_name`, `L_name`, `username`, `email`, `Address`, `Country`, `password`, `Gender`, `mobile_no`, `Verified`, `isActive`, `dob`) VALUES
(1001, 'sourin', 'saha', 'kuro', 'sourinsaha2001@gmail.com', 'vill+p.o. : mankar\r\npurba burdwan \r\nwest bengal', 'india', '1234', 'Male', 9832645089, 0, 0, ''),
(1003, 'Bapi', 'sarkar', 'bapi', 'bapi@gmai.com', '20/a durgapur,Durgapur State: West Bengal  P.I.N. :713112', 'India', '1234', 'Male', 9645454854, 0, 1, ''),
(1004, 'Pritam', 'Das', 'pro', 'das@gmail.com', '20/a durgapur,Durgapur State: West Bengal  P.I.N. :713112', 'India', '1234', 'Male', 123456789, 0, 1, ''),
(1005, 'rakhi ', 'saha', 'rakhi', 'rakhisaha@gmail.com', '20/a durgapur,Durgapur State: West Bengal  P.I.N. :713112', 'India', '1234', 'Female', 5656565656, 0, 1, ''),
(1006, 'LORD', 'HABAEK', 'lordhabaek', 'abc@gmail.com', '32/a,Panagarh State: West Bengal  P.I.N. :713148', 'India', '1234', 'Male', 8756348912, 0, 0, ''),
(1010, 'nitin', 'kumar', 'nitin@4818', 'sourinsaha0711@gmail.com', '12,mankar State: West Bengal  P.I.N. :713144', 'India', 'm7WGMqy8F#Q^h2)', 'Male', 9832645089, 0, 0, '2321-02-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000101010;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
