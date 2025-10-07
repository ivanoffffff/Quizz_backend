package com.takima.backskeleton.DTO;

import com.takima.backskeleton.models.Question;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Arrays;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestionDTO {
    private Long questionId;
    private Long quizId;
    private String statement;
    private List<String> choices;
    private String correctAnswer;

    public static QuestionDTO fromEntity(Question question) {
        return new QuestionDTO(
                question.getQuestionId(),
                question.getQuiz() != null ? question.getQuiz().getQuizId() : null,
                question.getStatement(),
                question.getChoices() != null
                        ? Arrays.asList(question.getChoices().split(";"))
                        : null,
                question.getCorrectAnswer()
        );
    }

    public Question toEntity() {
        Question question = new Question();
        question.setQuestionId(this.questionId);
        question.setStatement(this.statement);
        question.setChoices(this.choices != null ? String.join(";", this.choices) : null);
        question.setCorrectAnswer(this.correctAnswer);
        return question;
    }
}