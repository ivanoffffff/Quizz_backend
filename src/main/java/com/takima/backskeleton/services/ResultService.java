package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.QuizRepository;
import com.takima.backskeleton.DAO.ResultRepository;
import com.takima.backskeleton.DAO.UserRepository;
import com.takima.backskeleton.DTO.ResultDTO;
import com.takima.backskeleton.models.Quiz;
import com.takima.backskeleton.models.Result;
import com.takima.backskeleton.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ResultService {

    private final ResultRepository resultRepository;
    private final UserRepository userRepository;
    private final QuizRepository quizRepository;

    public List<ResultDTO> getAllResults() {
        return resultRepository.findAll().stream()
                .map(ResultDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public List<ResultDTO> getResultsByUserId(Long userId) {
        return resultRepository.findByUser_UserId(userId).stream()
                .map(ResultDTO::fromEntity)
                .collect(Collectors.toList());
    }

    public List<ResultDTO> getLeaderboardByQuizId(Long quizId) {
        return resultRepository.findLeaderboardByQuizId(quizId).stream()
                .map(ResultDTO::fromEntity)
                .collect(Collectors.toList());
    }

    @Transactional
    public ResultDTO createResult(Long userId, Long quizId, Integer score) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + userId));

        Quiz quiz = quizRepository.findById(quizId)
                .orElseThrow(() -> new RuntimeException("Quiz not found with id: " + quizId));

        Result result = new Result(user, quiz, score);
        Result savedResult = resultRepository.save(result);
        return ResultDTO.fromEntity(savedResult);
    }

    @Transactional
    public void deleteResult(Long id) {
        if (!resultRepository.existsById(id)) {
            throw new RuntimeException("Result not found with id: " + id);
        }
        resultRepository.deleteById(id);
    }
}