/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationRequestV1;
import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsGetGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsGroupResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsPublicCreateNewGroupRequestV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupRequestV1;
import net.accelbyte.sdk.api.group.operations.configuration.CreateGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.configuration.DeleteGroupConfigurationV1;
import net.accelbyte.sdk.api.group.operations.configuration.GetGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.configuration.InitiateGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.group.CreateNewGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.DeleteGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.GetSingleGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.UpdateSingleGroupV1;
import net.accelbyte.sdk.api.group.wrappers.Configuration;
import net.accelbyte.sdk.api.group.wrappers.Group;
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
public class TestIntegrationServiceGroup extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String initialConfigCode = "initialConfigurationCode";
    final String configCode = "javaServerSdkConfigCode";
    final String configName = "Java Server SDK Integration Test Configuration Group";
    final String configDescription = "This is a test configuration group";

    final String groupName = "Java Server SDK Integration Test Group";
    final String groupDescription = "This is a test group";
    final String groupDescriptionUpdated = "This is a test group updated";
    final String groupType = "PUBLIC";
    final String groupRegion = "us-west-1";
    final int groupMaxMember = 50;

    final Configuration configurationWrapper = new Configuration(sdk);
    final Group groupWrapper = new Group(sdk);

    String defaultAdminRoleId = "";
    String defaultMemberRoleId = "";

    try {
      final ModelsGetGroupConfigurationResponseV1 getGroupConfigResult =
          configurationWrapper.getGroupConfigurationAdminV1(
              GetGroupConfigurationAdminV1.builder()
                  .namespace(this.namespace)
                  .configurationCode(initialConfigCode)
                  .build());

      assertNotNull(getGroupConfigResult);

      defaultAdminRoleId = getGroupConfigResult.getGroupAdminRoleId();
      defaultMemberRoleId = getGroupConfigResult.getGroupMemberRoleId();
    } catch (HttpResponseException rex) {
      final boolean isNotAvailable = rex.getErrorMessage().contains("73131"); // No inital
      // configuration yet
      if (isNotAvailable) {
        ModelsCreateGroupConfigurationResponseV1 initiateGroupConfigResult =
            configurationWrapper.initiateGroupConfigurationAdminV1(
                InitiateGroupConfigurationAdminV1.builder().namespace(this.namespace).build());

        defaultAdminRoleId = initiateGroupConfigResult.getGroupAdminRoleId();
        defaultMemberRoleId = initiateGroupConfigResult.getGroupMemberRoleId();
      } else {
        throw rex;
      }
    }

    try {
      // CASE Create group configuration

      final ModelsCreateGroupConfigurationRequestV1 createGroupConfigBody =
          ModelsCreateGroupConfigurationRequestV1.builder()
              .configurationCode(configCode)
              .description(configDescription)
              .groupMaxMember(groupMaxMember)
              .name(configName)
              .groupAdminRoleId(defaultAdminRoleId)
              .groupMemberRoleId(defaultMemberRoleId)
              .build();

      final ModelsCreateGroupConfigurationResponseV1 createGroupConfigResult =
          configurationWrapper.createGroupConfigurationAdminV1(
              CreateGroupConfigurationAdminV1.builder()
                  .namespace(this.namespace)
                  .body(createGroupConfigBody)
                  .build());

      // ESAC

      assertNotNull(createGroupConfigResult);
    } catch (HttpResponseException rex) {
      // Unable to create global configuration: global configuration already exist

      boolean isAlreadyExist = rex.getErrorMessage().contains("73130");

      if (!isAlreadyExist) {
        throw rex;
      }
    }

    // CASE Create a group

    final ModelsPublicCreateNewGroupRequestV1 createGroup =
        ModelsPublicCreateNewGroupRequestV1.builder()
            .groupName(groupName)
            .groupType(groupType)
            .groupDescription(groupDescription)
            .groupMaxMember(100)
            .groupRegion(groupRegion)
            .configurationCode(configCode)
            .build();
    final ModelsGroupResponseV1 createGroupResult =
        groupWrapper.createNewGroupPublicV1(
            CreateNewGroupPublicV1.builder().namespace(this.namespace).body(createGroup).build());

    // ESAC

    assertNotNull(createGroupResult);
    assertEquals(groupName, createGroupResult.getGroupName());

    final String groupId = createGroupResult.getGroupId();

    // CASE Get a group

    final ModelsGroupResponseV1 getSingleGroupResult =
        groupWrapper.getSingleGroupPublicV1(
            GetSingleGroupPublicV1.builder().namespace(this.namespace).groupId(groupId).build());

    // ESAC

    assertNotNull(getSingleGroupResult);
    assertEquals(groupName, createGroupResult.getGroupName());

    // CASE Update a group

    final ModelsUpdateGroupRequestV1 updateGroup =
        ModelsUpdateGroupRequestV1.builder().groupDescription(groupDescriptionUpdated).build();
    final ModelsGroupResponseV1 updateGroupResult =
        groupWrapper.updateSingleGroupV1(
            UpdateSingleGroupV1.builder()
                .namespace(this.namespace)
                .groupId(groupId)
                .body(updateGroup)
                .build());

    // ESAC

    assertNotNull(updateGroupResult);
    assertEquals(groupDescriptionUpdated, updateGroupResult.getGroupDescription());

    // CASE Delete a group

    groupWrapper.deleteGroupPublicV1(
        DeleteGroupPublicV1.builder().namespace(this.namespace).groupId(groupId).build());

    // ESAC

    // Confirm if group is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          groupWrapper.getSingleGroupPublicV1(
              GetSingleGroupPublicV1.builder().namespace(this.namespace).groupId(groupId).build());
        });

    // CASE Delete group configuration

    configurationWrapper.deleteGroupConfigurationV1(
        DeleteGroupConfigurationV1.builder()
            .namespace(this.namespace)
            .configurationCode(configCode)
            .build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
