-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 02, 2021 lúc 09:43 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_sach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0 là nữ 1 là nam 2 là khác',
  `birthday` date DEFAULT NULL,
  `type` tinyint(4) DEFAULT 0 COMMENT '0 là khách hàng, 1 là quản trị viên, 2 là giám đóc',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `phone`, `password`, `address`, `image`, `sex`, `birthday`, `type`, `created`, `updated`) VALUES
(1, 'Phạm Minh Hy', 'minhhy@gmail.com', '0765517087', 'minhhy', 'Vũng Tàu', '1.jpg', 0, '2000-03-12', 2, '2020-08-03 09:06:13', '2020-08-03 09:06:13'),
(2, 'Đỗ Nhật Quang', 'nhatquang@gmail.com', '0329778813', 'nhatquang', 'TP.HCM', '2.jpg', 0, '2000-07-11', 1, '2020-08-03 09:06:13', '2020-08-03 09:06:13'),
(3, 'Lê Văn Huy', 'vanhuy@gmail.com', '0786141234', 'vanhuy', 'TP.HCM', '3.jpg', 0, '2000-03-12', 1, '2020-08-03 09:06:13', '2020-08-03 09:06:13'),
(4, 'Phạm Tấn Lâm', 'tanlam@gmail.com', '0376525406', 'tanlam', 'TP.HCM', '4.jpg', 0, '2000-10-30', 1, '2020-08-03 09:06:13', '2020-08-03 09:06:13'),
(5, 'hy', 'hy@gmail.com', '0765517087', 'hy', '1190', NULL, NULL, '2020-10-07', 0, '2020-10-20 01:50:41', '2020-10-20 01:50:41'),
(6, 'Tấn Lâm', 'lam@gmail.com', '076123456', NULL, '123 phan văn trị, gò vấp, Tp.hcm', NULL, NULL, '2020-10-03', 0, '2020-10-21 00:58:30', '2020-10-21 00:58:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 là hiện 1 là ẩn',
  `parent_id` int(11) DEFAULT 0,
  `ordering` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `parent_id`, `ordering`) VALUES
