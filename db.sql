
CREATE TABLE `chi_tiet_don_hang` (
  `ma_chi_tiet_don_hang` int NOT NULL AUTO_INCREMENT,
  `gia_ban` double DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `ma_don_hang` int NOT NULL,
  `ma_sach` int NOT NULL,
  PRIMARY KEY (`ma_chi_tiet_don_hang`),
  KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  KEY `FKl4ue6tf96ltdeqjhjmhr3jbfd` (`ma_sach`),
  CONSTRAINT `FK9wl3houbukbxpixsut6uvojhy` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`ma+don_hang`),
  CONSTRAINT `FKl4ue6tf96ltdeqjhjmhr3jbfd` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `don_hang` (
  `ma+don_hang` int NOT NULL AUTO_INCREMENT,
  `chi_phi_thanh_toan` varchar(255) DEFAULT NULL,
  `dia_chi_mua_hang` varchar(255) DEFAULT NULL,
  `dia_chi_nhan_hang` varchar(255) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `tong_tien` double DEFAULT NULL,
  `tong_tien_san_pham` double DEFAULT NULL,
  `ma_hinh_thuc_gian_hang` int NOT NULL,
  `ma_hinh_thuc_thanh_toan` int NOT NULL,
  `ma_nguoi_dung` int NOT NULL,
  PRIMARY KEY (`ma+don_hang`),
  KEY `FK50m05jydb9117fb2ak3imlmhm` (`ma_hinh_thuc_gian_hang`),
  KEY `FK4b21m3bpem065jgpwcu5krx9n` (`ma_hinh_thuc_thanh_toan`),
  KEY `FKfiwa8ckswsiue2f0ho0jbt3l6` (`ma_nguoi_dung`),
  CONSTRAINT `FK4b21m3bpem065jgpwcu5krx9n` FOREIGN KEY (`ma_hinh_thuc_thanh_toan`) REFERENCES `hinh_thuc_thanh_toan` (`ma_hinh_thuc_thanh_toan`),
  CONSTRAINT `FK50m05jydb9117fb2ak3imlmhm` FOREIGN KEY (`ma_hinh_thuc_gian_hang`) REFERENCES `hinh_thuc_giao_hang` (`ma_hinh_thuc_giao_hang`),
  CONSTRAINT `FKfiwa8ckswsiue2f0ho0jbt3l6` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh-anh` (
  `ma_hinh_anh` int NOT NULL AUTO_INCREMENT,
  `du_lieu_anh` tinytext,
  `duong_dan` varchar(255) DEFAULT NULL,
  `la_icon` bit(1) DEFAULT NULL,
  `ten_hinh_anh` varchar(256) DEFAULT NULL,
  `ma_sach` int DEFAULT NULL,
  PRIMARY KEY (`ma_hinh_anh`),
  KEY `FKa9f8bfygu5oe2f0bhp3fmjslw` (`ma_sach`),
  CONSTRAINT `FKa9f8bfygu5oe2f0bhp3fmjslw` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_thuc_giao_hang` (
  `ma_hinh_thuc_giao_hang` int NOT NULL AUTO_INCREMENT,
  `chi_phi_giao_hang` double DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten_hinh_thuc_giao_hang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_hinh_thuc_giao_hang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_thuc_thanh_toan` (
  `ma_hinh_thuc_thanh_toan` int NOT NULL AUTO_INCREMENT,
  `chi_phi_thanh_toan` double DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten_hinh_thuc_thanh_tian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_hinh_thuc_thanh_toan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `ma_nguoi_dung` int NOT NULL AUTO_INCREMENT,
  `dia_chi_giao_hang` varchar(255) DEFAULT NULL,
  `dia_chi_mua_hang` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gioi_tinh` char(1) DEFAULT NULL,
  `ho_dem` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_nguoi_dung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoidung_quyen` (
  `ma_nguoi_dung` int NOT NULL,
  `ma_quyen` int NOT NULL,
  KEY `FKergqdbdnaw1ue60n4fs03sm4c` (`ma_quyen`),
  KEY `FKput8rk6cni96decbfvf7g9api` (`ma_nguoi_dung`),
  CONSTRAINT `FKergqdbdnaw1ue60n4fs03sm4c` FOREIGN KEY (`ma_quyen`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  CONSTRAINT `FKput8rk6cni96decbfvf7g9api` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `quyen` (`ma_quyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quyen` (
  `ma_quyen` int NOT NULL AUTO_INCREMENT,
  `ten_quyen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_quyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sach` (
  `ma_sach` int NOT NULL AUTO_INCREMENT,
  `gia_ban` double DEFAULT NULL,
  `gia_niem_yet` double DEFAULT NULL,
  `isbn` varchar(256) DEFAULT NULL,
  `mo_ta` text,
  `so_luong` int DEFAULT NULL,
  `tac_gia` varchar(256) DEFAULT NULL,
  `ten_sach` varchar(256) DEFAULT NULL,
  `trung_binh_xep_hang` double DEFAULT NULL,
  PRIMARY KEY (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sach_theloai` (
  `ma_the_loai` int NOT NULL,
  `ma_sach` int NOT NULL,
  KEY `FKr3e8lxxacb4f2ptpinhy5omqs` (`ma_sach`),
  KEY `FK44fgyw6ct3r2xrunide3milso` (`ma_the_loai`),
  CONSTRAINT `FK44fgyw6ct3r2xrunide3milso` FOREIGN KEY (`ma_the_loai`) REFERENCES `the_loai` (`ma_the_loai`),
  CONSTRAINT `FKr3e8lxxacb4f2ptpinhy5omqs` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sach_yeu_thich` (
  `ma_sach_yeu_thich` int NOT NULL AUTO_INCREMENT,
  `ma_nguoi_dung` int NOT NULL,
  `ma_sach` int NOT NULL,
  PRIMARY KEY (`ma_sach_yeu_thich`),
  KEY `FK8tc0089etalb2cj76op99gwuk` (`ma_nguoi_dung`),
  KEY `FK6mpc8yjdhjph8u9bvcyib0u03` (`ma_sach`),
  CONSTRAINT `FK6mpc8yjdhjph8u9bvcyib0u03` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`),
  CONSTRAINT `FK8tc0089etalb2cj76op99gwuk` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `su_danh_gia` (
  `ma_danh_gia` bigint NOT NULL AUTO_INCREMENT,
  `diem_xep_hang` float DEFAULT NULL,
  `nhan_xet` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` int NOT NULL,
  `ma_sach` int NOT NULL,
  PRIMARY KEY (`ma_danh_gia`),
  KEY `FK9qd8idy064gjd2amjum6k93h7` (`ma_nguoi_dung`),
  KEY `FKa7psrh5ufbh6fjhx8s3rkiqtc` (`ma_sach`),
  CONSTRAINT `FK9qd8idy064gjd2amjum6k93h7` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  CONSTRAINT `FKa7psrh5ufbh6fjhx8s3rkiqtc` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `the_loai` (
  `ma_the_loai` int NOT NULL AUTO_INCREMENT,
  `ten_the_loai` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ma_the_loai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `quyen` (`ten_quyen`)
VALUES 
('Admin'),
('Staff'),
('User');

INSERT INTO `nguoi_dung` (`dia_chi_giao_hang`, `dia_chi_mua_hang`, `email`, `gioi_tinh`, `ho_dem`, `mat_khau`, `so_dien_thoai`, `ten`, `ten_dang_nhap`)
VALUES 
('123 ABC Street', '456 DEF Street', 'user1@example.com', 'M', 'Nguyen Van', 'password1', '0123456789', 'An', 'user1'),
('124 ABC Street', '457 DEF Street', 'user2@example.com', 'F', 'Tran Thi', 'password2', '0123456788', 'Binh', 'user2'),
('125 ABC Street', '458 DEF Street', 'user3@example.com', 'M', 'Le Van', 'password3', '0123456787', 'Canh', 'user3'),
('126 ABC Street', '459 DEF Street', 'user4@example.com', 'F', 'Pham Thi', 'password4', '0123456786', 'Dao', 'user4'),
('127 ABC Street', '460 DEF Street', 'user5@example.com', 'M', 'Hoang Van', 'password5', '0123456785', 'Dung', 'user5'),
('128 ABC Street', '461 DEF Street', 'user6@example.com', 'F', 'Do Thi', 'password6', '0123456784', 'Hanh', 'user6'),
('129 ABC Street', '462 DEF Street', 'user7@example.com', 'M', 'Bui Van', 'password7', '0123456783', 'Khoa', 'user7'),
('130 ABC Street', '463 DEF Street', 'user8@example.com', 'F', 'Nguyen Thi', 'password8', '0123456782', 'Lan', 'user8'),
('131 ABC Street', '464 DEF Street', 'user9@example.com', 'M', 'Vo Van', 'password9', '0123456781', 'Minh', 'user9'),
('132 ABC Street', '465 DEF Street', 'user10@example.com', 'F', 'Vu Thi', 'password10', '0123456780', 'Oanh', 'user10');

INSERT INTO `nguoidung_quyen` (`ma_nguoi_dung`, `ma_quyen`)
VALUES 
(1, 1),  -- Admin
(2, 2),  -- Staff
(3, 3),  -- User
(4, 1),  -- Admin
(5, 2),  -- Staff
(6, 3),  -- User
(7, 1),  -- Admin
(8, 2),  -- Staff
(9, 3),  -- User
(10, 1); -- Admin

INSERT INTO `hinh_thuc_giao_hang` (`chi_phi_giao_hang`, `mo_ta`, `ten_hinh_thuc_giao_hang`)
VALUES 
(5.00, 'Standard Shipping', 'Standard'),
(10.00, 'Express Shipping', 'Express'),
(20.00, 'Overnight Shipping', 'Overnight'),
(0.00, 'In-store Pickup', 'In-store Pickup'),
(15.00, 'Same Day Delivery', 'Same Day'),
(7.50, 'Two-Day Shipping', 'Two-Day'),
(12.00, 'Three-Day Shipping', 'Three-Day'),
(3.00, 'Economy Shipping', 'Economy'),
(25.00, 'Priority Shipping', 'Priority'),
(8.00, 'Ground Shipping', 'Ground');


INSERT INTO `hinh_thuc_thanh_toan` (`chi_phi_thanh_toan`, `mo_ta`, `ten_hinh_thuc_thanh_tian`)
VALUES 
(0.00, 'Credit Card', 'Credit Card'),
(0.00, 'Debit Card', 'Debit Card'),
(2.50, 'PayPal', 'PayPal'),
(1.00, 'Bank Transfer', 'Bank Transfer'),
(3.00, 'Cash on Delivery', 'Cash on Delivery'),
(0.00, 'Apple Pay', 'Apple Pay'),
(0.00, 'Google Pay', 'Google Pay'),
(2.00, 'E-wallet', 'E-wallet'),
(1.50, 'Gift Card', 'Gift Card'),
(0.00, 'Cash Payment', 'Cash Payment');


INSERT INTO `sach` (`gia_ban`, `gia_niem_yet`, `isbn`, `mo_ta`, `so_luong`, `tac_gia`, `ten_sach`, `trung_binh_xep_hang`)
VALUES 
(150000, 180000, '978-3-16-148410-0', 'A great book about science.', 100, 'Nguyen Nhat Anh', 'Science for Everyone', 4.5),
(200000, 220000, '978-3-16-148411-7', 'An exciting novel.', 50, 'To Hoai', 'The Adventures of a Frog', 4.7),
(300000, 350000, '978-3-16-148412-4', 'A deep philosophical text.', 20, 'Kim Lan', 'Philosophy 101', 4.2),
(250000, 275000, '978-3-16-148413-1', 'Learn to cook delicious meals.', 75, 'Pham Van Ky', 'Cooking for Beginners', 4.8),
(180000, 210000, '978-3-16-148414-8', 'Master the art of drawing.', 30, 'Le Thi Hoa', 'Drawing like a Pro', 4.6),
(220000, 250000, '978-3-16-148415-5', 'Explore the universe.', 80, 'Nguyen Thanh Long', 'Astronomy 101', 4.9),
(270000, 300000, '978-3-16-148416-2', 'A collection of short stories.', 60, 'Ngo Tat To', 'Short Stories for Everyone', 4.4),
(160000, 190000, '978-3-16-148417-9', 'An introduction to history.', 90, 'Vu Trong Phung', 'History for Beginners', 4.3),
(210000, 240000, '978-3-16-148418-6', 'A guide to personal finance.', 110, 'Doan Gioi', 'Finance Made Easy', 4.7),
(280000, 310000, '978-3-16-148419-3', 'Learn a new language.', 40, 'Nguyen Hong', 'Language Learning for Everyone', 4.8);

INSERT INTO `the_loai` (`ten_the_loai`)
VALUES 
('Science'),
('Fiction'),
('Philosophy'),
('Cooking'),
('Art'),
('Astronomy'),
('Short Stories'),
('History'),
('Finance'),
('Language Learning');


INSERT INTO `sach_theloai` (`ma_the_loai`, `ma_sach`)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO `sach_yeu_thich` (`ma_nguoi_dung`, `ma_sach`)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO `su_danh_gia` (`diem_xep_hang`, `nhan_xet`, `ma_nguoi_dung`, `ma_sach`)
VALUES 
(4.5, 'Great book!', 1, 1),
(4.7, 'Exciting read!', 2, 2),
(4.2, 'Very informative.', 3, 3),
(4.8, 'Loved it!', 4, 4),
(4.6, 'Very practical.', 5, 5),
(4.9, 'Highly recommend.', 6, 6),
(4.4, 'Good collection.', 7, 7),
(4.3, 'Nice introduction.', 8, 8),
(4.7, 'Very helpful.', 9, 9),
(4.8, 'Easy to follow.', 10, 10);


INSERT INTO `chi_tiet_don_hang` (`gia_ban`, `so_luong`, `ma_don_hang`, `ma_sach`)
VALUES 
(150000, 2, 1, 1),
(200000, 1, 2, 2),
(300000, 3, 3, 3),
(250000, 1, 4, 4),
(180000, 2, 5, 5),
(220000, 1, 6, 6),
(270000, 3, 7, 7),
(160000, 2, 8, 8),
(210000, 1, 9, 9),
(280000, 1, 10, 10);

INSERT INTO `don_hang` (`chi_phi_thanh_toan`, `dia_chi_mua_hang`, `dia_chi_nhan_hang`, `ngay_tao`, `tong_tien`, `tong_tien_san_pham`, `ma_hinh_thuc_gian_hang`, `ma_hinh_thuc_thanh_toan`, `ma_nguoi_dung`)
VALUES 
('Credit Card', '123 ABC Street', '456 DEF Street', '2023-08-01 12:00:00', 300000, 300000, 1, 1, 1),
('Debit Card', '124 ABC Street', '457 DEF Street', '2023-08-02 13:00:00', 200000, 200000, 2, 2, 2),
('PayPal', '125 ABC Street', '458 DEF Street', '2023-08-03 14:00:00', 900000, 900000, 3, 3, 3),
('Bank Transfer', '126 ABC Street', '459 DEF Street', '2023-08-04 15:00:00', 250000, 250000, 4, 4, 4),
('Cash on Delivery', '127 ABC Street', '460 DEF Street', '2023-08-05 16:00:00', 360000, 360000, 5, 5, 5),
('Apple Pay', '128 ABC Street', '461 DEF Street', '2023-08-06 17:00:00', 220000, 220000, 6, 6, 6),
('Google Pay', '129 ABC Street', '462 DEF Street', '2023-08-07 18:00:00', 810000, 810000, 7, 7, 7),
('E-wallet', '130 ABC Street', '463 DEF Street', '2023-08-08 19:00:00', 320000, 320000, 8, 8, 8),
('Gift Card', '131 ABC Street', '464 DEF Street', '2023-08-09 20:00:00', 210000, 210000, 9, 9, 9),
('Cash Payment', '132 ABC Street', '465 DEF Street', '2023-08-10 21:00:00', 280000, 280000, 10, 10, 10);


INSERT INTO `hinh_anh` (`du_lieu_anh`, `duong_dan`, `la_icon`, `ten_hinh_anh`, `ma_sach`)
VALUES 
('ad', '/images/book1.jpg', 0, 'Book 1 Cover', 1),
('das', '/images/book2.jpg', 0, 'Book 2 Cover', 2),
('ads', '/images/book3.jpg', 0, 'Book 3 Cover', 3),
('das', '/images/book4.jpg', 0, 'Book 4 Cover', 4),
('xcv', '/images/book5.jpg', 0, 'Book 5 Cover', 5),
('xvcsdf', '/images/book6.jpg', 0, 'Book 6 Cover', 6),
('sdf', '/images/book7.jpg', 0, 'Book 7 Cover', 7),
('ret', '/images/book8.jpg', 0, 'Book 8 Cover', 8),
('etr', '/images/book9.jpg', 0, 'Book 9 Cover', 9),
('y', '/images/book10.jpg', 0, 'Book 10 Cover', 10);

