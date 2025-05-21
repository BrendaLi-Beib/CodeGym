package com.codegym.jira.profile.internal.web;

import com.codegym.jira.common.error.ErrorMessageHandler;
import com.codegym.jira.login.AuthUser;
import com.codegym.jira.profile.ProfileTo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(SpringExtension.class)
@WebMvcTest(ProfileRestController.class)
class ProfileRestControllerTest {

    @MockBean
    private ErrorMessageHandler errorHandler;

    @Autowired
    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        Mockito.when(errorHandler.getErrorMessage(Mockito.any())).thenReturn("error simulacion");
    }

    @Test
    @WithMockUser
    void testGetProfile() throws Exception {
        mockMvc.perform(get("/api/profile"))
                .andExpect(status().isOk())
                .andExpect(content().contentType("application/json"));
    }

    @Test
    @WithMockUser
    void testUpdateProfile() throws Exception {
        //ProfileTo profileTo = ProfileTestData.getNewTo();
        mockMvc.perform(put("/api/profile")
                        .contentType("application/json")
                        .content("{\"mail.Notifications\": [\"string\"],\"contacts\": [{\"code\": \"string\",\"value\": \"string\"}]}"))
                        .andExpect(status().isNoContent());
    }
}