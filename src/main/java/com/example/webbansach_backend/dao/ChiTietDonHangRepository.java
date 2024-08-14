package com.example.webbansach_backend.dao;

import com.example.webbansach_backend.entities.ChiTietDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChiTietDonHangRepository extends JpaRepository<ChiTietDonHang,Integer> {
}
