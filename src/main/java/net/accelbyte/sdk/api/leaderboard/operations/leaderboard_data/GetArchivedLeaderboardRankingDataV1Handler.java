package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class GetArchivedLeaderboardRankingDataV1Handler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/leaderboard/v1/public/namespaces/{namespace}/leaderboards/{leaderboardCode}/archived";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String leaderboardCode;
    private String namespace;
    private String slug;
    private String leaderboardCodes;

    /**
    * @param leaderboardCode required
    * @param namespace required
    * @param leaderboardCodes required
    */
    public GetArchivedLeaderboardRankingDataV1Handler(
            String leaderboardCode,
            String namespace,
            String slug,
            String leaderboardCodes
    )
    {
        this.leaderboardCode = leaderboardCode;
        this.namespace = namespace;
        this.slug = slug;
        this.leaderboardCodes = leaderboardCodes;
    }

    public GetArchivedLeaderboardRankingDataV1Handler(){
    }

    public GetArchivedLeaderboardRankingDataV1Handler createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.leaderboardCode != null){
            pathParams.put("leaderboardCode", this.leaderboardCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("slug", this.slug);
        queryParams.put("leaderboardCodes", this.leaderboardCodes);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("leaderboardCode","leaderboardCode");
        result.put("namespace","namespace");
        result.put("slug","slug");
        result.put("leaderboardCodes","leaderboardCodes");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "leaderboardCode",
            "namespace",

            "leaderboardCodes"
        );
    }

    @Override
    public boolean isValid() {
        if(this.leaderboardCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.leaderboardCodes == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<ModelsArchiveLeaderboardSignedURLResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelsArchiveLeaderboardSignedURLResponse>>() {});
        }
        throw new ResponseException(code, json);
    }
}