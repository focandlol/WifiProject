package org.example.wifiproject.service;

import org.example.wifiproject.dto.BookmarkGroupDto;
import org.example.wifiproject.dto.HistoryDto;
import org.example.wifiproject.dto.PositionDto;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.example.wifiproject.db.Db.close;
import static org.example.wifiproject.db.Db.getConnection;

public class HistoryService {
    public static void addHistory(PositionDto positionDto){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = getConnection();

            String sql = " insert into history ( lat, lnt, select_date) " +
                    "values (?, ?, ?);";
            pstmt = con.prepareStatement(sql);

            pstmt.setDouble(1, positionDto.getLat());
            pstmt.setDouble(2, positionDto.getLnt());
            pstmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(null,pstmt,con);
        }
    }

    public int deleteHistory(String id){
        Connection con = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{

            con = getConnection();

            String sql = " delete from history where history_id = ?";
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, Integer.parseInt(id));
            affected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(null,pstmt,con);
        }
        return affected;
    }

    public List<HistoryDto> getHistoryList() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<HistoryDto> historyDtoList = new ArrayList<>();
        try{

            con = getConnection();

            String sql = "select * from history order by history_id desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                HistoryDto historyDto = HistoryDto.builder()
                        .historyId(rs.getInt("history_id"))
                        .lat(rs.getDouble("lat"))
                        .lnt(rs.getDouble("lnt"))
                        .selectDate(rs.getTimestamp("select_date").toLocalDateTime()).build();

                historyDtoList.add(historyDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,con);
        }
        return historyDtoList;
    }

    public HistoryDto getHistoryById(String historyId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HistoryDto historyDto = null;
        try{

            con = getConnection();

            String sql = "select * from history where history_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(historyId));
            rs = pstmt.executeQuery();

            while (rs.next()) {
                historyDto = HistoryDto.builder()
                        .historyId(rs.getInt("history_id"))
                        .lat(rs.getDouble("lat"))
                        .lnt(rs.getDouble("lnt"))
                        .selectDate(rs.getTimestamp("select_date").toLocalDateTime()).build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,con);
        }
        return historyDto;
    }
}
