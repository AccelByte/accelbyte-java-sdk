/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AccountcommonNetflixCertificates extends Model {

  @JsonProperty("encryptedPrivateKey")
  private String encryptedPrivateKey;

  @JsonProperty("encryptedPrivateKeyName")
  private String encryptedPrivateKeyName;

  @JsonProperty("publicCertificate")
  private String publicCertificate;

  @JsonProperty("publicCertificateName")
  private String publicCertificateName;

  @JsonProperty("rootCertificate")
  private String rootCertificate;

  @JsonProperty("rootCertificateName")
  private String rootCertificateName;

  @JsonIgnore
  public AccountcommonNetflixCertificates createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AccountcommonNetflixCertificates> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AccountcommonNetflixCertificates>>() {});
  }
}
