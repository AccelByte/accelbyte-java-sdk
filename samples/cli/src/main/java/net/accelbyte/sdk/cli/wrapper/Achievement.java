package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.achievement.achievements.*;

import picocli.CommandLine.Command;

@Command(name = "achievement",
        mixinStandardHelpOptions = true,
        subcommands = {
                AdminListAchievements.class,
                AdminCreateNewAchievement.class,
                ExportAchievements.class,
                ImportAchievements.class,
                AdminGetAchievement.class,
                AdminUpdateAchievement.class,
                AdminDeleteAchievement.class,
                AdminUpdateAchievementListOrder.class,
                AdminListUserAchievements.class,
                AdminUnlockAchievement.class,
                PublicListAchievements.class,
                PublicGetAchievement.class,
                PublicListUserAchievements.class,
                PublicUnlockAchievement.class,
        }
)
public class Achievement implements Runnable {

    @Override
    public void run() {

    }
}