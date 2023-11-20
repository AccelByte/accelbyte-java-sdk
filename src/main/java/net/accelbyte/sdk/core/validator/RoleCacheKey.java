package net.accelbyte.sdk.core.validator;

import static net.accelbyte.sdk.core.AccessTokenPayload.Types.*;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
@EqualsAndHashCode
public class RoleCacheKey {

  private final String namespace;

  private final String userId;

  private final String roleId;

  public static RoleCacheKey of(Role role, String userId) {
    return new RoleCacheKey(role.getNamespace(), userId, role.getRoleId());
  }

  public static RoleCacheKey of(String roleId, String namespace, String userId) {
    return new RoleCacheKey(roleId, namespace, userId);
  }
}
