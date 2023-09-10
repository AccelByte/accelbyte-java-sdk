package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;

@Getter
@Setter
public class AccessTokenPayload {

  public static class Types {

    @Getter
    @Setter
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

    @Getter
    @Setter
    public static class Role {

      @JsonProperty("namespace")
      private String namespace;

      @JsonProperty("roleId")
      private String roleId;
    }

    @Getter
    @Setter
    public static class Permission {

      @JsonProperty("Action")
      private Integer action;

      @JsonProperty("Resource")
      private String resource;
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

  @JsonIgnore
  public AccessTokenPayload createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }
}
