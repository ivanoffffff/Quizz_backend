package com.takima.backskeleton.DAO;

import com.takima.backskeleton.models.Result;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findByUser_UserId(Long userId);
    List<Result> findByQuiz_QuizId(Long quizId);

    @Query("SELECT r FROM Result r WHERE r.quiz.quizId = :quizId ORDER BY r.score DESC, r.playDate ASC")
    List<Result> findLeaderboardByQuizId(Long quizId);
}