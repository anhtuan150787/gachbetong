-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2017 at 08:30 PM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.6.30-12~ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gachbetong`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `acl_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_module` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_controller` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_status` int(11) NOT NULL,
  `acl_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acl_parent` int(11) NOT NULL,
  PRIMARY KEY (`acl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=124 ;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`acl_id`, `acl_module`, `acl_controller`, `acl_action`, `acl_status`, `acl_name`, `acl_parent`) VALUES
(1, 'admin', 'index', 'index', 1, 'Trang chủ', 0),
(7, '', '', '', 1, 'Nhóm quản trị', 0),
(8, 'admin', 'groupadmin', 'index', 1, 'Danh sách', 7),
(9, 'admin', 'groupadmin', 'add', 1, 'Thêm', 7),
(10, 'admin', 'groupadmin', 'edit', 1, 'Cập nhật', 7),
(11, 'admin', 'groupadmin', 'delete', 1, 'Xóa', 7),
(12, '', '', '', 1, 'Tài khoản quản trị', 0),
(13, 'admin', 'admin', 'index', 1, 'Danh sách', 12),
(14, 'admin', 'admin', 'add', 1, 'Thêm', 12),
(15, 'admin', 'admin', 'delete', 1, 'Xóa', 12),
(16, 'admin', 'admin', 'edit', 1, 'Cập nhật', 12),
(17, '', '', '', 1, 'Menu CMS', 0),
(18, 'admin', 'menu', 'index', 1, 'Danh sách', 17),
(19, 'admin', 'menu', 'add', 1, 'Thêm', 17),
(20, 'admin', 'menu', 'delete', 1, 'Xóa', 17),
(21, 'admin', 'menu', 'edit', 1, 'Cập nhật', 17),
(22, '', '', '', 1, 'Quyền', 0),
(23, 'admin', 'acl', 'index', 1, 'Danh sách', 22),
(24, 'admin', 'acl', 'add', 1, 'Thêm', 22),
(25, 'admin', 'acl', 'delete', 1, 'Xóa', 22),
(26, 'admin', 'acl', 'edit', 1, 'Cập nhật', 22),
(35, 'admin', 'groupadmin', 'acl', 1, 'Phân quyền', 7),
(36, '', '', '', 1, 'Menu', 0),
(37, 'admin', 'navigation', 'index', 1, 'Danh sách', 36),
(38, 'admin', 'navigation', 'add', 1, 'Thêm', 36),
(39, 'admin', 'navigation', 'delete', 1, 'Xóa', 36),
(40, 'admin', 'navigation', 'edit', 1, 'Cập nhật', 36),
(41, '', '', '', 1, 'Trang nội dung', 0),
(42, 'admin', 'page', 'index', 1, 'Danh sách', 41),
(43, 'admin', 'page', 'add', 1, 'Thêm', 41),
(44, 'admin', 'page', 'delete', 1, 'Xóa', 41),
(45, 'admin', 'page', 'edit', 1, 'Cập nhật', 41),
(46, '', '', '', 1, 'Danh mục bài viết', 0),
(47, 'admin', 'newscategory', 'index', 1, 'Danh sách', 46),
(48, 'admin', 'newscategory', 'add', 1, 'Thêm', 46),
(49, 'admin', 'newscategory', 'delete', 1, 'Xóa', 46),
(50, 'admin', 'newscategory', 'edit', 1, 'Cập nhật', 46),
(51, '', '', '', 1, 'Tin tức', 0),
(52, 'admin', 'news', 'index', 1, 'Danh sách', 51),
(53, 'admin', 'news', 'add', 1, 'Thêm', 51),
(54, 'admin', 'news', 'delete', 1, 'Xóa', 51),
(55, 'admin', 'news', 'edit', 1, 'Cập nhật', 51),
(56, 'admin', 'news', 'delete-picture', 1, 'Xóa hình đại diện', 51),
(57, '', '', '', 1, 'Danh mục sản phẩm', 0),
(58, 'admin', 'productcategory', 'index', 1, 'Danh sách', 57),
(59, 'admin', 'productcategory', 'add', 1, 'Thêm', 57),
(60, 'admin', 'productcategory', 'delete', 1, 'Xóa', 57),
(61, 'admin', 'productcategory', 'edit', 1, 'Cập nhật', 57),
(62, '', '', '', 1, 'Sản phẩm', 0),
(63, 'admin', 'product', 'index', 1, 'Danh sách', 62),
(64, 'admin', 'product', 'add', 1, 'Thêm', 62),
(65, 'admin', 'product', 'delete', 1, 'Xóa', 62),
(66, 'admin', 'product', 'edit', 1, 'Cập nhật', 62),
(67, 'admin', 'product', 'delete-picture', 1, 'Xóa hình đại diện', 62),
(68, '', '', '', 1, 'Đơn hàng', 0),
(69, 'admin', 'order', 'index', 1, 'Danh sách', 68),
(70, 'admin', 'order', 'edit', 1, 'Cập nhật', 68),
(71, '', '', '', 1, 'Giao diện', 0),
(72, 'admin', 'template', 'index', 1, 'Danh sách', 71),
(73, 'admin', 'template', 'edit', 1, 'Cập nhật', 71),
(90, '', '', '', 1, 'Cấu hình Website', 0),
(91, 'admin', 'website', 'edit', 1, 'Cập nhật thông tin website', 90),
(92, 'admin', 'website', 'delete-picture', 1, 'Xóa icon Website', 90),
(93, 'admin', 'template', 'delete-picture', 1, 'Xóa hình', 71),
(94, '', '', '', 1, 'Email khách hàng đăng ký', 0),
(95, 'admin', 'emailcustomer', 'index', 1, 'Danh sách', 94),
(96, 'admin', 'emailcustomer', 'export', 1, 'Xuất Excel', 94),
(97, '', '', '', 1, 'Liên hệ', 0),
(98, 'admin', 'contact', 'index', 1, 'Danh sách', 97),
(99, 'admin', 'contact', 'export', 1, 'Xuất Excel', 97),
(100, 'admin', 'contact', 'delete', 1, 'Xóa', 97),
(111, '', '', '', 1, 'Nhóm menu', 0),
(112, 'admin', 'groupnavigation', 'index', 1, 'Danh sách', 111),
(113, 'admin', 'groupnavigation', 'add', 1, 'Thêm', 111),
(114, 'admin', 'groupnavigation', 'delete', 1, 'Xóa', 111),
(115, 'admin', 'groupnavigation', 'edit', 1, 'Cập nhật', 111),
(116, '', '', '', 1, 'Nhóm giao diện', 0),
(117, 'admin', 'grouptemplate', 'index', 1, 'Danh sách', 116),
(118, 'admin', 'grouptemplate', 'add', 1, 'Thêm', 116),
(119, 'admin', 'grouptemplate', 'edit', 1, 'Cập nhật', 116),
(120, 'admin', 'grouptemplate', 'delete', 1, 'Xóa', 116),
(121, 'admin', 'template', 'delete', 1, 'Xóa', 71),
(122, 'admin', 'template', 'add', 1, 'Thêm', 71),
(123, 'admin', 'order', 'delete', 1, 'Xóa', 68);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_admin_id` int(11) NOT NULL,
  `admin_status` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_picture`, `group_admin_id`, `admin_status`) VALUES
