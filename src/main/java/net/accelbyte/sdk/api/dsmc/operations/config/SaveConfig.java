package net.accelbyte.sdk.api.dsmc.operations.config;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsDSMConfigRecord;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SaveConfig
 *
 * ``` Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 * Required scope: social This endpoint adds/modifies config. When there are
 * ready servers and the server version is updated, those servers will be
 * replaced with newer version. Port is where your game listens for incoming UDP
 * connection, if empty it'll be set to 15000 CPU and Memory limit / request are
 * formatted with Kubernetes format, e.g. CPU of 1000m is 1 core, and Memory of
 * 512Mi is 512 MB. The creation/claim/session/unreachable/heartbeat timeouts are
 * all in seconds. Creation timeout is time limit for DS to startup until
 * registers itself. Claim timeout is time limit for game session manager to
 * claim its ready DS. Session timeout is time limit for match session before
 * deleted. Unreachable timeout is time limit for DS in UNREACHABLE state before
 * deleted. Heartbeat timeout is time limit for DS to give heartbeat before
 * marked as UNREACHABLE. Sample config: { "namespace": "accelbyte", "providers":
 * [ "aws" ], "port": 7777, "protocol": "udp", "creation_timeout": 120,
 * "claim_timeout": 60, "session_timeout": 1800, "heartbeat_timeout": 30,
 * "unreachable_timeout": 30, "image_version_mapping": { "1.4.0":
 * "accelbyte/sample-ds-go:1.4.0" }, "default_version": "1.4.0", "cpu_limit":
 * "100", "mem_limit": "64", "params": "", "min_count": 0, "max_count": 0,
 * "buffer_count": 0, "configurations": { "1player": { "cpu_limit": "100",
 * "mem_limit": "64", "params": "-gamemode 1p", }, "50players": { "cpu_limit":
 * "200", "mem_limit": "512", "params": "-gamemode 50p", } }, "deployments": {
 * "global-1p": { "game_version": "1.4.0"", "regions": ["us-west", "ap-
 * southeast"], "configuration": "1player", "min_count": 0, "max_count": 0,
 * "buffer_count": 2 }, "us-50p": { "game_version": "1.4.0"", "regions": ["us-
 * west"], "configuration": "50players", "min_count": 0, "max_count": 0,
 * "buffer_count": 5 }, }, } ```
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SaveConfig extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/configs";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private ModelsDSMConfigRecord body;

    /**
    * @param body required
    */
    public SaveConfig(
            ModelsDSMConfigRecord body
    )
    {
        this.body = body;
    }

    @JsonIgnore
    public SaveConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public ModelsDSMConfigRecord getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}