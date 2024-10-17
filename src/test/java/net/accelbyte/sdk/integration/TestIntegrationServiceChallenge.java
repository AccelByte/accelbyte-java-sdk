/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.Instant;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;

import java.util.Arrays;
import java.util.Collections;

import net.accelbyte.sdk.api.challenge.wrappers.ChallengeConfiguration;
import net.accelbyte.sdk.api.challenge.wrappers.GoalConfiguration;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.models.ModelCreateChallengeRequest.*;
import net.accelbyte.sdk.api.challenge.models.ModelCreateGoalRequest.*;
import net.accelbyte.sdk.api.challenge.models.ModelRequirement.Operator;
import net.accelbyte.sdk.api.challenge.models.ModelPredicate.*;
import net.accelbyte.sdk.api.challenge.operations.challenge_configuration.*;
import net.accelbyte.sdk.api.challenge.operations.goal_configuration.*;

import net.accelbyte.sdk.core.HttpResponseException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceChallenge extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {    

    final String challengeCode = "java-" + TestHelper.generateRandomId(6) + "-challenge";
    final String challengeName = "Java Challenge Test";
    final String goalCode = "java-" + TestHelper.generateRandomId(6) + "-goal";
    final String goalName = "Java Goal Test";

    final ChallengeConfiguration challengeConfigWrapper = new ChallengeConfiguration(sdk);
    final GoalConfiguration goalConfigWrapper = new GoalConfiguration(sdk);

    final String startTime =
      Instant.now()
        .plus(31, ChronoUnit.DAYS)
        .atZone(ZoneId.systemDefault())
        .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSxxx"));

    // CASE Create a new challenge

    final ModelCreateChallengeRequest newChallengeRequest =
      ModelCreateChallengeRequest.builder()
        .code(challengeCode)
        .description("")
        .name(challengeName)
        .assignmentRuleFromEnum(AssignmentRule.FIXED)
        .goalsVisibilityFromEnum(GoalsVisibility.SHOWALL)
        .rotationFromEnum(Rotation.DAILY)
        .startDate(startTime)
        .build();
    
    final ModelChallengeResponse challengeResult =
      challengeConfigWrapper.adminCreateChallenge(
        AdminCreateChallenge.builder()
          .namespace(this.namespace)
          .body(newChallengeRequest)
          .build());

    // ESAC

    assertNotNull(challengeResult);
    assertEquals(challengeResult.getName(), challengeName);

    try
    {

      // CASE Get challenge
      
      final ModelChallengeResponse getChallengeResult = 
      challengeConfigWrapper.adminGetChallenge(
        AdminGetChallenge.builder()
          .namespace(this.namespace)
          .challengeCode(challengeCode)
          .build());

      // ESAC

      assertNotNull(getChallengeResult);
      assertEquals(getChallengeResult.getName(), challengeName);

      final String updatedChallengeName = challengeName + " UPDATE";

      // CASE Update a challenge

      final ModelUpdateChallengeRequest updateRequest =
        ModelUpdateChallengeRequest.builder()
          .name(updatedChallengeName)
          .build();

      final ModelChallengeResponse updateChallengeResult =
        challengeConfigWrapper.adminUpdateChallenge(
          AdminUpdateChallenge.builder()
            .namespace(this.namespace)
            .challengeCode(challengeCode)
            .body(updateRequest)
            .build());

      // ESAC

      assertNotNull(updateChallengeResult);
      assertEquals(updateChallengeResult.getName(), updatedChallengeName);

      // CASE Create a goal

      final ModelCreateGoalRequest newGoalRequest =
        ModelCreateGoalRequest.builder()
          .code(goalCode)
          .name(goalName)
          .description("")
          .schedule(ModelGoalSchedule.builder()
            .startTime(startTime)
            .order(1)
            .build())
          .requirementGroups(Collections.singletonList(
            ModelRequirement.builder()
              .operatorFromEnum(Operator.AND)
              .predicates(Collections.singletonList(
                ModelPredicate.builder()
                  .matcherFromEnum(Matcher.EQUAL)
                  .parameterTypeFromEnum(ParameterType.USERACCOUNT)
                  .parameterName("userAccountVerified")
                  .targetValue(1.0f)
                  .build()
              ))
              .build()
          ))
          .build();
          
      final ModelGoalResponse newGoalResponse = goalConfigWrapper.adminCreateGoal(
        AdminCreateGoal.builder()
          .namespace(this.namespace)
          .challengeCode(challengeCode)
          .body(newGoalRequest)
          .build());
      assertNotNull(newGoalResponse);

      // ESAC

      // CASE delete a goal

      goalConfigWrapper.adminDeleteGoal(
        AdminDeleteGoal.builder()
          .namespace(this.namespace)
          .challengeCode(challengeCode)
          .code(goalCode)
          .build());

      // ESAC

    }
    finally
    {

      // CASE Delete a challenge

      challengeConfigWrapper.adminDeleteChallenge(
        AdminDeleteChallenge.builder()
          .namespace(this.namespace)
          .challengeCode(challengeCode)
          .build());

      // ESAC
      
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
