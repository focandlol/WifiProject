package org.example.wifiproject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class HistoryDto {
    private Integer historyId;
    private Double lat;
    private Double lnt;
    private LocalDateTime selectDate;
}
