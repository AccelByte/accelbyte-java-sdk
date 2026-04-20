/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Collections;
import java.util.List;
import net.accelbyte.sdk.core.AccessTokenPayload.Types.Permission;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Unit tests for namespace placeholder replacement and cross-namespace permission matching in
 * {@link StaticTestTokenValidator#testValidateResource}.
 *
 * <p>Setup: publisher="foundations", studio="studio1", game="studio1-game1"
 * Permission: NAMESPACE:{namespace}:PROFILE (action=15)
 * Target: NAMESPACE:studio1-game1:PROFILE
 */
public class StaticTestTokenValidationTest {

  private static final String PUBLISHER = "foundations";
  private static final String STUDIO = "studio1";
  private static final String GAME = "studio1-game1";

  private static final String PERMISSION_RESOURCE = "NAMESPACE:{namespace}:PROFILE";
  private static final String TARGET = "NAMESPACE:studio1-game1:PROFILE";
  private static final int ALL_ACTIONS = 15;

  private StaticTestTokenValidator validator;
  private List<Permission> permissions;

  @BeforeEach
  public void setup() {
    validator = new StaticTestTokenValidator(PUBLISHER, STUDIO, GAME);
    permissions = Collections.singletonList(Permission.builder().resource(PERMISSION_RESOURCE).action(ALL_ACTIONS).build());
  }

  @Test
  public void testGameNamespaceExactMatch() {
    // roleNamespace="studio1-game1" -> TRUE (game ns matches exactly)
    assertTrue(validator.testValidateResource(permissions, GAME, TARGET));
  }

  @Test
  public void testStudioNamespaceWithTrailingDash() {
    // roleNamespace="studio1-" -> TRUE (studio ns with trailing dash, trimmed and cached)
    assertTrue(validator.testValidateResource(permissions, STUDIO + "-", TARGET));
  }

  @Test
  public void testDifferentGameNamespace() {
    // roleNamespace="studio1-game2" -> FALSE (different game ns, not in cache)
    assertFalse(validator.testValidateResource(permissions, "studio1-game2", TARGET));
  }

  @Test
  public void testDifferentStudioNamespace() {
    // roleNamespace="studio2-" -> FALSE (different studio, not in cache)
    assertFalse(validator.testValidateResource(permissions, "studio2-", TARGET));
  }
}
