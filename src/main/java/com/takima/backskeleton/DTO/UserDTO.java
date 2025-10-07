package com.takima.backskeleton.DTO;

import com.takima.backskeleton.models.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Long userId;
    private String name;
    private String email;
    private String role;

    public static UserDTO fromEntity(User user) {
        return new UserDTO(
                user.getUserId(),
                user.getName(),
                user.getEmail(),
                user.getRole().name()
        );
    }

    public User toEntity() {
        return new User(
                this.name,
                this.email,
                User.Role.valueOf(this.role)
        );
    }
}