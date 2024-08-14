package com.example.webbansach_backend.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hinh_thuc_thanh_toan")
public class HinhThucThanhToan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_hinh_thuc_thanh_toan")
    private int maHinhThucThanhToan;
    @Column(name = "ten_hinh_thuc_thanh_tian")
    private String tenHinhThucThanhToan;
    @Column(name = "mo_ta")
    private  String moTa;
    @Column(name = "chi_phi_thanh_toan")
    private double chiPhiThanhToan;

    @OneToMany(mappedBy = "hinhThucThanhToan",
    fetch = FetchType.LAZY,
    cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.DETACH
    })
    List<DonHang> danhSachDonHang;
}
