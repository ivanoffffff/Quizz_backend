package com.takima.backskeleton.DTO;

import com.takima.backskeleton.models.Result;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ResultDTO {
    private Long resultId;
    private Long userId;
    private String userName;
    private Long quizId;
    private String quizTitle;
    private Integer score;
    private LocalDateTime playDate;

    public static ResultDTO fromEntity(Result result) {
        return new ResultDTO(
                result.getResultId(),
                result.getUser() != null ? result.getUser().getUserId() : null,
                result.getUser() != null ? result.getUser().getName() : null,
                result.getQuiz() != null ? result.getQuiz().getQuizId() : null,
                result.getQuiz() != null ? result.getQuiz().getTitle() : null,
                result.getScore(),
                result.getPlayDate()
        );
    }
}