package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonPermissionV3;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccessTokenPayload {

  public static class Types {

    @Data
    public static class Ban {

      @JsonProperty("ban")
      private String ban;

      @JsonProperty("disabledDate")
      private String disabledDate;

      @JsonProperty("enabled")
      private Boolean enabled;

      @JsonProperty("endDate")
      private String endDate;

      @JsonProperty("targetedNamespace")
      private String targetedNamespace;
    }

    @Data
    public static class Role {

      @JsonProperty("namespace")
      private String namespace;

      @JsonProperty("roleId")
      private String roleId;
    }

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Permission {

      @JsonProperty("Action")
      private Integer action;

      @JsonProperty("Resource")
      private String resource;

      public static Permission of(AccountcommonPermissionV3 permissionV3) {
        return Permission.builder()
            .resource(permissionV3.getResource())
            .action(permissionV3.getAction())
            .build();
      }
    }
  }

  @JsonProperty("bans")
  private List<Types.Ban> bans;

  @JsonProperty("client_id")
  private String clientId;

  @JsonProperty("country")
  private String country;

  @JsonProperty("display_name")
  private String displayName;

  @JsonProperty("exp")
  private Integer exp;

  @JsonProperty("iat")
  private Integer iat;

  @JsonProperty("is_comply")
  private Boolean isComply;

  @JsonProperty("iss")
  private String iss;

  @JsonProperty("jflgs")
  private Integer jflgs;

  @JsonProperty("ipf")
  private String ipf;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("parent_namespace")
  private String parentNamespace;

  @JsonProperty("namespace_roles")
  private List<Types.Role> namespaceRoles;

  @JsonProperty("permissions")
  private List<Types.Permission> permissions;

  @JsonProperty("roles")
  private List<String> roles;

  @JsonProperty("scope")
  private String scope;

  @JsonProperty("sub")
  private String sub;

  @JsonProperty("union_id")
  private String unionId;

  @JsonProperty("union_namespace")
  private String unionNamespace;

  @JsonProperty("extend_namespace")
  private String extendNamespace;

  @JsonIgnore
  public AccessTokenPayload createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }
}
