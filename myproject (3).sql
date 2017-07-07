-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2017 at 07:32 PM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myproject`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=113 ;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`acl_id`, `acl_module`, `acl_controller`, `acl_action`, `acl_status`, `acl_name`, `acl_parent`) VALUES
(1, 'admin', 'index', 'index', 1, 'Home', 0),
(2, 'admin', 'build', 'index', 1, 'Danh sách', 3),
(3, NULL, NULL, NULL, 1, 'Quản lý build', 0),
(4, 'admin', 'build', 'add', 1, 'Thêm', 3),
(5, 'admin', 'build', 'delete', 1, 'Xóa', 3),
(6, 'admin', 'build', 'edit', 1, 'Cập nhật', 3),
(7, '', '', '', 1, 'Group Admin', 0),
(8, 'admin', 'groupadmin', 'index', 1, 'Danh sách', 7),
(9, 'admin', 'groupadmin', 'add', 1, 'Thêm', 7),
(10, 'admin', 'groupadmin', 'edit', 1, 'Cập nhật', 7),
(11, 'admin', 'groupadmin', 'delete', 1, 'Xóa', 7),
(12, NULL, NULL, NULL, 1, 'Admin', 0),
(13, 'admin', 'admin', 'index', 1, 'Danh sách', 12),
(14, 'admin', 'admin', 'add', 1, 'Thêm', 12),
(15, 'admin', 'admin', 'delete', 1, 'Xóa', 12),
(16, 'admin', 'admin', 'edit', 1, 'Cập nhật', 12),
(17, NULL, NULL, NULL, 1, 'Menu', 0),
(18, 'admin', 'menu', 'index', 1, 'Danh sách', 17),
(19, 'admin', 'menu', 'add', 1, 'Thêm', 17),
(20, 'admin', 'menu', 'delete', 1, 'Xóa', 17),
(21, 'admin', 'menu', 'edit', 1, 'Cập nhật', 17),
(22, '', '', '', 1, 'Acl', 0),
(23, 'admin', 'acl', 'index', 1, 'Danh sách', 22),
(24, 'admin', 'acl', 'add', 1, 'Thêm', 22),
(25, 'admin', 'acl', 'delete', 1, 'Xóa', 22),
(26, 'admin', 'acl', 'edit', 1, 'Cập nhật', 22),
(29, '', '', '', 1, 'Group menu', 0),
(30, 'admin', 'groupmenu', 'index', 1, 'Danh sách', 29),
(31, 'admin', 'groupmenu', 'add', 1, 'Thêm', 29),
(32, 'admin', 'groupmenu', 'delete', 1, 'Xóa', 29),
(33, 'admin', 'groupmenu', 'edit', 1, 'Cập nhật', 29),
(35, 'admin', 'groupadmin', 'acl', 1, 'Phân quyền', 7),
(36, '', '', '', 1, 'Navigation', 0),
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
(74, 'admin', 'product', 'color', 1, 'Danh sách màu sản phẩm', 62),
(75, 'admin', 'product', 'color-add', 1, 'Thêm màu sản phẩm', 62),
(76, '', '', '', 1, 'Màu sản phẩm', 0),
(77, 'admin', 'color', 'index', 1, 'Danh sách', 76),
(78, 'admin', 'color', 'add', 1, 'Thêm', 76),
(79, 'admin', 'color', 'edit', 1, 'Cập nhật', 76),
(80, 'admin', 'color', 'delete', 1, 'Xóa', 76),
(81, '', '', '', 1, 'Kích thước', 0),
(82, 'admin', 'size', 'index', 1, 'Danh sách', 81),
(83, 'admin', 'size', 'add', 1, 'Thêm', 81),
(84, 'admin', 'size', 'edit', 1, 'Cập nhật', 81),
(85, 'admin', 'size', 'delete', 1, 'Xóa', 81),
(87, 'admin', 'product', 'color-edit', 1, 'Cập nhật màu sản phẩm', 62),
(88, 'admin', 'product', 'color-delete', 1, 'Xóa màu sản phẩm', 62),
(89, 'admin', 'product', 'delete-color-picture', 1, 'Xóa hình trong Màu sản phẩm', 62),
(90, '', '', '', 1, 'Website', 0),
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
(101, '', '', '', 1, 'Cấu trúc câu', 0),
(102, 'admin', 'structure', 'index', 1, 'Danh sách', 101),
(103, 'admin', 'structure', 'edit', 1, 'Cập nhật', 101),
(104, 'admin', 'structure', 'add', 1, 'Thêm', 101),
(105, 'admin', 'structure', 'delete', 1, 'Xóa', 101),
(106, '', '', '', 1, 'Từ vựng', 0),
(107, 'admin', 'vocabulary', 'index', 1, 'Danh sách', 106),
(108, 'admin', 'vocabulary', 'add', 1, 'Thêm', 106),
(109, 'admin', 'vocabulary', 'edit', 1, 'Cập nhật', 106),
(110, 'admin', 'vocabulary', 'delete', 1, 'Xóa', 106);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_fullname`, `contact_email`, `contact_phone`, `contact_content`) VALUES
(5, 'tu nguyen', 'dd@gmail.com', 1234033187, 'Test lời nhắn trong liên hệ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=171 ;

--
-- Dumping data for table `group_acl`
--

INSERT INTO `group_acl` (`group_acl_id`, `acl_id`, `group_admin_id`, `group_acl_status`) VALUES
(1, 2, 1, 1),
(2, 1, 1, 1),
(3, 4, 1, 1),
(4, 5, 1, 1),
(5, 6, 1, 1),
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
(22, 30, 1, 1),
(23, 31, 1, 1),
(24, 32, 1, 1),
(25, 33, 1, 1),
(26, 35, 1, 1),
(27, 7, 1, 1),
(28, 12, 1, 1),
(29, 3, 1, 1),
(30, 17, 1, 1),
(31, 22, 1, 1),
(32, 29, 1, 1),
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
(135, 74, 1, 1),
(136, 75, 1, 1),
(137, 76, 1, 1),
(138, 77, 1, 1),
(139, 78, 1, 1),
(140, 79, 1, 1),
(141, 80, 1, 1),
(142, 81, 1, 1),
(143, 82, 1, 1),
(144, 83, 1, 1),
(145, 84, 1, 1),
(146, 85, 1, 1),
(147, 87, 1, 1),
(148, 88, 1, 1),
(149, 89, 1, 1),
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
(161, 101, 1, 1),
(162, 102, 1, 1),
(163, 103, 1, 1),
(164, 104, 1, 1),
(165, 105, 1, 1),
(166, 106, 1, 1),
(167, 107, 1, 1),
(168, 108, 1, 1),
(169, 109, 1, 1),
(170, 110, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_admin`
--

CREATE TABLE IF NOT EXISTS `group_admin` (
  `group_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_admin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_admin_status` int(1) NOT NULL,
  PRIMARY KEY (`group_admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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
(9, 1, 15, 1),
(10, 1, 16, 1),
(11, 1, 17, 1),
(12, 1, 18, 1),
(13, 1, 19, 1),
(14, 1, 20, 1),
(15, 1, 21, 1),
(16, 1, 22, 1),
(26, 1, 23, 1),
(27, 1, 24, 1),
(28, 1, 25, 1),
(29, 1, 26, 0),
(30, 1, 27, 0),
(31, 1, 28, 1),
(32, 1, 29, 1),
(33, 1, 30, 1),
(34, 1, 31, 1),
(35, 1, 32, 1),
(36, 1, 33, 0),
(37, 1, 34, 0),
(38, 1, 35, 0),
(39, 1, 36, 0),
(40, 1, 37, 0),
(41, 1, 38, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_parent`, `menu_status`, `menu_url`) VALUES
(6, 'Group admin', 10, 1, 'admin/group-admin'),
(7, 'Admin', 10, 1, 'admin/admin'),
(8, 'Menu', 10, 1, 'admin/menu'),
(9, 'Acl', 10, 1, 'admin/acl'),
(10, 'System', 0, 1, '#'),
(14, 'Giao diện', 0, 1, '#'),
(15, 'Menu top', 14, 1, 'admin/navigation'),
(16, 'Bài viết', 0, 1, ''),
(17, 'Trang nội dung', 16, 1, 'admin/page'),
(18, 'Danh mục Blog', 16, 1, 'admin/news-category'),
(19, 'Blog', 16, 1, 'admin/news'),
(20, 'Sản phẩm', 0, 1, ''),
(21, 'Danh mục sản phẩm', 20, 1, 'admin/product-category'),
(22, 'Sản phẩm', 20, 1, 'admin/product'),
(23, 'Giỏ hàng', 0, 1, '#'),
(24, 'Quản lý đơn hàng', 23, 1, 'admin/order'),
(25, 'Giao diện', 14, 1, 'admin/template'),
(28, 'Thông tin Website', 29, 1, 'admin/website'),
(29, 'Website', 0, 1, ''),
(30, 'Khách hàng', 0, 1, ''),
(31, 'Email đăng ký', 30, 1, 'admin/email-customer'),
(32, 'Liên hệ', 30, 1, 'admin/contact');

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
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `navigation_url`, `navigation_status`, `navigation_parent`, `navigation_position`, `navigation_url_select`) VALUES
(1, 'Trang chủ', './', 1, 0, 1, ''),
(2, 'Sản phẩm', 'san-pham', 1, 0, 2, ''),
(3, 'Bộ sưu tập', '', 1, 0, 5, 'bo-suu-tap-nc-2'),
(4, 'Liên hệ', 'lien-he', 1, 0, 6, ''),
(6, 'Boots', '', 1, 2, 0, 'boots-pc-1'),
(7, 'Sale', 'san-pham-sale', 1, 0, 4, ''),
(8, 'Espadrilles', '', 1, 2, 2, 'espadrilles-pc-2'),
(9, 'Flats', '', 1, 2, 3, 'flats-pc-3'),
(10, 'Mới', 'san-pham', 1, 0, 3, '');

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
(4, 'More from our blog', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam.</p>', '<div id="breadcrumb" class="desktop-12">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut eleifend malesuada aliquam. Praesent tincidunt dui velit, vitae feugiat nulla pulvinar ac. Nunc auctor volutpat urna eget posuere. Nulla posuere ex sit amet libero rutrum fringilla. Aliquam a augue vulputate, viverra diam a, varius nibh. Donec consectetur aliquet justo et suscipit. Etiam sed massa nunc.</div>\r\n<div class="desktop-12">&nbsp;</div>\r\n<div class="desktop-12"><img src="/pictures/1175x774-3_1000x.jpg" alt="" width="1000" height="659" /></div>\r\n<div class="desktop-12">&nbsp;</div>\r\n<div class="desktop-12">\r\n<p>Nunc semper sapien vitae felis laoreet, ut vehicula sem placerat. Etiam malesuada lacus sit amet justo efficitur porttitor. Curabitur quis nisi ut augue blandit sollicitudin quis a orci. Ut at neque eu metus ultricies pellentesque at ut sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi vestibulum nisi consequat dui tincidunt lacinia. Phasellus feugiat ullamcorper arcu nec fermentum. Suspendisse potenti. Aenean eleifend dui eget laoreet molestie. Praesent a arcu bibendum, condimentum orci vel, iaculis quam. Aenean non placerat ex. Nunc odio ligula, porttitor sit amet pharetra id, dignissim dapibus erat. Vestibulum non consectetur tortor. Vestibulum eget laoreet nisi.</p>\r\n<p>Ut ut ornare turpis. Etiam id sem tristique, pulvinar nunc vitae, venenatis ipsum. Phasellus tristique dapibus congue. Morbi elementum justo eu eleifend gravida. Etiam mollis tristique eros tempus pretium. Quisque egestas nisl arcu, vitae porta mi posuere at. Aenean mattis a ante nec pulvinar. Suspendisse sit amet odio sed urna consequat tincidunt. Integer a euismod nunc. Nunc sed euismod tellus, vitae sodales leo.</p>\r\n</div>', 1, 'news_1491122888_1175x774-3_1000x.jpg', 2),
(5, 'More from our blog', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut eleifend malesuada aliquam. Praesent tincidunt dui velit, vitae feugiat nulla pulvinar ac. Nunc auctor volutpat urna eget posuere. Nulla posuere ex sit amet libero rutrum fringilla. Aliquam a augue vulputate, viverra diam a, varius nibh. Donec consectetur aliquet justo et suscipit. Etiam sed massa nunc.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="/pictures/charles-keith-stories-robyn-kotze-2-blog-2.jpg" alt="" width="720" height="480" /></p>\r\n<p>Nunc semper sapien vitae felis laoreet, ut vehicula sem placerat. Etiam malesuada lacus sit amet justo efficitur porttitor. Curabitur quis nisi ut augue blandit sollicitudin quis a orci. Ut at neque eu metus ultricies pellentesque at ut sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi vestibulum nisi consequat dui tincidunt lacinia. Phasellus feugiat ullamcorper arcu nec fermentum. Suspendisse potenti. Aenean eleifend dui eget laoreet molestie. Praesent a arcu bibendum, condimentum orci vel, iaculis quam. Aenean non placerat ex. Nunc odio ligula, porttitor sit amet pharetra id, dignissim dapibus erat. Vestibulum non consectetur tortor. Vestibulum eget laoreet nisi.</p>\r\n<p>Ut ut ornare turpis. Etiam id sem tristique, pulvinar nunc vitae, venenatis ipsum. Phasellus tristique dapibus congue. Morbi elementum justo eu eleifend gravida. Etiam mollis tristique eros tempus pretium. Quisque egestas nisl arcu, vitae porta mi posuere at. Aenean mattis a ante nec pulvinar. Suspendisse sit amet odio sed urna consequat tincidunt. Integer a euismod nunc. Nunc sed euismod tellus, vitae sodales leo.</p>', 1, 'news_1491122961_charles-keith-stories-robyn-kotze-2-blog-2.jpg', 2),
(6, 'More from our blog', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut eleifend malesuada aliquam. Praesent tincidunt dui velit, vitae feugiat nulla pulvinar ac. Nunc auctor volutpat urna eget posuere. Nulla posuere ex sit amet libero rutrum fringilla. Aliquam a augue vulputate, viverra diam a, varius nibh. Donec consectetur aliquet justo et suscipit. Etiam sed massa nunc.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="/pictures/charles-keith-stories-robyn-kotze-2-blog-1.jpg" alt="" width="720" height="480" /></p>\r\n<p>Nunc semper sapien vitae felis laoreet, ut vehicula sem placerat. Etiam malesuada lacus sit amet justo efficitur porttitor. Curabitur quis nisi ut augue blandit sollicitudin quis a orci. Ut at neque eu metus ultricies pellentesque at ut sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi vestibulum nisi consequat dui tincidunt lacinia. Phasellus feugiat ullamcorper arcu nec fermentum. Suspendisse potenti. Aenean eleifend dui eget laoreet molestie. Praesent a arcu bibendum, condimentum orci vel, iaculis quam. Aenean non placerat ex. Nunc odio ligula, porttitor sit amet pharetra id, dignissim dapibus erat. Vestibulum non consectetur tortor. Vestibulum eget laoreet nisi.</p>\r\n<p>Ut ut ornare turpis. Etiam id sem tristique, pulvinar nunc vitae, venenatis ipsum. Phasellus tristique dapibus congue. Morbi elementum justo eu eleifend gravida. Etiam mollis tristique eros tempus pretium. Quisque egestas nisl arcu, vitae porta mi posuere at. Aenean mattis a ante nec pulvinar. Suspendisse sit amet odio sed urna consequat tincidunt. Integer a euismod nunc. Nunc sed euismod tellus, vitae sodales leo.</p>', 1, 'news_1495428075_17333218_769276043240522_1165939258423246848_n.jpg', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `news_category_name`, `news_category_parent`, `news_category_status`) VALUES
(2, 'Bộ sưu tập', 0, 1);

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
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_name`, `product_price`, `quality`, `product_id`, `product_picture`, `product_code`, `color`, `size`) VALUES
(1, 1, 'ANKLE BOOT HEELS', 700000, 4, 1, 'product_1491120796_2017-L2-CK1-90280010-22-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(2, 2, 'BASIC PENNY LOAFERS', 600000, 1, 9, 'product_1492000106_2017-L3-CK1-70380574-08-2.jpg', 'CK1-70380574_RED', 'Black', '37'),
(3, 3, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW', 'Black', '37'),
(4, 4, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(5, 5, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '38'),
(6, 6, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 7, 'product_1491995964_2016-L2-CK1-80190043-01-3-500.jpg', 'CK1-80190043_BROWN', 'Black', '37'),
(7, 7, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(8, 8, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(9, 9, 'ANKLE BOOT HEELS', 1000000, 1, 5, 'product_1491312145_2016-L7-SL1-90900002-02-1.jpg', 'CK1-90280010_CAMEL', 'Camel', '38'),
(10, 10, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '38'),
(11, 11, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW', 'Black', '37'),
(12, 12, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '38'),
(13, 13, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW', 'Camel', '37'),
(14, 14, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '37'),
(15, 15, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 6, 'product_1491995659_2016-L2-CK1-80190043-02-2-500.jpg', 'CK1-80190043_BROWN', 'Camel', '38'),
(16, 16, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW', 'Camel', '38'),
(17, 17, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '38'),
(18, 18, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(19, 19, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL', 'Black', '37'),
(20, 20, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL', 'Camel', '38');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `page_title`, `page_content`, `page_status`) VALUES
(1, 'Giới thiệu', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut eleifend malesuada aliquam. Praesent tincidunt dui velit, vitae feugiat nulla pulvinar ac. Nunc auctor volutpat urna eget posuere. Nulla posuere ex sit amet libero rutrum fringilla. Aliquam a augue vulputate, viverra diam a, varius nibh. Donec consectetur aliquet justo et suscipit. Etiam sed massa nunc.</p>', 1),
(2, 'Mua hàng', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur turpis lorem, maximus id luctus nec, suscipit non quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut eleifend malesuada aliquam. Praesent tincidunt dui velit, vitae feugiat nulla pulvinar ac. Nunc auctor volutpat urna eget posuere. Nulla posuere ex sit amet libero rutrum fringilla. Aliquam a augue vulputate, viverra diam a, varius nibh. Donec consectetur aliquet justo et suscipit. Etiam sed massa nunc.</p>', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `product_category_parent`, `product_category_status`) VALUES
(1, 'Boots', 0, 1),
(2, 'Espadrilles', 0, 1),
(3, 'Flats', 0, 1);

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
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`template_id`, `template_name`, `template_content`, `template_picture`, `template_url`, `template_type`) VALUES
(3, 'Phần banner trang chủ', '', 'template_1495428733_17438229_191890364645222_7140066770898911232_n.jpg', '', 'picture');

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
(1, 'kaylee', 'kaylee', 'asaskaylee', 'kaylee', 'favico_1495428489_17438229_191890364645222_7140066770898911232_n.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
