package com.example.webbansach_backend.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "don_hang")
public class DonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma+don_hang")
    private int maGioHang;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "dia_chi_mua_hang")
    private String diaChiMuaHang;

    @Column(name = "dia_chi_nhan_hang")
    private String diaChiNhanHang;

    @Column(name = "chi_phi_thanh_toan")
    private String chiPhiThanhToan;
    @Column(name = "tong_tien_san_pham")
    private double tongTienSanPham;

    @Column(name = "tong_tien")
    private double tongTien;

    @OneToMany(mappedBy = "donHang",fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
    private List<ChiTietDonHang> danhSachChitietDonHang;

    @ManyToOne(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH
    })
    @JoinColumn(name = "ma_nguoi_dung",nullable = false)
    private NguoiDung nguoiDung;

    @ManyToOne(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH
    })
    @JoinColumn(name = "ma_hinh_thuc_thanh_toan",nullable = false)
    private HinhThucThanhToan hinhThucThanhToan;

    @ManyToOne(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH
    })
    @JoinColumn(name = "ma_hinh_thuc_gian_hang",nullable = false)
    private HinhThucGiaoHang hinhThucGiaoHang;
}
