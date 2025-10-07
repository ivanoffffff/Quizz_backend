package com.takima.backskeleton.DTO;

import com.takima.backskeleton.models.Quiz;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuizDTO {
    private Long quizId;
    private String title;
    private String description;
    private List<QuestionDTO> questions;

    public static QuizDTO fromEntity(Quiz quiz) {
        return new QuizDTO(
                quiz.getQuizId(),
                quiz.getTitle(),
                quiz.getDescription(),
                quiz.getQuestions() != null
                        ? quiz.getQuestions().stream()
                        .map(QuestionDTO::fromEntity)
                        .collect(Collectors.toList())
                        : null
        );
    }

    public Quiz toEntity() {
        Quiz quiz = new Quiz(this.title, this.description);
        quiz.setQuizId(this.quizId);
        return quiz;
    }
}