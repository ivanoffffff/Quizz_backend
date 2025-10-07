package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.QuestionRepository;
import com.takima.backskeleton.DAO.QuizRepository;
import com.takima.backskeleton.DTO.QuestionDTO;
import com.takima.backskeleton.models.Question;
import com.takima.backskeleton.models.Quiz;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final QuizRepository quizRepository;

    public List<QuestionDTO> getQuestionsByQuizId(Long quizId) {
        return questionRepository.findByQuiz_QuizId(quizId).stream()
                .map(QuestionDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public QuestionDTO getQuestionById(Long id) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found with id: " + id));
        return QuestionDTO.fromEntity(question);
    }

    @Transactional
    public QuestionDTO createQuestion(QuestionDTO questionDTO) {
        Quiz quiz = quizRepository.findById(questionDTO.getQuizId())
                .orElseThrow(() -> new RuntimeException("Quiz not found with id: " + questionDTO.getQuizId()));

        Question question = questionDTO.toEntity();
        question.setQuiz(quiz);

        Question savedQuestion = questionRepository.save(question);
        return QuestionDTO.fromEntity(savedQuestion);
    }

    @Transactional
    public QuestionDTO updateQuestion(Long id, QuestionDTO questionDTO) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Question not found with id: " + id));

        question.setStatement(questionDTO.getStatement());
        question.setChoices(questionDTO.getChoices() != null
                ? String.join(";", questionDTO.getChoices())
                : null);
        question.setCorrectAnswer(questionDTO.getCorrectAnswer());

        Question updatedQuestion = questionRepository.save(question);
        return QuestionDTO.fromEntity(updatedQuestion);
    }

    @Transactional
    public void deleteQuestion(Long id) {
        if (!questionRepository.existsById(id)) {
            throw new RuntimeException("Question not found with id: " + id);
        }
        questionRepository.deleteById(id);
    }
}