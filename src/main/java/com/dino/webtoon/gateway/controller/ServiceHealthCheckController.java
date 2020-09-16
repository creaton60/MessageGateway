package com.dino.webtoon.gateway.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/health")
public class ServiceHealthCheckController {

    @GetMapping("")
    public ResponseEntity<?> checkHealth() {
        return ResponseEntity.ok().build();
    }
}
