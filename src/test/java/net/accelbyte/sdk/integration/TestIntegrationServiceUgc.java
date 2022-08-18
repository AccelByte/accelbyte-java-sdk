/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagRequest;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsPaginatedGetTagResponse;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminCreateTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminDeleteTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminGetTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminUpdateTag;
import net.accelbyte.sdk.api.ugc.wrappers.AdminTag;
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
public class TestIntegrationServiceUgc extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String tagName = "java_server_sdk_test";
    final String tagNameUpdate = "java_server_sdk_test_update";

    final AdminTag adminTagWrapper = new AdminTag(sdk);

    // CASE Create a tag

    final ModelsCreateTagRequest createTagBody =
        ModelsCreateTagRequest.builder().tag(tagName).build();

    final ModelsCreateTagResponse createTagResult =
        adminTagWrapper.adminCreateTag(
            AdminCreateTag.builder().namespace(this.namespace).body(createTagBody).build());

    // ESAC

    assertNotNull(createTagResult);
    assertEquals(tagName, createTagResult.getTag());

    final String tagId = createTagResult.getId();

    // CASE Get tags

    final ModelsPaginatedGetTagResponse getTagResult =
        adminTagWrapper.adminGetTag(
            AdminGetTag.builder().namespace(this.namespace).offset(0).limit(10).build());

    // ESAC

    assertNotNull(getTagResult);

    // CASE Update a tag

    final ModelsCreateTagRequest updateTag =
        ModelsCreateTagRequest.builder().tag(tagNameUpdate).build();

    final ModelsCreateTagResponse updateTagResult =
        adminTagWrapper.adminUpdateTag(
            AdminUpdateTag.builder()
                .namespace(this.namespace)
                .tagId(tagId)
                .body(updateTag)
                .build());

    // ESAC

    assertNotNull(updateTagResult);
    assertEquals(tagNameUpdate, updateTagResult.getTag());

    // CASE Delete a tag

    adminTagWrapper.adminDeleteTag(
        AdminDeleteTag.builder().namespace(this.namespace).tagId(tagId).build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
