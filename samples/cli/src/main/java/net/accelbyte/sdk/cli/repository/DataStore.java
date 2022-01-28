package net.accelbyte.sdk.cli.repository;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataStore {

    @JsonProperty("access_token")
    private String accessToken;
}
