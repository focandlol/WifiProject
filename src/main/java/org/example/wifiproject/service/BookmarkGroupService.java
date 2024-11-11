package org.example.wifiproject.service;

import org.example.wifiproject.dto.AddBookmarkGroupSubmitDto;
import org.example.wifiproject.dto.BookmarkGroupDto;
import org.example.wifiproject.dto.BookmarkGroupUpdateDto;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.example.wifiproject.db.Db.close;
import static org.example.wifiproject.db.Db.getConnection;

public class BookmarkGroupService {

    public List<BookmarkGroupDto> getBookmarkGroupList() {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<BookmarkGroupDto> bookmarkGroupDtoList = new ArrayList<>();
        try{

            connection = getConnection();

            String sql = "select * from bookmark_group order by sequence";
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BookmarkGroupDto bookmarkGroupDto = BookmarkGroupDto.builder()
                        .groupId(rs.getInt("group_id"))
                        .groupName(rs.getString("group_name"))
                        .sequence(rs.getInt("sequence"))
                        .created(rs.getTimestamp("created").toLocalDateTime()).build();

                if(rs.getTimestamp("modified") != null){
                    bookmarkGroupDto.setModified(rs.getTimestamp("modified").toLocalDateTime());
                }
                bookmarkGroupDtoList.add(bookmarkGroupDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,connection);
        }
        return bookmarkGroupDtoList;
    }

    public BookmarkGroupDto getBookmarkGroupById(String groupId) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookmarkGroupDto bookmarkGroupDto = null;
        try{

            connection = getConnection();

            String sql = "select * from bookmark_group where group_id=?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(groupId));
            rs = pstmt.executeQuery();

            while (rs.next()) {
                bookmarkGroupDto = BookmarkGroupDto.builder()
                        .groupId(rs.getInt("group_id"))
                        .groupName(rs.getString("group_name"))
                        .sequence(rs.getInt("sequence"))
                        .created(rs.getTimestamp("created").toLocalDateTime()).build();

                if(rs.getTimestamp("modified") != null){
                    bookmarkGroupDto.setModified(rs.getTimestamp("modified").toLocalDateTime());
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
            close(rs,pstmt,connection);
        }
        return bookmarkGroupDto;
    }

    public int addBookmarkGroup(AddBookmarkGroupSubmitDto addBookmarkGroupSubmitDto){
        Connection connection = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{
            connection = getConnection();

            String sql = " insert into bookmark_group ( group_name, sequence, created) " +
                    "values (?, ?, ?)";
            pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, addBookmarkGroupSubmitDto.getGroupName());
            pstmt.setInt(2, addBookmarkGroupSubmitDto.getSequence());
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

    public int updateBookmarkGroup(BookmarkGroupUpdateDto bookmarkGroupUpdateDto){
        Connection connection = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{
            connection = getConnection();

            String sql = "update bookmark_group set group_name = ?, sequence = ?, modified = ? " +
                    "where group_id = ?";
            pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, bookmarkGroupUpdateDto.getGroupName());
            pstmt.setInt(2, bookmarkGroupUpdateDto.getSequence());
            pstmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setInt(4, bookmarkGroupUpdateDto.getGroupId());
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

    public int deleteBookmarkGroup(String groupId){
        Connection connection = null;
        PreparedStatement pstmt = null;
        int affected = 0;
        try{
            connection = getConnection();

            String sql = "delete from bookmark_group where group_id = ?";
            pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1, Integer.parseInt(groupId));
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
