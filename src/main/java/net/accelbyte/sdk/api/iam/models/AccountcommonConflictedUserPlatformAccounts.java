package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class AccountcommonConflictedUserPlatformAccounts extends Model {

    @JsonProperty("platformUserID")
    String platformUserID;
    @JsonProperty("publisherAccounts")
    List<AccountcommonUserWithLinkedPlatformAccounts> publisherAccounts;

    public AccountcommonConflictedUserPlatformAccounts createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("platformUserID", "platformUserID");
        result.put("publisherAccounts", "publisherAccounts");
        return result;
    }
}