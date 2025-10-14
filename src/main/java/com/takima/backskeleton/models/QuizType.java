package com.takima.backskeleton.models;

public enum QuizType {
    FOOTBALL("Football"),
    BASKETBALL("Basketball"),
    TENNIS("Tennis"),
    GOLF("Golf"),
    ATHLETISME("Athlétisme"),
    NATATION("Natation"),
    RUGBY("Rugby"),
    AUTRE("Autre");

    private final String displayName;

    QuizType(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}