package org.example.wifiproject.service;

import org.example.wifiproject.dto.AddBookmarkSubmitDto;
import org.example.wifiproject.dto.BookmarkDto;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.example.wifiproject.db.Db.close;
import static org.example.wifiproject.db.Db.getConnection;

public class BookmarkService {
    public int addBookmark(AddBookmarkSubmitDto addBookmarkSubmitDto){
        Connection connection = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{
            connection = getConnection();

            String sql = " insert into wifi_bookmark ( wifi_id, group_id, created) " +
                    "values (?, ?, ?)";
            pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1, addBookmarkSubmitDto.getWifiId());
            pstmt.setInt(2, addBookmarkSubmitDto.getBookmarkId());
            pstmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            affected = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(null,pstmt,connection);
        }
        return affected;
    }

    public List<BookmarkDto> getBookmarkList() {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<BookmarkDto> bookmarkDtoList = new ArrayList<>();
        try{

            connection = getConnection();

            String sql = "select wb.bookmark_id, w.x_swifi_main_nm, bg.group_name, wb.created, wb.wifi_id " +
                    "from wifi_bookmark wb join wifi w on wb.wifi_id = w.wifi_id " +
                    "join bookmark_group bg on wb.group_id = bg.group_id order by wb.bookmark_id desc";
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BookmarkDto bookmarkDto = BookmarkDto.builder()
                        .bookmarkId(rs.getInt("bookmark_id"))
                        .groupName(rs.getString("group_name"))
                        .wifiName(rs.getString("x_swifi_main_nm"))
                        .wifiId(rs.getInt("wifi_id"))
                        .created(rs.getTimestamp("created").toLocalDateTime()).build();

                bookmarkDtoList.add(bookmarkDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,connection);
        }
        return bookmarkDtoList;
    }

    public BookmarkDto getBookmarkById(String bookmarkId) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookmarkDto bookmarkDto = null;
        try{

            connection = getConnection();

            String sql = "select wb.bookmark_id, w.x_swifi_main_nm, bg.group_name, wb.created, w.wifi_id " +
                    "from wifi_bookmark wb join wifi w on wb.wifi_id = w.wifi_id " +
                    "join bookmark_group bg on wb.group_id = bg.group_id " +
                    "where wb.bookmark_id = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(bookmarkId));
            rs = pstmt.executeQuery();

            while (rs.next()) {
                bookmarkDto = BookmarkDto.builder()
                        .bookmarkId(rs.getInt("bookmark_id"))
                        .groupName(rs.getString("group_name"))
                        .wifiName(rs.getString("x_swifi_main_nm"))
                        .wifiId(rs.getInt("wifi_id"))
                        .created(rs.getTimestamp("created").toLocalDateTime()).build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,connection);
        }
        return bookmarkDto;
    }

    public int deleteBookmark(String bookmarkId){
        Connection connection = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{
            connection = getConnection();

            String sql = "delete from wifi_bookmark where bookmark_id = ?";
            pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1, Integer.parseInt(bookmarkId));
            affected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(null,pstmt,connection);
        }
        return affected;
    }
}
