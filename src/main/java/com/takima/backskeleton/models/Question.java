package com.takima.backskeleton.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "question")
@Getter
@Setter
@NoArgsConstructor
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    private Long questionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id", nullable = false)
    private Quiz quiz;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String statement;

    @Column(columnDefinition = "TEXT")
    private String choices;

    @Column(name = "correct_answer", nullable = false)
    private String correctAnswer;

    public Question(Quiz quiz, String statement, String choices, String correctAnswer) {
        this.quiz = quiz;
        this.statement = statement;
        this.choices = choices;
        this.correctAnswer = correctAnswer;
    }
}