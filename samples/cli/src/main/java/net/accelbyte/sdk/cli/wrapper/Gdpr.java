package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.gdpr.data_deletion.*;
import net.accelbyte.sdk.cli.api.gdpr.data_retrieval.*;

import picocli.CommandLine.Command;

@Command(name = "gdpr",
        mixinStandardHelpOptions = true,
        subcommands = {
                AdminGetListDeletionDataRequest.class,
                GetAdminEmailConfiguration.class,
                UpdateAdminEmailConfiguration.class,
                SaveAdminEmailConfiguration.class,
                DeleteAdminEmailConfiguration.class,
                AdminGetListPersonalDataRequest.class,
                AdminGetUserAccountDeletionRequest.class,
                AdminSubmitUserAccountDeletionRequest.class,
                AdminCancelUserAccountDeletionRequest.class,
                AdminGetUserPersonalDataRequests.class,
                AdminRequestDataRetrieval.class,
                AdminCancelUserPersonalDataRequest.class,
                AdminGeneratePersonalDataURL.class,
                PublicSubmitUserAccountDeletionRequest.class,
                PublicCancelUserAccountDeletionRequest.class,
                PublicGetUserAccountDeletionStatus.class,
                PublicGetUserPersonalDataRequests.class,
                PublicRequestDataRetrieval.class,
                PublicCancelUserPersonalDataRequest.class,
                PublicGeneratePersonalDataURL.class,
        }
)
public class Gdpr implements Runnable {

    @Override
    public void run() {

    }
}