(1, 'anhtuan150787@gmail.com', '550e1bafe077ff0b0b67f4e32f29d751', 'Anh Tuấn', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `build`
--

CREATE TABLE IF NOT EXISTS `build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folder` text COLLATE utf8_unicode_ci NOT NULL,
  `subversion` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=105 ;

--
-- Dumping data for table `build`
--

INSERT INTO `build` (`id`, `name`, `component`, `folder`, `subversion`, `status`, `note`, `date_created`) VALUES
(3, 'FilmPlus', '2', 'V_1_1_0\\20160725', 'releases/BUILD_20160725', 1, '', '2016-09-09 14:18:52'),
(4, 'Raspbery chiết khấu hoa hồng', '4', 'V_1_1_0\\20160805; V_1_1_0\\20160915; V_1_1_0\\20160920; V_1_1_0\\20160923; V_1_1_0\\20160929; V_1_1_0\\201610031320; V_1_1_0\\20161006', 'releases/BUILD_20160805', 1, '', '2016-09-09 14:21:51'),
(5, 'Raspbery chiết khấu hoa hồng', '2', 'V_1_1_0\\20160805; V_1_1_0\\20160927; V_1_1_0\\20160929; V_1_1_0\\201610041400; V_1_1_0\\20161010', 'releases/BUILD_20160805', 1, '', '2016-09-09 14:22:43'),
(7, 'CITYBANK + FIX SECURE', '2', 'V_1_1_0\\20160811; V_1_1_0\\20160811_CITYBANK', 'releases/BUILD_20160816_SECURE_CITYBANK', 0, '', '2016-09-09 14:27:13'),
(8, 'CITY_BANK + SECURE', '1', '2016\\08\\20160816', 'releases/BUILD_20160816_SECURE_CITYBANK', 0, '', '2016-09-09 14:28:35'),
(9, 'Chỉnh sửa giao diện', '3', '2016\\09\\20160922', 'releases/BUILD_20160829', 1, 'Gộp 3D Secure vào, Thêm mã lỗi hết hạn mức ví, Câu thông báo Hour, Day', '2016-09-09 14:29:46'),
(10, 'Câu thông báo Hour, Day', '3', '2016\\09\\20160908', 'releases/BUILD_20160908', 1, 'Kèm theo thanh toán TPB của anh Trí', '2016-09-09 14:30:29'),
(11, 'Sửa hiện thị Factor2 trong Paybill', '2', 'V_1_1_0\\20160912.zip', 'releases/BUILD_20160912', 1, 'Dùng chung với task OCB (Thanh toán trả góp/Vay tiêu dùng)\r\n', '2016-09-09 14:45:53'),
(15, 'Bỏ Address, City + Thêm mã lỗi hết hạn mức ví', '3', '2016\\09\\20160914', 'releases/BUILD_20160914', 1, '', '2016-09-14 11:57:23'),
(16, 'Nạp tiền VĐT qua POS bằng thẻ ATM', '2', 'V_1_1_0\\20160914', 'releases/BUILD_20160914', 1, '', '2016-09-14 15:50:57'),
(17, 'Nạp tiền VĐT qua POS bằng thẻ ATM', '4', 'V_1_1_0\\20160914', 'releases/BUILD_20160914', 1, '', '2016-09-14 15:51:44'),
(19, 'Quên mật khẩu', '1', '2016\\09\\2016\\201609151515; 2016\\09\\2016\\20160916', 'releases/BUILD_20160909', 1, '', '2016-09-16 08:31:16'),
(20, '3D Secure', '3', '2016\\09\\201609161516', 'releases/BUILD_20160916', 1, '', '2016-09-16 15:08:19'),
(21, 'Fixbug tooltip issuer', '2', 'V_1_1_0\\20160919', 'releases/20160919', 1, '', '2016-09-19 09:49:01'),
(22, 'Gửi mail Admin', '4', 'V_1_1_0\\201609261530', 'Release/BUILD_20160926', 1, '', '2016-09-20 13:20:00'),
(23, 'Thêm ngân hàng nạp tiền', '1', '\\2016\\09\\20160926; \\2016\\09\\201610031010; 2016\\10\\201610141415; 2016\\10\\20161021; 2016\\10\\20161026', 'Release\\BUILD_20160926;', 1, 'anh Trí tạo branch va commit code (\\2016\\09\\20160926);\r\nGôm thêm Sercurity Payoo', '2016-09-26 11:45:38'),
(25, 'Bổ sung thêm phần Xuất file *.txt cho topup theo danh sách', '2', 'V_1_1_0/201609291536', 'releases/BUILD_20160929', 1, '', '2016-09-29 11:09:26'),
(26, 'Email template manulife; Cấu hình hiển thị Customer FieldSet theo ShopID', '3', '2016\\09\\20160930', 'releases/BUILD_20160929', 1, '', '2016-09-29 13:47:20'),
(27, 'IP log, Thay đổi phí Đông Á Bank, data/out/print.php', '1', '2016\\10\\20161003', 'releases/BUILD_20161003', 1, '', '2016-09-29 14:22:06'),
(28, 'Golive dịch vụ Nạp tiền Ví điện tử trên POS', '4', 'V_1_1_0\\20161003; V_1_1_0\\20161005', 'releases/BUILD_20161003;', 1, '', '2016-09-30 14:34:54'),
(30, 'SERCURITY', '2', 'V_1_1_0\\20161018; V_1_1_0\\20161021; V_1_1_0\\20161027', 'releases/BUILD_20161018', 1, '', '2016-10-04 11:26:06'),
(31, 'Thêm thông số khi xem chi tiết giao dịch.', '1', '2016\\10\\20161005', 'releases/BUILD_20161005', 0, '', '2016-10-05 15:44:19'),
(32, 'cập nhật lại tooltip thẻ nội dia, quốc tế', '3', '2016\\10\\20161006', 'releases/BUILD_20161007', 1, '', '2016-10-06 10:08:48'),
(34, 'Bổ sung Checksum SHA512', '3', '2016\\10\\201610141337', 'releases/BUILD_201610141325', 1, '', '2016-10-14 13:38:37'),
(35, 'Mở lại chức năng chuyển tiền', '1', '2016\\10\\20161024', 'releases/BUILD_20161024', 1, '', '2016-10-24 10:16:13'),
(36, 'Giao dịch hủy', '4', '', 'releases/BUILD_20161121', 1, '', '2016-10-28 09:19:57'),
(37, 'Loyalti', '4', 'V_1_1_0\\20161103', 'releases/BUILD_20161031', 1, '', '2016-10-31 09:17:12'),
(38, 'Loyalti', '1', '2016\\10\\20161103', 'releases/BUILD_20161101', 1, '', '2016-11-01 14:43:05'),
(39, 'Email template', '3', '', 'branches/EMAIL_TEMPLATE_NEW', 1, '', '2016-11-01 15:29:58'),
(40, 'Skype, Facebook, Điều chỉnh MH đăng ký thanh toán tự động & nhắc nợ cước HĐ]', '1', '', 'releases/BUILD_20161111', 1, '', '2016-11-04 10:18:08'),
(41, 'Skype, Facebook', '6', '', 'releases/BUILD_20161111', 1, '', '2016-11-04 10:19:22'),
(42, 'Loyalti', '2', '', 'releases/BUILD_20161110', 1, 'Fix bug Rasp', '2016-11-10 09:16:09'),
(43, 'DAB', '3', '', 'releases/BUILD_20161116', 1, '', '2016-11-16 10:15:49'),
(44, 'DAB', '1', '', 'releases/BUILD_20161116', 1, '', '2016-11-16 10:15:56'),
(46, 'Bỏ Captcha thanh toán bằng TK PAYOO', '3', '', 'hotfixes/DELETE_CAPTCHA_VDT', 1, '', '2016-11-18 15:36:32'),
(47, 'Topup lẻ iframe', '5', '', 'releases/20161129', 1, '', '2016-11-29 14:05:34'),
(48, 'Fixbug Loyalty', '1', '', 'releases/20161129', 1, '', '2016-11-29 14:18:19'),
(49, 'Câu thông báo Onepay', '3', '', 'releases/BUILD_20161129', 1, '', '2016-11-29 14:20:51'),
(50, 'Câu thông báo CC', '3', '', '/branches/MESSAGE_REVIEW_CC', 0, '', '2016-11-29 14:21:05'),
(51, 'Fixbug thanh toán HTV-TMS', '2', '', 'hotfix/20161130', 1, '', '2016-11-30 13:35:18'),
(52, 'Fixbug Email template', '3', '', 'releases/BUILD_20161201', 0, '', '2016-12-01 16:25:37'),
(53, 'Fix icon Support', '1', '', 'releases/BUILD_20161205', 1, '', '2016-12-02 16:52:41'),
(54, 'Fix icon support', '5', '', 'releases/BUILD_20161205', 1, '', '2016-12-02 16:52:51'),
(55, 'MMS build backlogs tháng 11', '4', '', 'releases/BUILD_20161206', 1, '', '2016-12-06 10:02:58'),
(56, 'SDT từ Paybill qua Payoo', '3', '', 'branches/FILL_INFO_CUSTOMER', 1, '', '2016-12-07 11:27:37'),
(57, 'Fix màn hình chuyển tiền', '1', '', 'hotfixes/SEND_MONEY_INFO', 1, '', '2016-12-07 13:35:25'),
(58, 'Sửa câu thông báo PVCB', '3', '', 'branches/PVCbank', 1, '', '2016-12-14 16:35:30'),
(59, 'Fix Gui Change Password', '1', '', 'Release/BUILD_20161216', 1, '', '2016-12-16 16:28:08'),
(60, 'FEC Paynow', '3', '', 'releases/BUILD_20161220', 1, '', '2016-12-19 11:36:32'),
(61, 'Fix Gui login', '3', '', 'releases/BUILD_20161219', 1, '', '2016-12-20 14:18:27'),
(62, 'Chỉnh sửa màn hình khai báo thẻ ngân hàng', '1', '', 'releases/BUILD_20161221', 1, '', '2016-12-21 09:02:32'),
(63, 'FEC Paynow', '1', '', 'releases/BUILD201612211500', 1, '', '2016-12-21 15:07:08'),
(64, 'HotFix', '4', '', 'hotfixes/BUILD_20161223', 1, '', '2016-12-23 14:34:39'),
(65, 'Hotfix', '3', '', 'hotfixes/BUID_20161223', 1, '', '2016-12-23 14:44:54'),
(66, 'Lấy bảng in, Thêm câu thông báo trong reciept MMS', '2', '', 'Release/BUILD_20161226', 1, '', '2016-12-26 09:16:19'),
(67, 'Thêm tham số uspGetPaySiteOrder', '4', '', 'releases/BUILD_20161230', 1, '', '2016-12-26 11:34:41'),
(68, 'Thêm tham số uspGetPaySiteOrder', '2', '', 'releases/20161230', 1, '', '2016-12-26 11:35:07'),
(69, 'Fixbug Thickbox', '1', '', 'releases/BUILD_20161228', 1, '', '2016-12-28 11:36:03'),
(70, 'Fix giao dịch hủy', '4', '', 'releases/BUILD_20161228', 1, '', '2016-12-28 16:09:33'),
(71, 'Ghi nhận lý do thất bại của giao dịch nạp tiền B2C', '3', '', 'releases/BUILD_20161230', 1, '', '2016-12-30 10:50:21'),
(72, 'Xóa chữ Beta PimCore', '6', '', 'branches/REMOVE_BETA_LOGO', 1, '', '2017-01-05 09:24:36'),
(73, 'Chi tiết lịch sử giao dịch B2C', '1', '', 'branches/FIX_DATE_USERTRANSACTION_LOG_DETAIL', 1, '', '2017-01-06 16:00:28'),
(74, 'Thêm câu thông báo MMS + Barcode', '2', '', 'releases/BUILD_20170110', 1, '', '2017-01-10 11:58:10'),
(75, 'Lịch sử giao dịch', '1', '', '/releases/BUILD_20170112', 1, '', '2017-01-11 15:15:34'),
(76, 'VIB, VPB', '3', '', 'releases/BUILD_20170112', 1, '', '2017-01-12 09:11:20'),
(77, 'Thông báo Top Payoo, MMS', '1', '', 'branches/Message_Top', 1, 'Làm tạm', '2017-01-13 11:46:32'),
(78, 'Thông báo Top Payoo, MMS', '6', '', 'branches/Message_Top', 1, 'Làm tạm', '2017-01-13 11:47:56'),
(79, 'Thông báo Top Payoo, MMS', '2', '', 'branches/Message_Top', 1, 'Làm tạm', '2017-01-13 11:48:25'),
(80, 'Tắt thống kê giao dịch MMS', '2', '', 'BAO_TRI_THONG_KE', 1, 'Làm tạm', '2017-01-13 11:49:23'),
(81, 'Change address', '1', '', 'releases/BUILD_20170116', 1, '', '2017-01-16 13:18:07'),
(82, 'Change address', '3', '', 'releases/BUILD_20170116', 1, '', '2017-01-16 13:18:17'),
(83, 'Change address', '6', '', 'releases/BUILD_20170116', 1, '', '2017-01-16 13:18:25'),
(84, 'Change address', '2', '', 'releases/BUILD_20170116', 1, '', '2017-01-16 13:18:36'),
(85, 'Change address', '5', '', 'release/BUILD_20170116', 1, '', '2017-01-16 13:34:22'),
(86, 'Payoo, MMS, Paycode, BO (Fix Linh tinh)', '1', '', 'releases/BUILD_20170117', 1, '', '2017-01-17 10:00:40'),
(87, 'EVISA', '3', '', 'releases/BUILD_20170118', 1, '', '2017-01-18 14:27:16'),
(88, 'Email, Phone Paycode', '5', '', 'releases/BUILD_20170119', 1, '', '2017-01-19 13:36:55'),
(89, 'Rút tiền', '1', '', 'releases/BUILD_20170119', 3, 'Roll back', '2017-01-19 13:44:22'),
(90, 'Isuer TMDT', '2', '', 'releases/BUILD_20170302', 1, '', '2017-02-03 17:00:20'),
(91, 'Hiển thị số tiền USD', '3', '', 'releases/BUILD_20170602', 1, '', '2017-02-07 09:28:13'),
(92, 'Fix in nhiệt (rút gọn tên khách hàng)', '2', '', 'releases/BUILD_20170207', 1, '', '2017-02-07 11:08:45'),
(93, 'Bổ sung mã lỗi 476', '3', '', 'releases/BUILD_20170208', 1, '', '2017-02-08 09:38:51'),
(94, 'Fix Evisa', '3', '', 'releases/BUILD_20170209', 1, '', '2017-02-09 07:43:43'),
(95, 'Fix Evisa 2', '3', '', 'releases/BUILD_20170215', 1, '', '2017-02-15 07:18:19'),
(96, 'Kiểm tra STK VTB 102010000980726 ', '1', '', 'releases/BUILD_20170217', 1, '', '2017-02-17 02:21:32'),
(99, 'UPDATE REASON CODE', '3', '', 'branches/UPDATE_REASON_CODE', 1, '', '2017-02-23 02:00:21'),
(100, 'CustomerID FEC', '2', '', 'releases/BUILD_20170224', 3, '', '2017-02-24 08:28:31'),
(102, 'Bổ sung thêm cột PaymentMethod thống kê', '1', '', 'releases/BUILD_20170227', 1, '', '2017-02-27 06:36:49'),
(103, 'Cập nhật STK NCB', '1', '', 'releases/BUILD_20170301', 1, '', '2017-03-01 03:50:37'),
(104, 'Item 7', '4', '', 'releases/BUILD_20170306', 3, '', '2017-03-06 03:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` int(11) NOT NULL,
  `contact_content` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `contact_date` datetime NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_fullname`, `contact_email`, `contact_phone`, `contact_content`, `contact_date`) VALUES
(7, 'test', 'anhtuan150787@yahoo.com', 944112211, '234234', '2017-07-07 19:32:06'),
(8, 'Test test', 'anhtuan150787@yahoo.com', 944112211, 'test test', '2017-07-10 19:48:06'),
(9, 'Test test', 'anhtuan150787@yahoo.com', 944112211, 'test test', '2017-07-10 19:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `email_customer`
--

CREATE TABLE IF NOT EXISTS `email_customer` (
  `email_customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email_customer_id`),
  UNIQUE KEY `email_customer_name` (`email_customer_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email_customer`
--

INSERT INTO `email_customer` (`email_customer_id`, `email_customer_name`) VALUES
(1, 'anhtuan150787@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `group_acl`
--

CREATE TABLE IF NOT EXISTS `group_acl` (
  `group_acl_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `group_admin_id` int(11) NOT NULL,
  `group_acl_status` int(11) NOT NULL,
  PRIMARY KEY (`group_acl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=184 ;

--
-- Dumping data for table `group_acl`
--

INSERT INTO `group_acl` (`group_acl_id`, `acl_id`, `group_admin_id`, `group_acl_status`) VALUES
(1, 2, 1, 0),
(2, 1, 1, 1),
(3, 4, 1, 0),
(4, 5, 1, 0),
(5, 6, 1, 0),
(6, 8, 1, 1),
(7, 9, 1, 1),
(8, 10, 1, 1),
(9, 11, 1, 1),
(10, 13, 1, 1),
(11, 14, 1, 1),
(12, 15, 1, 1),
(13, 16, 1, 1),
(14, 18, 1, 1),
(15, 19, 1, 1),
(16, 20, 1, 1),
(17, 21, 1, 1),
(18, 23, 1, 1),
(19, 24, 1, 1),
(20, 25, 1, 1),
(21, 26, 1, 1),
(22, 30, 1, 0),
(23, 31, 1, 0),
(24, 32, 1, 0),
(25, 33, 1, 0),
(26, 35, 1, 1),
(27, 7, 1, 1),
(28, 12, 1, 1),
(29, 3, 1, 0),
(30, 17, 1, 1),
(31, 22, 1, 1),
(32, 29, 1, 0),
(33, 36, 1, 1),
(34, 37, 1, 1),
(35, 38, 1, 1),
(36, 39, 1, 1),
(37, 40, 1, 1),
(38, 41, 1, 1),
(39, 42, 1, 1),
(40, 43, 1, 1),
(41, 44, 1, 1),
(42, 45, 1, 1),
(43, 46, 1, 1),
(44, 47, 1, 1),
(45, 48, 1, 1),
(46, 49, 1, 1),
(47, 50, 1, 1),
(48, 51, 1, 1),
(49, 52, 1, 1),
(50, 53, 1, 1),
(51, 54, 1, 1),
(52, 55, 1, 1),
(53, 56, 1, 1),
(54, 57, 1, 1),
(55, 58, 1, 1),
(56, 59, 1, 1),
(57, 60, 1, 1),
(58, 61, 1, 1),
(59, 62, 1, 1),
(60, 63, 1, 1),
(61, 64, 1, 1),
(62, 65, 1, 1),
(63, 66, 1, 1),
(64, 67, 1, 1),
(129, 68, 1, 1),
(130, 69, 1, 1),
(131, 70, 1, 1),
(132, 71, 1, 1),
(133, 72, 1, 1),
(134, 73, 1, 1),
(135, 74, 1, 0),
(136, 75, 1, 0),
(137, 76, 1, 0),
(138, 77, 1, 0),
(139, 78, 1, 0),
(140, 79, 1, 0),
(141, 80, 1, 0),
(142, 81, 1, 0),
(143, 82, 1, 0),
(144, 83, 1, 0),
(145, 84, 1, 0),
(146, 85, 1, 0),
(147, 87, 1, 0),
(148, 88, 1, 0),
(149, 89, 1, 0),
(150, 90, 1, 1),
(151, 91, 1, 1),
(152, 92, 1, 1),
(153, 93, 1, 1),
(154, 94, 1, 1),
(155, 95, 1, 1),
(156, 96, 1, 1),
(157, 97, 1, 1),
(158, 98, 1, 1),
(159, 99, 1, 1),
(160, 100, 1, 1),
(161, 101, 1, 0),
(162, 102, 1, 0),
(163, 103, 1, 0),
(164, 104, 1, 0),
(165, 105, 1, 0),
(166, 106, 1, 0),
(167, 107, 1, 0),
(168, 108, 1, 0),
(169, 109, 1, 0),
(170, 110, 1, 0),
(171, 111, 1, 1),
(172, 112, 1, 1),
(173, 113, 1, 1),
(174, 114, 1, 1),
(175, 115, 1, 1),
(176, 116, 1, 1),
(177, 117, 1, 1),
(178, 118, 1, 1),
(179, 119, 1, 1),
(180, 120, 1, 1),
(181, 121, 1, 1),
(182, 122, 1, 1),
(183, 123, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_admin`
--

CREATE TABLE IF NOT EXISTS `group_admin` (
  `group_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_admin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_admin_status` int(1) NOT NULL,
  PRIMARY KEY (`group_admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `group_admin`
--

INSERT INTO `group_admin` (`group_admin_id`, `group_admin_name`, `group_admin_status`) VALUES
(1, 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_menu`
--

CREATE TABLE IF NOT EXISTS `group_menu` (
  `group_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_admin_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `group_menu_status` int(11) NOT NULL,
  PRIMARY KEY (`group_menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Dumping data for table `group_menu`
--

INSERT INTO `group_menu` (`group_menu_id`, `group_admin_id`, `menu_id`, `group_menu_status`) VALUES
(1, 1, 10, 1),
(2, 1, 6, 1),
(3, 1, 7, 1),
(4, 1, 8, 1),
(5, 1, 9, 1),
(6, 1, 12, 0),
(7, 1, 13, 0),
(8, 1, 14, 1),
(9, 1, 15, 0),
(10, 1, 16, 1),
(11, 1, 17, 1),
(12, 1, 18, 1),
(13, 1, 19, 1),
(14, 1, 20, 1),
(15, 1, 21, 1),
(16, 1, 22, 1),
(26, 1, 23, 0),
(27, 1, 24, 0),
(28, 1, 25, 0),
(29, 1, 26, 0),
(30, 1, 27, 0),
(31, 1, 28, 1),
(32, 1, 29, 1),
(33, 1, 30, 1),
(34, 1, 31, 0),
(35, 1, 32, 1),
(36, 1, 33, 1),
(37, 1, 34, 0),
(38, 1, 35, 1),
(39, 1, 36, 1),
(40, 1, 37, 1),
(41, 1, 38, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_navigation`
--

CREATE TABLE IF NOT EXISTS `group_navigation` (
  `group_navigation_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_status` int(1) NOT NULL,
  PRIMARY KEY (`group_navigation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `group_navigation`
--

INSERT INTO `group_navigation` (`group_navigation_id`, `group_navigation_name`, `group_navigation_status`) VALUES
(12, 'Menu top', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_template`
--

CREATE TABLE IF NOT EXISTS `group_template` (
  `group_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_status` int(1) NOT NULL,
  PRIMARY KEY (`group_template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `group_template`
--

INSERT INTO `group_template` (`group_template_id`, `group_template_name`, `group_template_status`) VALUES
(6, 'Header', 1),
(7, 'Banner slide', 1),
(8, 'Footer', 1),
(9, 'Liên hê', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_parent` int(11) DEFAULT '0',
  `menu_status` int(11) NOT NULL,
  `menu_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_parent`, `menu_status`, `menu_url`) VALUES
(6, 'Nhóm quản trị', 10, 1, 'admin/group-admin'),
(7, 'Tài khoản quản trị', 10, 1, 'admin/admin'),
(8, 'Menu', 10, 1, 'admin/menu'),
(9, 'Quyền', 10, 1, 'admin/acl'),
(10, 'Cấu hình CMS', 0, 1, ''),
(14, 'Giao diện', 0, 1, ''),
(16, 'Bài viết', 0, 1, ''),
(17, 'Trang nội dung', 16, 1, 'admin/page'),
(18, 'Danh mục bài viết', 16, 1, 'admin/news-category'),
(19, 'Bài viết', 16, 1, 'admin/news'),
(20, 'Sản phẩm', 0, 1, ''),
(21, 'Danh mục sản phẩm', 20, 1, 'admin/product-category'),
(22, 'Sản phẩm', 20, 1, 'admin/product'),
(23, 'Giỏ hàng', 0, 1, ''),
(24, 'Quản lý đơn hàng', 23, 1, 'admin/order'),
(28, 'Thông tin Website', 29, 1, 'admin/website'),
(29, 'Cấu hình Website', 0, 1, ''),
(30, 'Khách hàng', 0, 1, ''),
(31, 'Email đăng ký', 30, 1, 'admin/email-customer'),
(32, 'Liên hệ', 30, 1, 'admin/contact'),
(33, 'Nhóm menu', 14, 1, 'admin/group-navigation'),
(35, 'Nhóm giao diện', 14, 1, 'admin/group-template'),
(36, 'Giao diện', 35, 1, 'admin/template'),
(37, 'Menu', 33, 1, 'admin/navigation');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE IF NOT EXISTS `navigation` (
  `navigation_id` int(11) NOT NULL AUTO_INCREMENT,
  `navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_status` int(1) NOT NULL,
  `navigation_parent` int(11) NOT NULL,
  `navigation_position` int(11) NOT NULL,
  `navigation_url_select` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_id` int(11) NOT NULL,
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `navigation_url`, `navigation_status`, `navigation_parent`, `navigation_position`, `navigation_url_select`, `group_navigation_id`) VALUES
(24, 'Trang chủ', '/', 1, 0, 1, '', 12),
(25, 'Giới thiệu', '', 1, 0, 2, 'gioi-thieu-nc-2', 12),
(26, 'Sản phẩm', 'san-pham', 1, 0, 3, '', 12),
(27, 'Tin tức', '', 1, 0, 4, 'tin-tuc-nc-1', 12),
(28, 'Liên hệ', 'lien-he', 1, 0, 5, '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `news_quote` text COLLATE utf8_unicode_ci,
  `news_content` longtext COLLATE utf8_unicode_ci,
  `news_status` int(11) NOT NULL,
  `news_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_quote`, `news_content`, `news_status`, `news_picture`, `news_category_id`) VALUES
(1, 'Không tìm thấy chất kích thích trong 19 trâu chọi Đồ Sơn', '<p>19/31 tr&acirc;u chọi ở Đồ Sơn được kết luận &acirc;m t&iacute;nh với chất k&iacute;ch th&iacute;ch, tăng lực, ri&ecirc;ng tr&acirc;u h&uacute;c chết chủ chưa c&oacute; kết quả x&eacute;t nghiệm.</p>', '<p class="Normal" style="text-align: center;"><img src="/pictures/contents/trau-choi-9193-1499575091.jpg" alt="" width="500" height="289" /></p>\r\n<p class="Normal">Ng&agrave;y 9/7, một l&atilde;nh đạo UBND quận Đồ Sơn (Hải Ph&ograve;ng) cho biết 19 trong số 31 con tr&acirc;u tham gia v&ograve;ng loại Lễ hội chọi tr&acirc;u Đồ Sơn 2017 đ&atilde; c&oacute; kết quả &acirc;m t&iacute;nh với chất k&iacute;ch th&iacute;ch, tăng lực.</p>\r\n<p class="Normal">Ri&ecirc;ng mẫu phẩm tr&acirc;u số 18 - con tr&acirc;u h&uacute;c chết chủ của m&igrave;nh - đang chờ kết quả từ Bộ C&ocirc;ng an.</p>\r\n<p class="Normal">Trong số 31 tr&acirc;u thi đấu v&ograve;ng loại, chỉ 19 con được lấy mẫu nước tiểu v&agrave; m&aacute;u do số c&ograve;n lại thua trận bị giết thịt gần hết, ngo&agrave;i ra số &iacute;t chủ tr&acirc;u kh&ocirc;ng hợp t&aacute;c lấy mẫu với l&yacute; do t&acirc;m linh.</p>\r\n<p class="Normal">Trước đ&oacute; s&aacute;ng 1/7, tại&nbsp;v&ograve;ng đấu loại Lễ hội chọi tr&acirc;u quận Đồ Sơn, hơn 30 tr&acirc;u tham gia 16 trận đấu. Đến trận 14, tr&acirc;u số 18 h&uacute;c chủ l&agrave; &ocirc;ng Đinh Xu&acirc;n Hướng ngay trong sới chọi. &Ocirc;ng Hướng tử vong sau nhiều giờ cấp cứu.</p>\r\n<p class="Normal">UBND TP Hải Ph&ograve;ng đ&atilde; chỉ đạo dừng lễ hội chọi tr&acirc;u 2017; x&eacute;t nghiệm chất k&iacute;ch th&iacute;ch với c&aacute;c con tr&acirc;u.&nbsp;Ng&agrave;y 4/7,&nbsp;Ban tổ chức lễ hội đ&atilde; họp b&agrave;n, cho ph&eacute;p chủ tr&acirc;u tự lấy mẫu nước tiểu hoặc mẫu m&aacute;u của tr&acirc;u nh&agrave; rồi gửi l&ecirc;n Trung t&acirc;m văn h&oacute;a quận Đồ Sơn để chuyển tiếp C&ocirc;ng an Hải Ph&ograve;ng.</p>\r\n<p class="Normal">C&aacute;ch thức n&agrave;y được một số chuy&ecirc;n gia nhận x&eacute;t thiếu kh&aacute;ch quan v&agrave; ch&iacute;nh x&aacute;c C&oacute; loại chất k&iacute;ch th&iacute;ch chỉ t&aacute;c dụng trong một đến 5 tiếng. Nếu để 3-4 ng&agrave;y sau mới lấy mẫu, chất k&iacute;ch th&iacute;ch đ&atilde; đủ thời gian giải ph&oacute;ng hết khỏi cơ thể người hoặc động vật.</p>', 1, 'news_1499591580_trau-choi-9193-1499575091.jpg', 1),
(2, 'Doanh nghiệp quân đội đang kinh doanh những lĩnh vực gì', '<p>D&ugrave; số lượng kh&ocirc;ng qu&aacute; nhiều nhưng c&aacute;c doanh nghiệp quốc ph&ograve;ng đang giữ vị thế lớn ở nhiều lĩnh vực.</p>', '<p class="Normal" style="text-align: center;"><img src="/pictures/contents/22a4e52c-ac31-432e-bf77-0c670f-1558-2415-1499476232.jpg" alt="" width="500" height="351" /></p>\r\n<p class="Normal">Bộ Quốc ph&ograve;ng hiện l&agrave; bộ trực tiếp quản l&yacute; nhiều tập đo&agrave;n, tổng c&ocirc;ng ty với hơn 20 doanh nghiệp trực thuộc. Do đặc th&ugrave; hoạt động, c&aacute;c tập đo&agrave;n, tổng c&ocirc;ng ty thuộc Bộ Quốc ph&ograve;ng hoạt động tr&ecirc;n rất nhiều lĩnh vực kh&aacute;c nhau, từ x&acirc;y dựng - bất động sản, viễn th&ocirc;ng, t&agrave;i ch&iacute;nh, logistics, cơ kh&iacute;, xăng dầu, cho tới n&ocirc;ng nghiệp.</p>\r\n<p class="Normal">Trong đ&oacute;, nhiều doanh nghiệp hoạt động đang trở th&agrave;nh những doanh nghiệp top đầu trong lĩnh vực kinh doanh của m&igrave;nh như Viettel, Ng&acirc;n h&agrave;ng Qu&acirc;n đội, Tổng c&ocirc;ng ty T&acirc;n Cảng S&agrave;i G&ograve;n, Tổng c&ocirc;ng ty Xăng dầu Qu&acirc;n đội hay Tổng c&ocirc;ng ty Đ&ocirc;ng Bắc...</p>\r\n<p class="Normal">Đứng đầu trong danh s&aacute;ch n&agrave;y l&agrave; Tập đo&agrave;n Viễn th&ocirc;ng Qu&acirc;n đội (Viettel). D&ugrave; chỉ l&agrave; doanh nghiệp duy nhất của Bộ Quốc ph&ograve;ng hoạt động trong lĩnh vực viễn th&ocirc;ng nhưng Viettel lại l&agrave; đơn vị đang giữ vị thế lớn nhất tr&ecirc;n thị trường v&agrave; tạo sự c&aacute;ch biệt lớn với hai nh&agrave; mạng đứng sau l&agrave; VinaPhone v&agrave; Mobifone.</p>\r\n<p class="Normal">Năm 2016, Viettel đạt hơn 226.000 tỷ đồng doanh thu, xấp xỉ 10 tỷ USD v&agrave; hơn 43.000 tỷ đồng lợi nhuận trước thuế. Tổng doanh thu của Viettel cũng gấp gần 3 lần doanh thu của VinaPhone v&agrave; Mobifone cộng lại, đồng thời l&agrave; đơn vị đang đ&oacute;ng g&oacute;p v&agrave;o ng&acirc;n s&aacute;ch lớn nhất trong số c&aacute;c doanh nghiệp quốc ph&ograve;ng, đạt tr&ecirc;n 40.000 tỷ đồng.</p>', 1, 'news_1499591668_22a4e52c-ac31-432e-bf77-0c670f-1558-2415-1499476232.jpg', 1),
(3, 'VTV và SCIC xin rút khỏi dự án tháp truyền hình cao nhất thế giới', '<p>VTV xin tho&aacute;i vốn để tập trung v&agrave;o ph&aacute;t triển truyền h&igrave;nh, trong khi SCIC cho rằng dự &aacute;n kh&ocirc;ng nằm trong danh mục Nh&agrave; nước cần chi phối.&nbsp;</p>', '<div class="fck_detail width_common block_ads_connect">\r\n<p class="Normal">Bộ T&agrave;i ch&iacute;nh vừa c&oacute; c&ocirc;ng văn gửi Văn ph&ograve;ng Ch&iacute;nh phủ b&aacute;o c&aacute;o về dự &aacute;n Th&aacute;p truyền h&igrave;nh Việt Nam v&agrave; phương &aacute;n t&aacute;i cơ cấu vốn đầu tư tại C&ocirc;ng ty cổ phần Th&aacute;p truyền h&igrave;nh Việt Nam.</p>\r\n<p class="Normal">Cơ quan n&agrave;y cho biết, từ cuối th&aacute;ng 5, Đ&agrave;i truyền h&igrave;nh Việt Nam (VTV) đ&atilde; c&oacute; c&ocirc;ng văn đề nghị tho&aacute;i to&agrave;n bộ hoặc phần lớn vốn tại c&ocirc;ng ty tr&ecirc;n. Điều đ&oacute; cũng đồng nghĩa VTV sẽ kh&ocirc;ng tham gia đầu tư dự &aacute;n Th&aacute;p truyền h&igrave;nh Việt Nam - một trong những th&aacute;p theo dự kiến ban đầu sẽ thuộc loại cao nhất thế giới. L&yacute; do của đơn vị n&agrave;y l&agrave; hiện cần tập trung ưu ti&ecirc;n d&agrave;nh nguồn lực đầu tư cho sản xuất chương tr&igrave;nh v&agrave; ph&aacute;t triển kinh doanh trong lĩnh vực truyền h&igrave;nh.&nbsp;</p>\r\n<p class="Normal">Tại c&ocirc;ng văn n&ecirc;u tr&ecirc;n, VTV cũng cho biết Tổng c&ocirc;ng ty Đầu tư v&agrave; Kinh doanh vốn Nh&agrave; nước (SCIC) chủ trương đưa C&ocirc;ng ty cổ phần Th&aacute;p truyền h&igrave;nh Việt Nam v&agrave;o danh mục điều chỉnh triển khai tho&aacute;i vốn (r&uacute;t 100% vốn khỏi c&ocirc;ng ty) do dự &aacute;n kh&ocirc;ng nằm trong danh mục hiện hữu m&agrave; Nh&agrave; nước cần chi phối hoặc đầu tư g&oacute;p vốn trong định hướng ph&aacute;t triển của SCIC.&nbsp;Mặt kh&aacute;c, theo b&aacute;o c&aacute;o của VTV th&igrave; hiện tại dự &aacute;n chưa được Thủ tướng ph&ecirc; duyệt, chưa triển khai thực hiện.</p>\r\n<p class="Normal">Do vậy, Bộ T&agrave;i ch&iacute;nh đề nghị Văn ph&ograve;ng Ch&iacute;nh phủ y&ecirc;u cầu chủ đầu tư dự &aacute;n b&aacute;o c&aacute;o lại Thủ tướng về sự cần thiết phải triển khai dự &aacute;n, mục ti&ecirc;u v&agrave; năng lực thực hiện dự &aacute;n của chủ đầu tư. Trường hợp VTV v&agrave; SCIC kh&ocirc;ng tham gia dự &aacute;n đồng nghĩa với việc Nh&agrave; nước kh&ocirc;ng đầu tư vốn v&agrave;o dự &aacute;n.</p>\r\n<p class="Normal">Bộ T&agrave;i ch&iacute;nh cũng đề nghị VTV v&agrave; SCIC y&ecirc;u cầu c&ocirc;ng ty tổ chức Đại hội đồng cổ đ&ocirc;ng để x&aacute;c định lại sự cần thiết, mục ti&ecirc;u của dự &aacute;n, b&aacute;o c&aacute;o Thủ tướng xem x&eacute;t quyết định.&nbsp;</p>\r\n<p class="Normal">Trước đ&oacute;, dự &aacute;n Th&aacute;p truyền h&igrave;nh Việt Nam được Thủ tướng đồng &yacute; về chủ trương nghi&ecirc;n cứu, hợp t&aacute;c đầu tư từ đầu năm 2015. C&ocirc;ng tr&igrave;nh dự kiến được x&acirc;y dựng tr&ecirc;n khu đất hơn 14 ha tại khu trung t&acirc;m đ&ocirc; thị T&acirc;y Hồ T&acirc;y. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; dự &aacute;n tầm cỡ quốc tế, c&oacute; t&iacute;nh chất đặc th&ugrave; n&ecirc;n cần c&oacute; cơ chế đặc biệt do Thủ tướng quyết định về vốn, h&igrave;nh thức giao đất v&agrave; phương thức chọn nh&agrave; thầu. Dự &aacute;n cũng được &aacute;p dụng ch&iacute;nh s&aacute;ch ưu đ&atilde;i cao nhất theo quy định của ph&aacute;p luật.</p>\r\n<p class="Normal">Tập đo&agrave;n BRG được lựa chọn sau khi Thủ tướng cho ph&eacute;p Đ&agrave;i Truyền h&igrave;nh Việt Nam chọn th&ecirc;m đối t&aacute;c l&agrave; doanh nghiệp tư nh&acirc;n c&oacute; năng lực t&agrave;i ch&iacute;nh v&agrave; kinh doanh, g&oacute;p vốn c&ugrave;ng tham gia dự &aacute;n.</p>\r\n<p class="Normal">Khi đ&oacute;, l&atilde;nh đạo VTV cũng cho biết độ cao của th&aacute;p sẽ l&agrave; 636m, hơn th&aacute;p cao nhất ch&acirc;u &Aacute; hiện nay l&agrave; Sky Tree ở Tokyo - Nhật Bản (634m) v&agrave; th&aacute;p truyền h&igrave;nh Quảng Ch&acirc;u - Trung Quốc (600m) v&agrave; sẽ thuộc loại cao nhất trong số th&aacute;p truyền h&igrave;nh đ&atilde; được x&acirc;y dựng tr&ecirc;n thế giới.&nbsp;</p>\r\n<p class="Normal">C&ocirc;ng ty Cổ phần Th&aacute;p truyền h&igrave;nh được cấp giấy chứng nhận đăng k&yacute; v&agrave;o cuối năm 2015 với số vốn điều lệ 600 tỷ đồng. Theo b&aacute;o c&aacute;o của VTV, đến nay 3 đơn vị g&oacute;p vốn mới g&oacute;p được 150 tỷ đồng.&nbsp;</p>\r\n</div>\r\n<div class="author_mail width_common">&nbsp;</div>', 1, 'news_1499591844_thaptruyenhinh-1499488361_180x108.jpg', 1),
(4, 'Đông Nam Á sắp soán ngôi Trung Quốc về hút đầu tư hậu cần', '<p>Sự b&ugrave;ng nổ thương mại điện tử c&ugrave;ng chi ph&iacute; sản xuất thấp đang khiến nhiều nh&agrave; sản xuất dịch chuyển từ Trung Quốc sang Đ&ocirc;ng Nam &Aacute;.</p>', '<p class="Normal">Trưởng bộ phận Nghi&ecirc;n cứu Thị trường vốn Đ&ocirc;ng Nam &Aacute; Jones Lang LaSalle (JLL), Regina Lim cho biết điểm đến của ng&agrave;nh hậu cần đang c&oacute; sự dịch chuyển mạnh mẽ từ Trung Quốc sang Đ&ocirc;ng Nam &Aacute;. Nguy&ecirc;n nh&acirc;n chủ yếu l&agrave; b&agrave;i to&aacute;n chi ph&iacute; cạnh tranh.</p>\r\n<p class="Normal">Mức lương của Trung Quốc hiện cao hơn 3-4 lần so với trước đ&acirc;y trong khi mức lương nội địa tối thiểu ở một số nước Đ&ocirc;ng Nam &Aacute; lại rẻ hơn. Điều n&agrave;y đang thu h&uacute;t c&aacute;c nh&agrave; sản xuất thiết lập nh&agrave; m&aacute;y tại đ&acirc;y nhằm phục vụ cho số đ&ocirc;ng người ti&ecirc;u d&ugrave;ng ng&agrave;y c&agrave;ng tăng l&ecirc;n. Sản lượng sản xuất của Indonesia c&oacute; thể tăng l&ecirc;n 6,5% trong nửa thập ni&ecirc;n tới, so với 5% hiện tại. C&ograve;n Việt Nam lại l&agrave; quốc gia nổi bật với lực lượng lao động l&agrave;nh nghề v&agrave; chi ph&iacute; tương đối thấp.</p>\r\n<p class="Normal" style="text-align: center;"><img src="/pictures/contents/a-tb-bds-hau-can-kcn-4782-1499432648.jpg" alt="" width="500" height="300" /></p>\r\n<p class="Normal">Theo chuy&ecirc;n gia JLL, quy m&ocirc; thị trường của Đ&ocirc;ng Nam &Aacute; v&agrave; tiềm năng ng&agrave;nh ti&ecirc;u d&ugrave;ng tại đ&acirc;y đang cực kỳ hấp dẫn. Đến năm 2050, Hiệp hội c&aacute;c Quốc gia Đ&ocirc;ng Nam &Aacute; (ASEAN) sẽ c&oacute; quy m&ocirc; tương đương với ch&acirc;u &Acirc;u, trở th&agrave;nh khu kinh tế lớn thứ tư thế giới, sau Trung Quốc, Ấn Độ v&agrave; Mỹ. C&aacute;c nước Đ&ocirc;ng Nam &Aacute; sẽ trở th&agrave;nh c&aacute;c cường quốc; Indonesia được dự b&aacute;o l&agrave; nền kinh tế lớn thứ tư tr&ecirc;n thế giới, trong khi Philippines v&agrave; Việt Nam đứng thứ 19 v&agrave; 20.</p>\r\n<p class="Normal">Nghi&ecirc;n cứu của Google v&agrave; Temasek nhấn mạnh th&ecirc;m tiềm năng của khu vực, dự b&aacute;o rằng thị trường thương mại điện tử c&oacute; thể tăng trưởng từ 5,5 tỷ USD năm 2015 l&ecirc;n 88 tỷ USD năm 2025, trong đ&oacute; Indonesia chiếm 52% thị trường.</p>\r\n<p class="Normal">Nh&acirc;n khẩu học trẻ trong khu vực sẽ sớm th&uacute;c đẩy thời đại của thương mại điện tử. Giới trẻ ở Đ&ocirc;ng Nam &Aacute; rất th&agrave;nh thạo trong việc sử dụng c&aacute;c phương tiện truyền th&ocirc;ng x&atilde; hội v&agrave; họ đang sử dụng c&ocirc;ng nghệ để kh&aacute;m ph&aacute; nhiều hơn. Người ti&ecirc;u d&ugrave;ng dần bỏ qua m&aacute;y t&iacute;nh v&agrave; đang sử dụng điện thoại th&ocirc;ng minh để mua sắm. 20-30% người ở Đ&ocirc;ng Nam &Aacute; đ&atilde; mua sắm trực tuyến qua internet mỗi th&aacute;ng, tương đương Mỹ hoặc Anh.</p>\r\n<p class="Normal">Thị trường tiềm năng n&agrave;y đ&atilde; nằm trong tầm ngắm của c&aacute;c &ocirc;ng lớn thương mại điện tử. Alibaba vừa gia tăng cổ phần của m&igrave;nh trong trang thương mại điện tử lớn nhất khu vực &ndash; Lazada Group, đưa tổng số cổ phần l&ecirc;n 95% v&agrave; ra mắt nền tảng Tmall đang thịnh h&agrave;nh ở Malaysia v&agrave; Singapore. Tập đo&agrave;n n&agrave;y cũng đang thiết lập c&aacute;c trung t&acirc;m hậu cần ở Malaysia v&agrave; Th&aacute;i Lan.</p>\r\n<p class="Normal">Th&aacute;ng trước, Reebonz - thương hiệu thương mại điện tử cao cấp đ&atilde; khai trương một Trung t&acirc;m Thương mại Điện tử c&oacute; diện t&iacute;ch 18.580 m2 tại Singapore, trong khi Singpost đ&atilde; giới thiệu một trụ sở hậu cần thương mại điện tử trị gi&aacute; 131 triệu USD tại C&ocirc;ng vi&ecirc;n Logistics Tampines ở Singapore.</p>\r\n<p class="Normal" style="text-align: center;">&nbsp;</p>', 1, 'news_1499592065_a-tb-bds-hau-can-kcn-4782-1499432648.jpg', 1),
(5, 'Sản lượng Ôtô Trường Hải giảm hơn 5.200 xe', '<p>Thị trường &ocirc;t&ocirc; giảm nhẹ trong nửa đầu năm 2017 v&agrave; Trường Hải l&agrave; nh&agrave; sản xuất c&oacute; số giảm tuyệt đối lớn nhất, hơn 5.200 xe.</p>', '<p class="Normal">Theo số liệu của Hiệp hội c&aacute;c nh&agrave; sản xuất &ocirc;t&ocirc; Việt Nam (VAMA), nh&agrave; sản xuất Trường Hải b&aacute;n được hơn 47.800 xe trong 6 th&aacute;ng đầu năm. So với c&ugrave;ng kỳ 2016, doanh số giảm 10%, tương đương với hơn 5.200 xe. Đ&acirc;y l&agrave; mức giảm cao nhất trong c&aacute;c nh&agrave; sản xuất &ocirc;t&ocirc; nửa đầu năm nay do Trường Hải cũng l&agrave; đơn vị c&oacute; sản lượng đứng đầu thị trường.</p>\r\n<p class="Normal">Tất cả c&aacute;c thương hiệu m&agrave; Trường Hải lắp r&aacute;p đều ghi nhận doanh số giảm. Trong đ&oacute;, Kia giảm 12%, tương đương hơn 1.600 xe; Mazda giảm 8%, tương đương gần 1.200 xe. Ri&ecirc;ng ti&ecirc;u thụ của Peugeot giảm đến 61%, tương đương hơn 200 xe.</p>\r\n<p class="Normal">T&igrave;nh h&igrave;nh kinh doanh của Trường Hải suy giảm diễn ra trong bối cảnh thị trường &ocirc;t&ocirc; Việt Nam nửa đầu năm kh&ocirc;ng c&oacute; tăng trưởng, thậm ch&iacute; l&agrave; giảm nhẹ. VAMA cho hay, ti&ecirc;u thụ xe to&agrave;n thị trường s&aacute;u th&aacute;ng qua đạt khoảng 134.200 chiếc, giảm 1% so với c&ugrave;ng kỳ năm ngo&aacute;i.</p>\r\n<p class="Normal">&nbsp;</p>\r\n<p class="Normal" style="text-align: center;"><img src="/pictures/contents/thaco-2387-1499402334.jpg" alt="" width="500" height="302" /></p>\r\n<p class="Normal">Đ&acirc;y kh&ocirc;ng phải l&agrave; kết quả bất ngờ khi thị trường li&ecirc;n tục ghi nhận những dấu hiệu kh&ocirc;ng mấy s&aacute;ng sủa trong v&agrave;i th&aacute;ng gần đ&acirc;y. Hồi th&aacute;ng 4/2016, sản lượng xe b&aacute;n ra bỗng dưng lao dốc kỳ lạ, giảm đến 15% so với th&aacute;ng 4/2016. Th&aacute;ng 6 vừa rồi, ti&ecirc;u thụ &ocirc;t&ocirc; c&oacute; phần ổn định hơn nhưng cũng giảm 0,2% so với th&aacute;ng 6/2016.</p>\r\n<p class="Normal">Theo nhiều l&yacute; giải, ti&ecirc;u thụ &ocirc;t&ocirc; đang c&oacute; chiều hướng sụt giảm một phần do nhiều người đang c&oacute; t&acirc;m l&yacute; đợi đến đầu năm 2018, thời điểm thuế nhập khẩu &ocirc;t&ocirc; nguy&ecirc;n chiếc từ khu vực ASEAN v&agrave;o Việt Nam giảm xuống c&ograve;n 0% so với mức 30% như hiện nay. Tuy nhi&ecirc;n, trong một dự b&aacute;o đưa ra cuối th&aacute;ng rồi, chủ tịch VAMA Toru Kinoshita cho rằng, thị trường nửa cuối năm vẫn sẽ tăng trưởng. Do đ&oacute;, VAMA giữ nguy&ecirc;n dự b&aacute;o ti&ecirc;u thụ &ocirc;t&ocirc; tăng 10% trong năm 2017 đ&atilde; được đưa ra đầu năm.</p>\r\n<p class="Normal">X&eacute;t kỹ hơn, thị trường 6 th&aacute;ng qua suy giảm sản lượng ở mảng xe lắp r&aacute;p trong nước, với mức 6%. Trong khi đ&oacute;, sản lượng xe nhập khẩu b&aacute;n ra vẫn tăng 15%. Kh&aacute;c với Trường Hải, h&agrave;ng loạt đơn vị vừa sản xuất vừa nhập khẩu đều b&aacute;o c&aacute;o sản lượng ti&ecirc;u thụ tăng.</p>\r\n<p class="Normal">So với nửa đầu năm ngo&aacute;i, Toyota b&aacute;n được nhiều hơn gần 4.800 xe, tương đương tăng trưởng 19%. Mercedes-Benz cũng b&aacute;n th&ecirc;m được hơn 900 chiếc, tăng trưởng đến 37%. GM Việt Nam v&agrave; Mitsubishi cũng tăng ở mức hai con số. Sản lượng xe ti&ecirc;u thụ của Ford tăng nhưng khi&ecirc;m tốn ở mức 4%.</p>\r\n<p class="Normal">Li&ecirc;n tục những th&aacute;ng qua, để thu h&uacute;t người mua, nhiều h&atilde;ng li&ecirc;n doanh lắp r&aacute;p &ocirc;t&ocirc; trong nước kh&ocirc;ng ngần ngại đưa ra c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; l&ecirc;n đến gần trăm triệu đồng mỗi xe, một động th&aacute;i chưa c&oacute; tiền lệ trong ng&agrave;nh kinh doanh &ocirc;t&ocirc; v&agrave;i năm trước đ&acirc;y.</p>\r\n<p class="Normal">Tuy nhi&ecirc;n, chủ tịch VAMA cũng nhận định, c&aacute;c h&atilde;ng v&agrave; đại l&yacute; sẽ kh&oacute; l&ograve;ng giảm th&ecirc;m trong&nbsp;6 th&aacute;ng c&ograve;n lại v&igrave; c&aacute;c mức gi&aacute; hiện nay đ&atilde; gần như "chạm đ&aacute;y" đối với c&aacute;c nh&agrave; lắp r&aacute;p trong nước.</p>', 1, 'news_1499592005_thaco-2387-1499402334.jpg', 1),
(6, 'Thư ngõ', '<p><span style="color: #302f2f; font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: justify;">Trước ti&ecirc;n C&ocirc;ng ty TNHH MTV SX &ndash; TM &ndash; DV Vĩnh Ph&aacute;t gởi lời ch&agrave;o tr&acirc;n trọng cũng như cảm ơn qu&yacute; C&ocirc;ng ty đ&atilde; quan t&acirc;m đến sản phẩm của ch&uacute;ng t&ocirc;i. C&aacute;c sản phẩm do C&ocirc;ng ty sản xuất &ndash; đạt theo TCVN do bộ x&acirc;y dựng bi&ecirc;n soạn v&agrave; ban h&agrave;nh. C&ugrave;ng 1 số chỉ ti&ecirc;u kh&aacute;c do chủ dự &aacute;n y&ecirc;u cầu để ph&ugrave; hợp sử dụng cho từng dự &aacute;n &ndash; c&ocirc;ng tr&igrave;nh sử dụng như: bờ k&egrave; chắn s&oacute;ng &ndash; gạch ốp taluy &ndash; gạch b&ecirc; t&ocirc;ng tự ch&egrave;n cường độ cao chịu được độ ma s&aacute;t m&agrave;i m&ograve;n tốt nhất nhằm phục vụ cho s&acirc;n b&atilde;i &ndash; bến cảng container.</span></p>', '<div class="noidung">\r\n<p><span style="color: #3366ff;">Trước ti&ecirc;n <strong>C&ocirc;ng ty TNHH MTV SX &ndash; TM &ndash; DV Vĩnh Ph&aacute;t</strong></span> gởi lời ch&agrave;o tr&acirc;n trọng cũng như cảm ơn qu&yacute; C&ocirc;ng ty đ&atilde; quan t&acirc;m đến sản phẩm của ch&uacute;ng t&ocirc;i</p>\r\n<p><span style="color: #3366ff;"><strong>C&ocirc;ng ty TNHH MTV SX &ndash; TM &ndash; DV Vĩnh Ph&aacute;t</strong> </span>chuy&ecirc;n hoạt động trong lĩnh vực sản&nbsp;xuất c&aacute;c mặt h&agrave;ng gạch bằng ciment như:&nbsp;</p>\r\n<p>1. Gạch x&acirc;y bằng b&ecirc; t&ocirc;ng cốt liệu (gạch kh&ocirc;ng nung).<br />2. Gạch Block.<br />3. Gạch b&ecirc; t&ocirc;ng tự ch&egrave;n.<br />4. Gạch Tezzarro.<br />5. Gạch ốp taluy.<br />6. Gạch bờ k&egrave;.</p>\r\n<p><br />C&aacute;c sản phẩm do C&ocirc;ng ty sản xuất &ndash; đạt theo TCVN do bộ x&acirc;y dựng bi&ecirc;n soạn v&agrave; ban h&agrave;nh.&nbsp;</p>\r\n<p>C&ugrave;ng 1 số chỉ ti&ecirc;u kh&aacute;c do chủ dự &aacute;n y&ecirc;u cầu để ph&ugrave; hợp sử dụng cho từng dự &aacute;n &ndash; c&ocirc;ng tr&igrave;nh sử dụng như: bờ k&egrave; chắn s&oacute;ng &ndash; gạch ốp taluy &ndash; gạch b&ecirc; t&ocirc;ng tự ch&egrave;n cường độ cao&nbsp;chịu được độ ma s&aacute;t m&agrave;i m&ograve;n tốt nhất nhằm phục vụ cho s&acirc;n b&atilde;i &ndash; bến cảng container.&nbsp;</p>\r\n<p>Trong lĩnh vực sản xuất v&agrave; cung cấp c&aacute;c c&ocirc;ng tr&igrave;nh, ti&ecirc;u ch&iacute; của tập thể c&aacute;n bộ nh&acirc;n vi&ecirc;n của c&ocirc;ng ty- thỏa m&atilde;n nhu cầu sử dụng cũng như sự h&agrave;i l&ograve;ng của kh&aacute;ch h&agrave;ng l&agrave; phương ch&acirc;m hoạt động của ch&uacute;ng t&ocirc;i.</p>\r\n<p>Hệ thống kho b&atilde;i rộng r&atilde;i được trang bị thiết bị n&acirc;ng hạ v&agrave; phương tiện vận tải phục vụ&nbsp;an to&agrave;n &ndash; nhanh ch&oacute;ng. Nh&agrave; m&aacute;y trang bị d&acirc;y chuyền m&aacute;y m&oacute;c, thiết bị c&ocirc;ng nghệ ti&ecirc;n tiến hiện đại, đội ngũ kỹ sư cơ kh&iacute;, huy&ecirc;n gia giỏi, c&ocirc;ng nh&acirc;n kỹ thuật l&agrave;nh nghề lu&ocirc;n đảm bảo c&aacute;c sản phẩm xuất xưởng đạt y&ecirc;u cầu chất lượng, thẩm mỹ ch&iacute;nh x&aacute;c đến từng chi tiết phục vụ cho ng&agrave;nh c&ocirc;ng nghiệp v&agrave; x&acirc;y dựng.</p>\r\n<p>&nbsp;</p>\r\n<p>Nếu qu&yacute; C&ocirc;ng ty c&oacute; nhu cầu cung cấp h&agrave;ng h&oacute;a dịch vụ, vui l&ograve;ng li&ecirc;n hệ địa chỉ b&ecirc;n dưới:</p>\r\n<p>&nbsp;</p>\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td><span style="color: #3366ff;"><strong>&nbsp;&nbsp;</strong></span>\r\n<p><span style="color: #3366ff;"><strong>VĂN PH&Ograve;NG</strong></span><br /><br />151/54 Đường Li&ecirc;n Khu 4-5,P B&igrave;nh Hưng H&ograve;a B,&nbsp;Quận B&igrave;nh T&acirc;n, TP HCM. &nbsp; &nbsp; &nbsp;<br />ĐT: 08.6274.0626 &ndash; 0909.849.626 &nbsp;<br />Fax: 08.3754.5227.&nbsp;<br />Email: <a href="mailto:quocvinh_bp2@yahoo.com">quocvinh_bp2@yahoo.com</a></p>\r\n</td>\r\n<td>\r\n<p>&nbsp;<br /><strong><span style="color: #3366ff;">NH&Agrave; M&Aacute;Y</span><br /></strong><br />Xưởng 1: Ấp 3, X&atilde; An Thạnh, Huyện Bến Lức, Tỉnh Long An<br />Xưởng 2: X&atilde; Ph&uacute; Thạnh, Huyện Nhơn&nbsp;Trạch, Tỉnh Đồng Nai.<br />&nbsp;Xưởng 3: Thị Trấn Long Th&agrave;nh &ndash; Tỉnh&nbsp;Đồng Nai.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br />Rất mong được hợp t&aacute;c với qu&yacute; C&ocirc;ng ty !</p>\r\n<p><br />Tr&acirc;n trọng !<br />Gi&aacute;m đốc</p>\r\n<p>&nbsp;<br />Huỳnh Thị Diễm Th&uacute;y</p>\r\n</div>', 1, 'news_1499948626_872218944851.PNG', 2),
(7, 'Năng lực kinh doanh & phạm vi hoạt động', '<p><span style="color: #302f2f; font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: justify;">C&ocirc;ng ty Vĩnh Ph&aacute;t hoạt động trong lĩnh vực sản xuất gạch b&ecirc; t&ocirc;ng tự ch&egrave;n đ&aacute;p ứng được Y&ecirc;u cầu c&aacute;c c&ocirc;ng tr&igrave;nh c&ocirc;ng nghiệp</span></p>', '<div class="noidung">\r\n<p>C&ocirc;ng ty Vĩnh Ph&aacute;t hoạt động trong lĩnh vực sản xuất gạch b&ecirc; t&ocirc;ng tự&nbsp;ch&egrave;n đ&aacute;p ứng được y&ecirc;u cầu c&aacute;c c&ocirc;ng tr&igrave;nh c&ocirc;ng nghiệp.</p>\r\n<p>&nbsp;Hệ thống kho b&atilde;i rộng r&atilde;i, m&aacute;y m&oacute;c ti&ecirc;n tiến hiện đại, c&ocirc;ng nh&acirc;n kỹ thuật l&agrave;nh nghề lu&ocirc;n đảm bảo c&aacute;c sản phẩm xuất xưởng đạt y&ecirc;u cầu chất lượng, thẩm mỹ, ch&iacute;nh x&aacute;c đến từng chi tiết phục vụ cho ng&agrave;nh c&ocirc;ng nghiệp v&agrave; x&acirc;y dựng.</p>\r\n<p><br /><span style="color: #3366ff;"><strong>PHỤC VỤ TỐT NHẤT</strong></span></p>\r\n<p>&nbsp;Ch&uacute;ng t&ocirc;i xem chất lượng của sản phẩm v&agrave; dịch vụ l&agrave; yếu tố h&agrave;ng đầu, tạo n&ecirc;n uy t&iacute;n của c&ocirc;ng ty. C&aacute;c nh&agrave; đầu tư, c&aacute;c qu&yacute; c&ocirc;ng ty mua v&agrave; sử dụng sản phẩm,dịch vụ của c&ocirc;ng ty lu&ocirc;n được phục vụ v&agrave; đ&aacute;p ứng nhanh mọi y&ecirc;u cầu gi&uacute;p kh&aacute;ch h&agrave;ng đề c&oacute; kết quả tốt nhất.</p>\r\n<p><br /><span style="color: #3366ff;"><strong>GI&Aacute; CẢ CẠNH TRANH</strong></span></p>\r\n<p>&nbsp;C&ocirc;ng ty lu&ocirc;n chủ động nguồn nguy&ecirc;n vật liệu th&ocirc;ng qua trực tiếp, quy tr&igrave;nh sản xuất kh&eacute;p k&iacute;n gi&uacute;p tiết kiệm nguy&ecirc;n vật liệu v&agrave; hao ph&iacute; sản xuất, xếp đỡ h&agrave;ng h&oacute;a trực tiếp đến c&ocirc;ng tr&igrave;nh đ&uacute;ng tiến độ gi&uacute;p kh&aacute;ch <br />h&agrave;ng giảm chi ph&iacute; đầu tư v&agrave; gi&aacute; cả cạnh tranh nhất&hellip;</p>\r\n<p><br /><span style="color: #3366ff;"><strong>CHẤT LƯỢNG H&Agrave;NG H&Oacute;A</strong>&nbsp;</span></p>\r\n<p>C&aacute;c sản phẩm c&ocirc;ng ty sản xuất ra đều sử dụng đ&uacute;ng với m&aacute;c b&ecirc; t&ocirc;ng theo từng chủng loại h&agrave;ng h&oacute;a. Từng l&ocirc; h&agrave;ng khi đến với c&ocirc;ng tr&igrave;nh đều được Trung T&acirc;m Kỹ Thuật Ti&ecirc;u Chuẩn Đo Lường Chất Lượng 3 kiểm tra <br />cường độ b&ecirc; t&ocirc;ng. D&acirc;y chuyền m&aacute;y m&oacute;c hiện đại, bộ phận kiểm tra chất lượng nội bộ nghi&ecirc;m ngặt lu&ocirc;n đảm bảo tất cả c&aacute;c sản phẩm được sản&nbsp;xuất ph&ugrave; hợp với c&aacute;c ti&ecirc;u chuẩn v&agrave; y&ecirc;u cầu khắc khe nhất của c&ocirc;ng&nbsp;tr&igrave;nh. Gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m về chất lượng&hellip;</p>\r\n<p>&nbsp;</p>\r\n<p><span style="color: #3366ff;"><strong>ĐỐI T&Aacute;C L&Acirc;U D&Agrave;I CỦA KH&Aacute;CH H&Agrave;NG</strong></span></p>\r\n<p>Ch&uacute;ng t&ocirc;i nhận thức rằng lợi &iacute;ch kinh doanh của kh&aacute;ch h&agrave;ng l&agrave; yếu tố&nbsp;quan trọng, bằng sự trung thực, chia sẽ tr&aacute;ch nhiệm v&agrave; kh&ocirc;ng ngừng đổi mới về c&ocirc;ng nghệ ti&ecirc;n tiến v&agrave; phương thức phục vụ. Ch&uacute;ng t&ocirc;i mong <br />muốn gi&agrave;nh được sự t&iacute;n nhiệm,niềm tin v&agrave; được tiếp tục hợp t&aacute;c trong tương lai của Qu&yacute; kh&aacute;ch h&agrave;ng&hellip;<br />Tập thể c&ocirc;ng nh&acirc;n vi&ecirc;n c&ocirc;ng ty Vĩnh Ph&aacute;t rất h&acirc;n hạnh phục vụ Qu&yacute; kh&aacute;ch.</p>\r\n</div>', 1, 'news_1499948682_184672326363.PNG', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE IF NOT EXISTS `news_category` (
  `news_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `news_category_parent` int(11) NOT NULL,
  `news_category_status` int(11) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `news_category_name`, `news_category_parent`, `news_category_status`) VALUES
(1, 'Tin tức', 0, 1),
(2, 'Giới thiệu', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_phone` int(11) NOT NULL,
  `order_note` text COLLATE utf8_unicode_ci NOT NULL,
  `order_status` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `order_fee` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_district` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_fullname`, `order_email`, `order_address`, `order_phone`, `order_note`, `order_status`, `order_amount`, `order_fee`, `order_date`, `order_code`, `order_district`) VALUES
(1, 'Anh Tuấn', 'anhtuan1507@gmail.com', 'test địa chỉ', 944518822, 'giao hàng trong giờ hành chính', 1, 2800000, 0, '2017-04-11 15:57:43', '', ''),
(2, 'Anh Tuan', 'anhtuan1507@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 09:33:11', '', ''),
(3, 'asd', 'anhtuan1507@gmail.com', 'tes', 1234033187, 'ttest', 0, 600000, 0, '2017-04-20 09:41:43', '', ''),
(4, 'tu nguyen', 'anhtuan1507@gmail.com', '71', 1234033187, 'sd', 0, 900000, 0, '2017-04-20 09:43:13', '', ''),
(5, 'anh tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'asd', 0, 900000, 0, '2017-04-20 10:02:55', '', ''),
(6, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 11:24:19', '', ''),
(7, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518811, 'test', 0, 800000, 0, '2017-04-20 13:06:49', '', ''),
(8, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518822, 'test', 0, 800000, 0, '2017-04-20 13:09:46', '', ''),
(9, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944517722, 'test', 0, 1000000, 0, '2017-04-20 13:15:36', '', ''),
(10, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518822, 'test', 0, 800000, 0, '2017-04-20 13:18:17', '', ''),
(11, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 944112211, 'test', 0, 600000, 0, '2017-04-20 14:33:26', '', ''),
(12, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 900000, 0, '2017-04-20 14:34:05', '', ''),
(13, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 14:35:17', '', ''),
(14, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 800000, 0, '2017-04-20 14:41:01', '', ''),
(15, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 600000, 0, '2017-04-20 14:42:15', '', ''),
(16, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 9112211, 'test', 0, 600000, 0, '2017-04-20 14:52:28', '', ''),
(17, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 9112211, 'test', 0, 900000, 0, '2017-04-20 14:53:39', '', ''),
(18, 'Anh', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 900000, 0, '2017-04-20 15:06:23', '', ''),
(19, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 800000, 0, '2017-04-20 15:25:15', 'QZ71519', ''),
(20, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'tet', 0, 900000, 0, '2017-04-20 15:29:39', 'QP97920', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_name`, `product_price`, `quality`, `product_id`, `product_picture`, `product_code`) VALUES
(1, 1, 'ANKLE BOOT HEELS', 700000, 4, 1, 'product_1491120796_2017-L2-CK1-90280010-22-5.jpg', 'CK1-90280010_CAMEL'),
(2, 2, 'BASIC PENNY LOAFERS', 600000, 1, 9, 'product_1492000106_2017-L3-CK1-70380574-08-2.jpg', 'CK1-70380574_RED'),
(3, 3, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(4, 4, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(5, 5, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(6, 6, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 7, 'product_1491995964_2016-L2-CK1-80190043-01-3-500.jpg', 'CK1-80190043_BROWN'),
(7, 7, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(8, 8, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(9, 9, 'ANKLE BOOT HEELS', 1000000, 1, 5, 'product_1491312145_2016-L7-SL1-90900002-02-1.jpg', 'CK1-90280010_CAMEL'),
(10, 10, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(11, 11, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(12, 12, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(13, 13, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(14, 14, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(15, 15, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 6, 'product_1491995659_2016-L2-CK1-80190043-02-2-500.jpg', 'CK1-80190043_BROWN'),
(16, 16, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(17, 17, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(18, 18, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(19, 19, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(20, 20, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_status` int(11) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_description` longtext COLLATE utf8_unicode_ci,
  `product_status` int(11) NOT NULL,
  `product_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_price_old` int(11) DEFAULT NULL,
  `product_type_new` int(1) NOT NULL,
  `product_type_sale` int(1) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_code`, `product_price`, `product_description`, `product_status`, `product_picture`, `product_category_id`, `product_price_old`, `product_type_new`, `product_type_sale`) VALUES
(1, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499349159_X1.jpg', 1, 0, 1, 1),
(2, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261717_TP-129-G09V.jpg', 1, 0, 1, 1),
(3, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261731_TP-141-G07D_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(4, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261744_TP-141-G07G_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(5, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261755_TP-165-G16V_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(6, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261771_TP-1001-G06G_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(7, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499349126_TP-2046-G18D GHÉP 8 VIÊN (1).JPG', 1, 0, 1, 1),
(8, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261800_TP-5393-G17X.jpg', 1, 0, 1, 1),
(9, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949803_17dp113-228_188.88888888889x185.jpg', 2, NULL, 1, 1),
(10, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949820_gachterrazzo40x40qp151-274_189.16666666667x185.jpg', 2, NULL, 1, 1),
(11, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949839_images-8-124_185x185.jpg', 2, NULL, 1, 1),
(12, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949857_untitled1-547_186.26712328767x185.png', 2, NULL, 1, 1),
(13, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950002_15-532_175.6420233463x185.png', 1, NULL, 1, 1),
(14, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950017_gach-terrazzo1-640_188.88888888889x185.jpg', 1, NULL, 1, 1),
(15, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950033_php1384790747-412_185x185.jpg', 1, NULL, 1, 1),
(16, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950045_1234-977_178.36322869955x185.png', 1, NULL, 1, 1),
(17, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950057_img72340414-459_185x185.jpg', 1, NULL, 1, 1),
(18, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950074_img72427622-740_185x185.jpg', 1, NULL, 1, 1),
(19, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950093_php1384790747-412_185x185.jpg', 1, NULL, 1, 1),
(20, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950103_gachconsaumaccao640223-889_253.53319057816x185.jpg', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_category_parent` int(11) NOT NULL,
  `product_category_status` int(11) NOT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `product_category_parent`, `product_category_status`) VALUES
(1, 'Gạch nội thất', 0, 1),
(2, 'Gạch ngoại thất', 0, 1),
(3, 'Gạch Block', 0, 1),
(4, 'Gạch Tezzarro', 0, 1),
(5, 'Gạch ốp Taluy', 0, 1),
(6, 'Gạch bờ kè', 0, 1),
(7, 'Gạch xây không nung', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_content` text COLLATE utf8_unicode_ci NOT NULL,
  `template_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_id` int(11) NOT NULL,
  `template_status` int(1) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`template_id`, `template_name`, `template_content`, `template_picture`, `template_url`, `template_type`, `group_template_id`, `template_status`) VALUES
(10, 'Logo', '', 'template_1499951114_l.png', '', '', 6, 1),
(11, 'Nội dung footer', '<p style="text-align: center;"><strong>C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</strong><br /> Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM<br /> Điện thoại: (08) 6274 0626 - 0909 849 626<br /> Email: <a href="mailto:quocvinhbp2@yahoo.com">quocvinh_bp2@yahoo.com</a><br />Website: gachbetongtuchen.vn</p>', '', '', '', 8, 1),
(12, 'Banner 1', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260735_banner1.jpg', '', '', 7, 1),
(13, 'Banner 2', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260916_banner2.png', '', '', 7, 1),
(14, 'Banner 3', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260926_banner3.jpg', '', '', 7, 1),
(15, 'Banner 4', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260937_banner4.jpg', '', '', 7, 1),
(16, 'Thông tin liên hệ', '<p><strong>C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</strong></p>\r\n<p>Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM</p>\r\n<p>Điện thoại: (08) 6274 0626 - 0909 849 626</p>\r\n<p>Email: <a href="mailto:quocvinhbp2@yahoo.com">quocvinh_bp2@yahoo.com</a></p>\r\n<p>Website: gachbetongtuchen.vn</p>', '', '', '', 9, 1),
(17, 'Banner top', '<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;"><span style="font-size: 18pt;"><strong><span style="color: #ff0000;">C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</span></strong></span></p>\r\n<p style="text-align: center;"><strong><span style="font-size: 14pt; color: #0000ff;">Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM</span></strong></p>\r\n<p style="text-align: center;"><strong><span style="font-size: 14pt; color: #0000ff;">Điện thoại: (08) 6274 0626 - 0909 849 626</span></strong></p>', '', '', '', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE IF NOT EXISTS `website` (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `website_title` text COLLATE utf8_unicode_ci NOT NULL,
  `website_description` text COLLATE utf8_unicode_ci NOT NULL,
  `website_keyword` text COLLATE utf8_unicode_ci NOT NULL,
  `website_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`website_id`, `website_title`, `website_description`, `website_keyword`, `website_name`, `website_icon`) VALUES
(1, 'Gạch bê tông', 'Gạch bê tông', 'Gạch bê tông', 'Gạch bê tông', 'favico_1495428489_17438229_191890364645222_7140066770898911232_n.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
