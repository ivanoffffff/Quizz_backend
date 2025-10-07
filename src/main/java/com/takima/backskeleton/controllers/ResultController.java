package com.takima.backskeleton.controllers;

import com.takima.backskeleton.DTO.ResultDTO;
import com.takima.backskeleton.services.ResultService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/results")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ResultController {

    private final ResultService resultService;

    @GetMapping
    public ResponseEntity<List<ResultDTO>> getAllResults() {
        return ResponseEntity.ok(resultService.getAllResults());
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<ResultDTO>> getResultsByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(resultService.getResultsByUserId(userId));
    }

    @GetMapping("/leaderboard/{quizId}")
    public ResponseEntity<List<ResultDTO>> getLeaderboard(@PathVariable Long quizId) {
        return ResponseEntity.ok(resultService.getLeaderboardByQuizId(quizId));
    }

    @PostMapping
    public ResponseEntity<ResultDTO> createResult(@RequestBody Map<String, Object> payload) {
        Long userId = Long.valueOf(payload.get("userId").toString());
        Long quizId = Long.valueOf(payload.get("quizId").toString());
        Integer score = Integer.valueOf(payload.get("score").toString());

        ResultDTO createdResult = resultService.createResult(userId, quizId, score);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdResult);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteResult(@PathVariable Long id) {
        resultService.deleteResult(id);
        return ResponseEntity.noContent().build();
    }
}