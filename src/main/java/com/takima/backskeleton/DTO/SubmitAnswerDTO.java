package com.takima.backskeleton.DTO;

import java.util.Map;

public class SubmitAnswerDTO {
    private Long userId;
    private Long quizId;
    private Map<Long, String> answers; // questionId -> réponse de l'utilisateur

    public Long getUserId() {
        return userId;
    }

    public Long getQuizId() {
        return quizId;
    }

    public Map<Long, String> getAnswers() {
        return answers;
    }
}