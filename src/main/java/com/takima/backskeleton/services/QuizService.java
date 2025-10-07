package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.QuizRepository;
import com.takima.backskeleton.DTO.QuizDTO;
import com.takima.backskeleton.models.Quiz;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class QuizService {

    private final QuizRepository quizRepository;

    public List<QuizDTO> getAllQuizzes() {
        return quizRepository.findAll().stream()
                .map(QuizDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public QuizDTO getQuizById(Long id) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found with id: " + id));
        return QuizDTO.fromEntity(quiz);
    }

    @Transactional
    public QuizDTO createQuiz(QuizDTO quizDTO) {
        Quiz quiz = quizDTO.toEntity();
        Quiz savedQuiz = quizRepository.save(quiz);
        return QuizDTO.fromEntity(savedQuiz);
    }

    @Transactional
    public QuizDTO updateQuiz(Long id, QuizDTO quizDTO) {
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Quiz not found with id: " + id));

        quiz.setTitle(quizDTO.getTitle());
        quiz.setDescription(quizDTO.getDescription());

        Quiz updatedQuiz = quizRepository.save(quiz);
        return QuizDTO.fromEntity(updatedQuiz);
    }

    @Transactional
    public void deleteQuiz(Long id) {
        if (!quizRepository.existsById(id)) {
            throw new RuntimeException("Quiz not found with id: " + id);
        }
        quizRepository.deleteById(id);
    }
}