(1, 'Sách văn học', 0, 0, 0),
(2, 'Văn Học Việt Nam', 0, 1, 0),
(3, 'Văn Học Nước Ngoài', 0, 1, 0),
(7, 'Sách kinh tế', 0, 0, 0),
(8, 'Bài học kinh doanh', 0, 7, 0),
(9, 'Sách doanh nhân', 0, 7, 0),
(10, 'Sách khởi nghiệp', 0, 7, 0),
(11, 'Sách kinh tế học', 0, 7, 0),
(12, 'Sách kĩ năng làm việc', 0, 7, 0),
(13, 'Truyện', 0, 0, 0),
(14, 'Truyện Tranh', 0, 13, 0),
(15, 'Truyện Cười', 0, 13, 0),
(16, 'Truyện Cổ Tích', 0, 13, 0),
(18, 'Truyện ngôn tình', 0, 13, 0),
(19, 'Tiểu thuyết', 0, 0, 0),
(20, 'Trong nước', 0, 19, 0),
(21, 'Ngoài nước', 0, 19, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `acc_id` int(11) DEFAULT 0,
  `proc_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` tinyint(4) DEFAULT 0,
  `type` tinyint(4) DEFAULT 0 COMMENT '0 là slide, 1 là banner, 2 là post',
  `status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `title`, `content`, `img_link`, `ordering`, `type`, `status`) VALUES
(1, 'Miễn phí giao hàng', 'Cho các đơn từ 500,000đ ', 'service-1.png', 3, 3, 0),
(2, 'Hoàn 100% tiền mặt', 'Cho các sản phẩm bị lỗi', 'service-2.png', 2, 3, 0),
(3, 'An tâm khi thanh toán', 'Được kiểm tra giao diện sản phẩm trước khi thanh toán', 'service-3.png', 1, 3, 0),
(4, '', '', '20.jpg', 4, 3, 0),
(5, 'Comic', '', 'comic.jpg', 0, 1, 0),
(6, 'Tiểu Thuyết Nước Ngoài Kinh Điển', '', '5.jpg', 0, 1, 0),
(7, 'Tiểu Thuyết Nước Ngoài Kinh Điển', '<p>Sale up to 30% off</p>', '5.jpg', 0, 1, 0),
(8, 'Sale 50%', '', '33.jpg', 0, 1, 0),
(9, 'Banner', '', '15.png', 0, 1, 0),
(11, '', '', '1607398386_MB-920x420.jpg', 0, 0, 0),
(12, '', '', '1607398932_TrangComicManga_main_920x420.jpg', 0, 0, 0),
(13, '', '', '1607399013_920x420_TruyenThongChuongTrinh.jpg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 là hiện, 1 là ẩn',
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `author`, `title`, `content`, `ordering`, `status`, `created`) VALUES
(1, 1, 'Khuyến mãi 40% cho các mẫu sách ', 'Chỉ cần bạn là nữ, thế giới cứ để đàn ông lo!!!\r\nNhân ngày mùng 8/3 shop khuyến mãi 40% các mặt hàng đối với khách hàng là nữ. Ngoài ra, shop nhận giao hàng miên phí và gửi tặng những món quà tri ân đối với khách hàng trong dịp Quốc tế Phụ nữ 8/3.\r\nThời gian áp dụng chương trình: Từ ngày 08/03/2020 đến hết ngày 10/3/2020', 0, 0, '2020-08-03 09:06:13'),
(2, 4, 'Phương pháp đọc sách hiệu quả', 'Để hình thành phương pháp đọc sách, bước đầu các bạn nên áp dụng quy trình sau đây. Dần dần, trên cơ sở đó, các bạn có thể tìm được một phương pháp phù hợp. <br><br><strong>Bước 1: Xác định mục đích đọc sách.</strong><br><br> Đây là vấn đề rất quan trọng. X.I. Povarlin đã nói: \"Phương pháp đọc tuỳ thuộc vào mục đích, và hoàn toàn do mục đích quy định\". Mục đích đọc sách sẽ chi phối toàn bộ quá trình đọc sách. Xác định được mục đích đọc sách sẽ giúp các bạn tránh được đọc tràn lan, tốn công sức và thời gian. Mục đích đọc còn giúp các bạn có cách đọc hợp lí, phù hợp với nhiệm vụ và thời gian có thể dành cho đọc sách. Xác định mục đích đọc sách là trả lời câu hỏi: \"Đọc để làm gì?\". Từ đó mới trả lời được câu hỏi: \"Đọc sách gì, chỗ nào, và đọc như thế nào?\". Mục đích đọc sách còn quyết định cả phương hướng khai thác vấn đề trong cùng một cuốn sách. <br><br><img src=\"https://taodoituong.com/wp-content/uploads/2019/12/T%E1%BB%95ng-h%E1%BB%A3p-k%C4%A9-n%C4%83ng-c%C3%A1ch-%C4%91%E1%BB%8Dc-s%C3%A1ch-nhanh-hi%E1%BB%87u-qu%E1%BA%A3-nh%E1%BA%A5t-2020-2.jpg\" alt=\"\" width=\"1280\" height=\"640\"><br>Ví dụ, khi đọc Truyện Kiều của Nguyễn Du, có bạn yêu thơ thì tìm những cách diễn đạt các sự vật, hiện tượng bằng thơ và những câu thơ lục bát hay; có bạn tìm hiểu cuộc đời nàng Kiều và cốt truyện; có bạn lại qua đó mà hiểu biết đời sống văn hoá, phong tục, tập quán, lễ nghi phong kiến; có bạn lại đi tìm sự phê phán những định kiến và luật lệ đã áp bức người phụ nữ... Vì vậy, xác định rõ mục đích đọc sách là việc làm quan trọng trước tiên đối với mỗi người chúng ta. <br><br><strong>Bước 2: Tìm hiểu địa chỉ cuốn sách. </strong><br><br>Bạn đọc hai trang đầu và trang cuối của cuốn sách để biết: <br><br>- Tên cuốn sách. <br><br>- Tên tác giả. <br><br>- Tên nhà xuất bản. <br><br>- Năm xuất bản. <br><br>- Lần xuất bản. <br><br>Bạn không nên xem thường thao tác này.\n	Những thông tin trên đây sẽ giúp bạn rất nhiều. <br><br>Bạn vừa đọc xong một quyển sách hay, bạn gặp một người bạn thân và trò chuyện huyên thuyên với người bạn này về quyển sách đó. Nhưng khi người bạn hỏi tên quyển sách và tên tác giả để bạn đó tìm đọc, thì bạn lại không nhớ, không trả lời được. Bạn có rơi vào tình trạng này bao giờ chưa? Nếu có thì chắc chắn là bạn đã bỏ qua thao tác tưởng chừng vô ích ở trên rồi đó. <br><br>Không chỉ vậy, những thông tin này còn rất tiện lợi khi bạn đi mua sách và tìm sách trong thư viện. Bạn sẽ cung cấp những thông tin về quyển sách bạn cần tìm cho nhân viên nhà sách hoặc người thủ thư, và họ sẽ giúp bạn tìm quyển sách đó một cách dễ dàng. <br><br>Đứng trước những kệ sách với không biết cơ man nào là sách, mà không có được những thông tin trên, thì làm sao bạn có thể nào tìm được quyển sách bạn cần. Phải không bạn?', 0, 0, '2020-08-03 09:06:13'),
(3, 2, 'TOP NHỮNG CUỐN SÁCH VĂN HỌC HAY NHẤT MỌI THỜI ĐẠI NÊN ĐỌC', '<strong>THEO BẠN NHƯ THẾ NÀO LÀ MỘT CUỐN SÁCH HAY MỌI THỜI ĐẠI?<br><br></strong> Với mình thì ngoài việc nó tồn tại được qua hàng trăm năm, luôn nằm trong best seller thì quyển sách đó còn mang lại giá trị lớn lao nhất cho người đọc. <br><br>Trong bài viết này bolg review sách hay xin giới thiệu 3 cuốn sách văn học mà mình nghĩ là hay nhất mọi thời đại cũng như những ý nghĩa, giá trị mà nó mang lại. Khi đọc những cuốn sách này mình thực sự đã nghiệm ra rất nhiều điều ​ ​<br><br>\r\n<h2 class=\"wsite-content-title\"><span size=\"4\" style=\"font-size: large;\">01. NHÀ GIẢ KIM</span></h2>\r\n<br><br>Nhà Giả Kim của Paulo Coelho được xuất bản vào năm 1988, tuy nhiên từ đó đến nay nó luôn là quyển sách nằm trong top bán chạy trên thế giới. Bạn có thể để ý thấy trên mọi sàn TMĐT việt nam như tiki, shopee, fahasa,... quyển sách này đều xuất hiện là top seller. <br><br>Là một tiểu thuyết kể về hành trình trải nghiệm, theo đuổi vận mệnh của Santiago. Qua đó giúp cậu thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.<br><br><img src=\"https://tavoimi.com/wp-content/uploads/2019/03/review-nha-gia-kim-tavoimi.jpg\" alt=\"Sách NHÀ GIẢ KIM\" width=\"500\" height=\"350\"><br><br>\r\n<h2 class=\"wsite-content-title\"><span size=\"4\" style=\"font-size: large;\">02. HOÀNG TỬ BÉ</span></h2>\r\n<div class=\"paragraph\"><span>Có thể nói Hoàng Tử Bé là cuốn tiểu thuyết dành cho thiếu nhi thu hút được lượng lớn độc giả lớn tuổi. Không đơn giản chỉ là một quyển tiểu thuyết, Hoàng Tử Bé còn lồng ghép những bài học, câu chuyện khiến người đọc phải suy ngẫm.</span><br><br><span>Hoàng Tử Bé được viết ở New York trong những ngày sống lưu vong của tác giả. Được xuất bản lần đầu vào năm 1943.<br><br><img src=\"https://ngaocontent.com/wp-content/uploads/2020/05/hoang-tu-be.jpg\" alt=\"SÁCH HOÀNG TỬ BÉ\" width=\"1200\" height=\"878\"></span><br><br></div>\r\n<br>\r\n<div class=\"blog-content\">\r\n<h2 class=\"wsite-content-title\"><span size=\"4\" style=\"font-size: large;\">03.\r\n	GIẾT CON CHIM NHẠI</span></h2>\r\n<div class=\"paragraph\"><span>Gần 50 năm từ ngày đầu ra mắt, Giết con chim nhại, tác phẩm đầu tay và cũng là cuối cùng của nữ nhà văn Mỹ Harper Lee vẫn có một sức hút mãnh liệt với mọi độc giả và lứa tuổi.<br><br></span>Cho dù được kể dưới góc nhìn của một cô bé, cuốn sách Giết con chim nhại không né tránh bất kỳ vấn đề nào, gai góc hay lớn lao, sâu xa hay phức tạp: nạn phân biệt chủng tộc, những định kiến khắt khe, sự trọng nam khinh nữ…<br>​<br>Ngoài ra những thông điệp yêu thương trải khắp các chương là một trong những lý do khiến Giết Con Chim Nhại trở thành một quyển sách tuyệt vời nhất.<br><br><img src=\"https://revelogue.com/wp-content/uploads/2020/02/Anh_minh_hoa_Giet_con_chim_nhai-e1582381241157.jpg\" alt=\"SÁCH GIẾT CON CHIM NHẠI\" width=\"1000\" height=\"798\"></div>\r\n</div>', 0, 0, '2020-08-03 09:06:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nxb`
--

CREATE TABLE `nxb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nxb`
--

INSERT INTO `nxb` (`id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'NXB kim đồng', '', '', ''),
(2, 'NXB tuổi trẻ', '', '', ''),
(3, 'NXB báo lao động ', '', '', ''),
(4, 'NXB thành công', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `deliveri` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT 0,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 là chưa duyệt, 1 đang giao hàng, 2 là Hủy, 3 là đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `acc_id`, `payment_id`, `created`, `deliveri`, `name`, `phone`, `address`, `amount`, `status`) VALUES
(1, 5, NULL, '2020-10-20 01:50:41', '0000-00-00 00:00:00', 'minh hy', '0765517087', '1190 đường 30/4, Vũng tàu', 0, 3),
(2, 6, NULL, '2020-10-21 00:58:30', '0000-00-00 00:00:00', 'Tấn Lâm', '076123456', '123 phan văn trị, gò vấp, Tp.hcm', 0, 3),
(8, 5, NULL, '2020-12-28 13:12:27', '0000-00-00 00:00:00', 'hy', '0765517087', '1190', 0, 3),
(9, 5, NULL, '2020-12-29 05:46:37', '0000-00-00 00:00:00', 'liên', '0786141234', 'lien ktx', 0, 1),
(10, 5, NULL, '2020-12-29 16:16:01', '0000-00-00 00:00:00', 'hy', '0765517087', '1190', 0, 0),
(11, 5, NULL, '2020-12-30 00:50:24', '0000-00-00 00:00:00', 'quang', '0123456789', 'ktx khu b', 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `orders_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`orders_id`, `prod_id`, `quantity`, `price`) VALUES
(1, 26, 1, 230000),
(2, 3, 1, 100000),
(8, 26, 1, 230000),
(9, 23, 1, 420000),
(10, 23, 1, 420000),
(11, 26, 1, 230000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `price` float DEFAULT 0,
  `sale_price` float DEFAULT 0,
  `view` int(11) DEFAULT 0,
  `mota` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 là hiện, 1 là ẩn, 2 là sản phẩm mới',
  `anh_bia` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anh_phu` text COLLATE utf8_unicode_ci DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT 0,
  `lang` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `tacgia_id` int(11) NOT NULL,
  `nxb_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `sale_price`, `view`, `mota`, `status`, `anh_bia`, `anh_phu`, `created`, `updated`, `quantity`, `lang`, `cate_id`, `tacgia_id`, `nxb_id`) VALUES
(2, 'LÀM ĐĨ', 80000, 70000, 0, '', 0, 'lamdi.jpg', '', '2020-07-04 20:06:11', '2020-07-09 07:25:35', 20, 'Tiếng Việt', 2, 8, 2),
(3, 'CHIẾC LÁ CUỐI CÙNG', 120000, 100000, 0, '', 0, 'chieclacuoicung.jpg', '', '2020-07-04 20:06:11', '2020-07-08 20:38:08', 15, 'Tiếng Nhật', 3, 5, 3),
(9, 'TẮT ĐÈN ', 100000, 80000, 0, '', 0, 'tatden.jpg', '', '2020-07-04 20:06:11', '2020-07-09 07:27:17', 50, 'Tiếng Việt', 2, 10, 2),
(10, 'NHỮNG NGƯỜI KHỐN KHỔ', 300000, 250000, 0, '', 0, 'nhungngoikhonkho.jpg', '', '2020-07-04 20:06:11', '2020-07-09 07:26:14', 25, 'Tiếng Việt', 3, 6, 3),
(15, 'ĐƯỜNG RA BIỂN LỚN', 200000, 199000, 0, '', 0, 'duongrabienlon.jpg', '', '2020-07-04 20:06:11', '2020-07-08 20:48:43', 2000, 'Tiếng Việt', 8, 12, 1),
(16, 'A BIOGRAPHY', 300000, 260000, 0, '', 0, 'abiography.jpg', '', '2020-07-04 20:06:11', '2020-07-08 20:54:14', 53, 'Tiếng Việt', 9, 13, 1),
(17, 'KHỞI NGHIỆP 4.0', 120000, 100000, 0, '', 0, 'khoi-nghiep-4.0.jpg', '', '2020-07-04 20:06:11', '2020-07-08 20:59:10', 25, 'Tiếng Việt', 10, 14, 1),
(18, 'KHI NÀO CƯỚP NHÀ BĂNG', 180000, 160000, 0, '', 0, 'KHINAOCUOPNHABANG.png', '', '2020-07-04 20:06:11', '2020-07-08 21:03:25', 80, 'Tiếng Việt', 11, 15, 1),
(19, 'TÔI TƯ DUY - TÔI THÀNH ĐẠT', 180000, 130000, 3, '', 2, 'toituduy.jpg', '', '2020-07-04 20:06:11', '2020-07-08 21:08:05', 66, 'Tiếng Việt', 12, 16, 2),
(21, 'DORAEMON : NOBITA Ở VƯƠNG QUỐC CHÓ MÈO', 50000, 42000, 4, '', 2, 'doraemon.jpg', '', '2020-07-04 20:06:11', '2020-07-08 21:11:10', 124, 'Tiếng Nhật', 14, 17, 1),
(22, 'ĐỜI, THẾ MÀ VUI', 60000, 39000, 0, '', 2, 'DOITHEMAVUI.jpg', '', '2020-07-04 20:06:11', '2020-07-08 21:19:59', 3, 'Tiếng Nhật', 15, 20, 2),
(23, 'TRUYỆN CỔ ANDERSEN', 500000, 420000, 4, '', 2, 'TRUYENCOANDERSEN.jpg', '', '2020-07-04 20:06:11', '2020-07-08 21:25:52', 18, 'Tiếng Việt', 16, 22, 2),
(25, 'ĐÔNG CUNG', 150000, 120000, 3, '', 2, 'DONGCUNG.jpg', '', '2020-07-04 20:06:11', '2020-07-08 21:28:48', 72, 'Tiếng Việt', 18, 23, 1),
(26, 'KHÔNG GIA ĐÌNH ', 250000, 230000, 7, '', 2, 'khonggiadinh.png', '', '2020-07-04 20:06:11', '2020-07-08 20:42:38', 250, 'Tiếng Việt', 3, 7, 3),
(31, 'HẠNH PHÚC CỦA MỘT TANG GIA', 150000, 120000, 0, '', 0, 'hanhphuccuamottanggia.jpeg', '', '2020-07-08 20:30:20', '2020-07-09 07:23:48', 23, 'Tiếng Việt', 2, 8, 2),
(32, 'TRÊN ĐƯỜNG BĂNG', 80000, 76000, 0, '', 0, 'TRENDUONGBANG.jpg', '', '2020-07-08 20:50:33', '2020-07-08 20:50:33', 50, 'Tiếng Việt', 8, 11, 2),
(33, 'ATTACK ON TITAN : 1-18', 1500000, 1420000, 0, '', 0, 'ATTACKONTITAN.jpg', '', '2020-07-08 21:14:04', '2020-07-08 21:14:04', 15, 'Tiếng Việt', 14, 18, 2),
(35, 'YOUR NAME : FULL', 580000, 510000, 0, '', 0, 'yourname.jpg', '', '2020-07-08 21:17:01', '2020-07-08 21:17:01', 28, 'Tiếng Việt', 14, 19, 1),
(37, 'TRUYỆN CƯỜI DÂN GIAN VIỆT NAM', 86000, 790000, 0, '', 0, 'TRUYENCUOIDANGIANVIETNAM.jpg', '', '2020-07-08 21:23:34', '2020-07-08 21:23:34', 15, 'Tiếng Việt', 15, 21, 3),
(38, 'NÀNG TIÊN CÁ', 120000, 111000, 9, '', 0, 'NANGTIENCA.jpg', '', '2020-07-08 21:23:59', '2020-07-08 21:23:59', 11, 'Tiếng Việt', 16, 22, 1),
(40, 'THIÊN SƠN MỘ TUYẾT', 120000, 111000, 0, '', 0, 'THIÉNONMOTUYET.jpg', '', '2020-07-08 21:31:23', '2020-07-09 07:24:18', 15, 'Tiếng Việt', 18, 23, 1),
(41, 'TƠ VÒ', 130000, 96000, 0, '', 0, 'tovo.jpg', '', '2020-07-08 21:35:39', '2020-07-08 21:35:39', 1, 'Tiếng Việt', 20, 24, 1),
(43, 'TƯỜNG LỬA', 89000, 62000, 0, '', 0, 'TUONGLUA.jpg', '', '2020-07-08 21:38:19', '2020-07-08 21:38:19', 66, 'Tiếng Việt', 20, 25, 1),
(44, 'ANNA TÓC ĐỎ', 150000, 110000, 0, '', 0, 'ANNATOCDO.jpg', '', '2020-07-08 21:43:04', '2020-07-09 07:24:33', 33, 'Tiếng Việt', 21, 26, 1),
(45, 'SHERLOCK HOLMES : FULL', 650000, 610000, 1, '', 0, 'sherlockhome.jpg', '', '2020-07-08 21:45:55', '2020-10-20 01:48:11', 20, 'Tiếng Việt', 21, 21, 1),
(46, 'Dã ngoại ngày mưa ', 50000, 25000, 2, '<p>Đi Dã Ngoại Ngày Mưa </p>\r\n<p>Đối với trẻ thì những dịp đi chơi cùng gia đình bé rất hào hứng, có thể đi xa hay đi gần, nhưng mỗi dịp đi như vậy giúp thế giới quan của bé được mở ra.</p>\r\n<p>Bộ sách Ehon mới nhất mang tên “Cùng tớ đi dã ngoại nhé!” sẽ mang rất nhiều điều thú vị cho các bé. Tại đây bé sẽ được nhìn thấy rất nhiều khung cảnh, cảnh vật, thời tiết, phương tiện, con người,… rất đa dạng và đặc sắc.</p>\r\n<p>Bộ sách gồm 4 cuốn: “Cùng đi dã ngoại nào, Dã ngoại ngày mưa, Tàu điện di chuyển nào, Tiến lên xe cứu hỏa”. Bộ sách sẽ rất phù hợp cho trẻ từ 2 tuổi trở lên.</p>\r\n<p>Những lý do bạn nên sử dụng bộ sách này:</p>\r\n<p>- Hình ảnh được minh họa trong sách đẹp, rõ nét, các hoạt động vui nhộn.</p>\r\n<p>- Các khung cảnh đa dạng, có thời tiết,…  minh họa rất thực tế</p>\r\n<p>- Các từ dùng để miêu tả vị trí, cảnh vật, địa điểm, phương tiện được nhắc đi nhắc lại để bé nhớ và kích thích sự tò mò của bé.</p>\r\n<p>- Mỗi cuốn sách là mỗi câu chuyện, mỗi phương tiện, mỗi cảnh vật khác nhau, bé sẽ không bị chán và nó sẽ làm bé hào hứng đợi trang tiếp theo khi không biết cảnh vật mình sẽ đi đến tiếp theo là ai.</p>\r\n<p>Chúng ta cùng xem hình ảnh của từng cuốn dưới đây nhé!</p>\r\n<p><strong>DÃ NGOẠI NGÀY MƯA</strong></p>\r\n<p>Hôm nay là ngày đi dã ngoại mà các bạn nhỏ đã rất háo hức mong đợi. Các bạn leo lên chiếc xe buýt thật to và đi đến <strong>đồi nho</strong> để hái nho. Vậy mà từ sáng trời lại <strong>đổ mưa rào.</strong></p>\r\n<p>Chiếc xe chạy <strong>băng qua thành phố,</strong> rồi chạy về phía ngọn núi. <strong>Đường hầm</strong> đang ở phía trước rồi kìa.</p>\r\n<p>Khi xe <strong>chui ra</strong> khỏi đường hầm, thì rừng lá phong vàng rực rỡ hiện ra. <strong>Trời vẫn tiếp tục mưa</strong>.</p>\r\n<p>Khi xe chạy chui ra khỏi đường hầm là đến một <strong>eo biển</strong>. Mưa đã <strong>ngớt dần</strong>. </p>', 0, '1608993840_da ngoai ngay mua.jpg', '', '2020-12-26 14:44:00', '2020-12-26 14:44:00', 10, '', 16, 8, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

CREATE TABLE `tacgia` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tieu_su` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hinh_anh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`id`, `name`, `tieu_su`, `hinh_anh`, `email`, `phone`, `address`) VALUES
(5, 'O. Henry', '', '', '', '', ''),
(6, 'Victor Hugo', '', '', '', '', ''),
(7, 'Hector Malot', '', '', '', '', ''),
(8, 'Vũ Trọng Phụng', '', '', '', '', ''),
(10, 'Ngô Tất Tố', '', '', '', '', ''),
(11, 'Tony Buổi Sáng ', '', '', '', '', ''),
(12, 'Richard Branson', '', '', '', '', ''),
(13, 'Bill Gate', '', '', '', '', ''),
(14, 'Dorie Clark', '', '', '', '', ''),
(15, 'Steven.D Levi & Stephen.J Dubner', '', '', '', '', ''),
(16, 'John.C Maxwell', '', '', '', '', ''),
(17, 'Fujiko F Fujio', '', '', '', '', ''),
(18, 'Isayama Hajime', '', '', '', '', ''),
(19, 'Chuyển Thể', '', '', '', '', ''),
(20, 'Lê Minh Quốc', '', '', '', '', ''),
(21, 'Dân Gian', '', '', '', '', ''),
(22, 'Andersen', '', '', '', '', ''),
(23, 'Phỉ Ngã Tư Tồn', '', '', '', '', ''),
(24, 'Xuân Vũ', '', '', '', '', ''),
(25, 'Đức Anh', '', '', '', '', ''),
(26, 'L.M.Montgomery', '', '', '', '', ''),
(27, 'Conan Doyle', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trn_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `trn_date`) VALUES
(4, 'HyDepTrai', 'minhnguyenzed@gmail.com', '10b8e822d03fb4fd946188e852a4c3e2', '2020-08-03 11:07:38'),
(5, 'hy', 'minhhy3012@gmail.com', 'cf9c6bf9d64ac94623c1f3a244f495f4', '2020-11-13 09:48:04'),
(6, 'AHIHI', 'minhhy3012@gmail.com', 'AHIHI', '2020-11-20 04:12:06');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proc_id` (`proc_id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Chỉ mục cho bảng `nxb`
--
ALTER TABLE `nxb`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`orders_id`,`prod_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `tacgia_id` (`tacgia_id`),
  ADD KEY `nxb_id` (`nxb_id`);

--
-- Chỉ mục cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nxb`
--
ALTER TABLE `nxb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`proc_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Các ràng buộc cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`tacgia_id`) REFERENCES `tacgia` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`nxb_id`) REFERENCES `nxb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
