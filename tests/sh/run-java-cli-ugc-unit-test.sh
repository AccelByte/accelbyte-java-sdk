#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=84

FINISHED_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

export AB_BASE_URL="http://0.0.0.0:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

get_current_year() { echo $(date +'%Y'); }
get_adult_birthday() { echo "$(( $(get_current_year) - 22))-01-01"; }

get_random_int() { echo $(( $1 + ( RANDOM % (($2 - $1)) ) )); }
get_random_bool() { ( (( (RANDOM % 2) == 1)) && echo "true" ) || ( echo "false" ) }
get_random_element() { declare -a a=("$@"); r=$((RANDOM % ${#a[@]})); echo ${a[$r]}; }

create_file() {
    touch $1
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

update_status() {
    return_code=$1
    operation_name=$2

    FINISHED_COUNT=$(( $FINISHED_COUNT + 1 ))

    if [ $return_code == 0 ]
    then
        SUCCESS_COUNT=$(( $SUCCESS_COUNT + 1 ))
        echo "ok $FINISHED_COUNT $operation_name"
    else
        FAILED_COUNT=$(( $FAILED_COUNT + 1 ))
        echo "not ok $FINISHED_COUNT - $operation_name"
        echo '  ---'
        echo '  error: |-'
        while read line; do
          echo "    $line" | tr '\n' ' '
        echo $line
        done < $TEMP_FILE
    fi
}

create_file 'tmp.dat'

echo 'TAP version 13'
echo "1..$OPERATIONS_COUNT"

java -jar ${JAR_PATH} loginClient

#- 1 SingleAdminGetChannel
java -jar ${JAR_PATH} ugc singleAdminGetChannel \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminGetChannel'
delete_file $TEMP_FILE

#- 2 AdminCreateChannel
java -jar ${JAR_PATH} ugc adminCreateChannel \
    --body '{"name": "FtBxyZcD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateChannel'
delete_file $TEMP_FILE

#- 3 SingleAdminUpdateChannel
java -jar ${JAR_PATH} ugc singleAdminUpdateChannel \
    --body '{"name": "XBpGlsQu"}' \
    --channelId 'Ju8vMf0I' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminUpdateChannel'
delete_file $TEMP_FILE

#- 4 SingleAdminDeleteChannel
java -jar ${JAR_PATH} ugc singleAdminDeleteChannel \
    --channelId 'sJkTrd8I' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminDeleteChannel'
delete_file $TEMP_FILE

#- 5 AdminUploadContentDirect
update_status 0 'AdminUploadContentDirect (skipped deprecated)'

#- 6 AdminUploadContentS3
java -jar ${JAR_PATH} ugc adminUploadContentS3 \
    --body '{"contentType": "DcV2zXnT", "fileExtension": "KjXY1bPq", "name": "amiBxx9C", "preview": "s18EY84e", "subType": "kItqRzHU", "tags": ["1oh570KQ"], "type": "BVaewc72"}' \
    --channelId 'krSha68n' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUploadContentS3'
delete_file $TEMP_FILE

#- 7 SingleAdminUpdateContentS3
java -jar ${JAR_PATH} ugc singleAdminUpdateContentS3 \
    --body '{"contentType": "3Ynozp1C", "fileExtension": "2KmIQTuB", "name": "dNEUsxFb", "preview": "8CJ17M7D", "subType": "JZaMSxEC", "tags": ["bZbygyoa"], "type": "rORoeNHS"}' \
    --channelId 'b8Rh3kgs' \
    --contentId '9qqJbnQs' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminUpdateContentS3'
delete_file $TEMP_FILE

#- 8 AdminSearchChannelSpecificContent
java -jar ${JAR_PATH} ugc adminSearchChannelSpecificContent \
    --channelId 'oBgiVpP8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSearchChannelSpecificContent'
delete_file $TEMP_FILE

#- 9 SingleAdminUpdateContentDirect
update_status 0 'SingleAdminUpdateContentDirect (skipped deprecated)'

#- 10 SingleAdminDeleteContent
java -jar ${JAR_PATH} ugc singleAdminDeleteContent \
    --channelId 'Cm3yvASU' \
    --contentId 'oxdxxFqm' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminDeleteContent'
delete_file $TEMP_FILE

#- 11 SingleAdminGetContent
java -jar ${JAR_PATH} ugc singleAdminGetContent \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminGetContent'
delete_file $TEMP_FILE

#- 12 AdminSearchContent
java -jar ${JAR_PATH} ugc adminSearchContent \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSearchContent'
delete_file $TEMP_FILE

#- 13 AdminGetSpecificContent
java -jar ${JAR_PATH} ugc adminGetSpecificContent \
    --contentId 'AGTJ8IEd' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetSpecificContent'
delete_file $TEMP_FILE

#- 14 AdminDownloadContentPreview
java -jar ${JAR_PATH} ugc adminDownloadContentPreview \
    --contentId 'agEtp4w2' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDownloadContentPreview'
delete_file $TEMP_FILE

#- 15 AdminUpdateScreenshots
java -jar ${JAR_PATH} ugc adminUpdateScreenshots \
    --body '{"screenshots": [{"description": "9KOu9c19", "screenshotId": "R6XDqWHk"}]}' \
    --contentId 'kP8npLEK' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateScreenshots'
delete_file $TEMP_FILE

#- 16 AdminUploadContentScreenshot
java -jar ${JAR_PATH} ugc adminUploadContentScreenshot \
    --body '{"screenshots": [{"contentType": "MfjiX7jp", "description": "kVZk3IaQ", "fileExtension": "jfif"}]}' \
    --contentId 'mqGodOEG' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUploadContentScreenshot'
delete_file $TEMP_FILE

#- 17 AdminDeleteContentScreenshot
java -jar ${JAR_PATH} ugc adminDeleteContentScreenshot \
    --contentId 't9gPOj0c' \
    --namespace "test" \
    --screenshotId '6i0JkvIa' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteContentScreenshot'
delete_file $TEMP_FILE

#- 18 SingleAdminGetAllGroups
java -jar ${JAR_PATH} ugc singleAdminGetAllGroups \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminGetAllGroups'
delete_file $TEMP_FILE

#- 19 AdminCreateGroup
java -jar ${JAR_PATH} ugc adminCreateGroup \
    --body '{"contents": ["s73ucYnF"], "name": "AJ3DK5T4"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateGroup'
delete_file $TEMP_FILE

#- 20 SingleAdminGetGroup
java -jar ${JAR_PATH} ugc singleAdminGetGroup \
    --groupId 'Eogg0Y39' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminGetGroup'
delete_file $TEMP_FILE

#- 21 SingleAdminUpdateGroup
java -jar ${JAR_PATH} ugc singleAdminUpdateGroup \
    --body '{"contents": ["UoYlpv5b"], "name": "VAgtsDhU"}' \
    --groupId 'TDUscbQD' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminUpdateGroup'
delete_file $TEMP_FILE

#- 22 SingleAdminDeleteGroup
java -jar ${JAR_PATH} ugc singleAdminDeleteGroup \
    --groupId 'jbTQuPMz' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminDeleteGroup'
delete_file $TEMP_FILE

#- 23 SingleAdminGetGroupContents
java -jar ${JAR_PATH} ugc singleAdminGetGroupContents \
    --groupId '2PTRlkyU' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SingleAdminGetGroupContents'
delete_file $TEMP_FILE

#- 24 AdminGetTag
java -jar ${JAR_PATH} ugc adminGetTag \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetTag'
delete_file $TEMP_FILE

#- 25 AdminCreateTag
java -jar ${JAR_PATH} ugc adminCreateTag \
    --body '{"tag": "89ZPOw6z"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateTag'
delete_file $TEMP_FILE

#- 26 AdminUpdateTag
java -jar ${JAR_PATH} ugc adminUpdateTag \
    --body '{"tag": "PFJ42cwm"}' \
    --namespace "test" \
    --tagId 'zBBSMNco' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateTag'
delete_file $TEMP_FILE

#- 27 AdminDeleteTag
java -jar ${JAR_PATH} ugc adminDeleteTag \
    --namespace "test" \
    --tagId 'AAOjKNjf' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteTag'
delete_file $TEMP_FILE

#- 28 AdminGetType
java -jar ${JAR_PATH} ugc adminGetType \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetType'
delete_file $TEMP_FILE

#- 29 AdminCreateType
java -jar ${JAR_PATH} ugc adminCreateType \
    --body '{"subtype": ["cYHm093a"], "type": "YgBU1sqj"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateType'
delete_file $TEMP_FILE

#- 30 AdminUpdateType
java -jar ${JAR_PATH} ugc adminUpdateType \
    --body '{"subtype": ["yK0XH45P"], "type": "aRSOFQBt"}' \
    --namespace "test" \
    --typeId 'u23REZ8h' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateType'
delete_file $TEMP_FILE

#- 31 AdminDeleteType
java -jar ${JAR_PATH} ugc adminDeleteType \
    --namespace "test" \
    --typeId 'RVX7LGOv' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteType'
delete_file $TEMP_FILE

#- 32 AdminGetChannel
java -jar ${JAR_PATH} ugc adminGetChannel \
    --namespace "test" \
    --userId 'DdYiQS9i' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetChannel'
delete_file $TEMP_FILE

#- 33 AdminDeleteAllUserChannels
java -jar ${JAR_PATH} ugc adminDeleteAllUserChannels \
    --namespace "test" \
    --userId '7mV1C91p' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteAllUserChannels'
delete_file $TEMP_FILE

#- 34 AdminUpdateChannel
java -jar ${JAR_PATH} ugc adminUpdateChannel \
    --body '{"name": "jG9gpxL6"}' \
    --channelId 'ycTQdvln' \
    --namespace "test" \
    --userId '2LAuSQWE' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateChannel'
delete_file $TEMP_FILE

#- 35 AdminDeleteChannel
java -jar ${JAR_PATH} ugc adminDeleteChannel \
    --channelId 'XL6LFE1Y' \
    --namespace "test" \
    --userId 'Ho9m126Z' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteChannel'
delete_file $TEMP_FILE

#- 36 AdminUpdateContentS3
java -jar ${JAR_PATH} ugc adminUpdateContentS3 \
    --body '{"contentType": "Wc8hHtWv", "fileExtension": "bNYqgUqs", "name": "lArFPiHU", "preview": "IvaCv8kU", "subType": "9dBBpdsJ", "tags": ["LhsVyExr"], "type": "kxoot0B7"}' \
    --channelId 'WOfercZd' \
    --contentId 'pMci37Ds' \
    --namespace "test" \
    --userId '7YSfExaI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateContentS3'
delete_file $TEMP_FILE

#- 37 AdminUpdateContentDirect
update_status 0 'AdminUpdateContentDirect (skipped deprecated)'

#- 38 AdminDeleteContent
java -jar ${JAR_PATH} ugc adminDeleteContent \
    --channelId '3uzLteMb' \
    --contentId 'FAlt4hr7' \
    --namespace "test" \
    --userId 'HmOYiBA5' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteContent'
delete_file $TEMP_FILE

#- 39 AdminGetContent
java -jar ${JAR_PATH} ugc adminGetContent \
    --namespace "test" \
    --userId 'ltAOXmlG' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetContent'
delete_file $TEMP_FILE

#- 40 AdminDeleteAllUserContents
java -jar ${JAR_PATH} ugc adminDeleteAllUserContents \
    --namespace "test" \
    --userId '6eh1dTdo' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteAllUserContents'
delete_file $TEMP_FILE

#- 41 AdminHideUserContent
java -jar ${JAR_PATH} ugc adminHideUserContent \
    --body '{"isHidden": true}' \
    --contentId 'pBIcuC1d' \
    --namespace "test" \
    --userId 'QY93OJnJ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminHideUserContent'
delete_file $TEMP_FILE

#- 42 AdminGetAllGroups
java -jar ${JAR_PATH} ugc adminGetAllGroups \
    --namespace "test" \
    --userId '6Te9vD8l' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAllGroups'
delete_file $TEMP_FILE

#- 43 AdminDeleteAllUserGroup
java -jar ${JAR_PATH} ugc adminDeleteAllUserGroup \
    --namespace "test" \
    --userId 'dz7Hu8AD' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteAllUserGroup'
delete_file $TEMP_FILE

#- 44 AdminGetGroup
java -jar ${JAR_PATH} ugc adminGetGroup \
    --groupId '79kdWunv' \
    --namespace "test" \
    --userId 'izU0q1pH' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetGroup'
delete_file $TEMP_FILE

#- 45 AdminUpdateGroup
java -jar ${JAR_PATH} ugc adminUpdateGroup \
    --body '{"contents": ["yhhERoGg"], "name": "drysMizB"}' \
    --groupId 'GSRdP2l7' \
    --namespace "test" \
    --userId 'DNSZ8Aq0' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateGroup'
delete_file $TEMP_FILE

#- 46 AdminDeleteGroup
java -jar ${JAR_PATH} ugc adminDeleteGroup \
    --groupId 'XiPLQXSe' \
    --namespace "test" \
    --userId '07ZddOGT' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteGroup'
delete_file $TEMP_FILE

#- 47 AdminGetGroupContents
java -jar ${JAR_PATH} ugc adminGetGroupContents \
    --groupId 'MlJjBwj9' \
    --namespace "test" \
    --userId 'HJHQKseE' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetGroupContents'
delete_file $TEMP_FILE

#- 48 AdminDeleteAllUserStates
java -jar ${JAR_PATH} ugc adminDeleteAllUserStates \
    --namespace "test" \
    --userId 'dSXRDSvg' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteAllUserStates'
delete_file $TEMP_FILE

#- 49 SearchChannelSpecificContent
java -jar ${JAR_PATH} ugc searchChannelSpecificContent \
    --channelId 'uauw1xT7' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SearchChannelSpecificContent'
delete_file $TEMP_FILE

#- 50 PublicSearchContent
java -jar ${JAR_PATH} ugc publicSearchContent \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSearchContent'
delete_file $TEMP_FILE

#- 51 GetFollowedContent
java -jar ${JAR_PATH} ugc getFollowedContent \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetFollowedContent'
delete_file $TEMP_FILE

#- 52 GetLikedContent
java -jar ${JAR_PATH} ugc getLikedContent \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLikedContent'
delete_file $TEMP_FILE

#- 53 DownloadContentByShareCode
java -jar ${JAR_PATH} ugc downloadContentByShareCode \
    --namespace "test" \
    --shareCode 'eMwSl9ML' \
    >$TEMP_FILE 2>&1
update_status $? 'DownloadContentByShareCode'
delete_file $TEMP_FILE

#- 54 PublicDownloadContentByContentID
java -jar ${JAR_PATH} ugc publicDownloadContentByContentID \
    --contentId 'H0NnTJ2u' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDownloadContentByContentID'
delete_file $TEMP_FILE

#- 55 AddDownloadCount
java -jar ${JAR_PATH} ugc addDownloadCount \
    --contentId 'lNzBvwJa' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AddDownloadCount'
delete_file $TEMP_FILE

#- 56 UpdateContentLikeStatus
java -jar ${JAR_PATH} ugc updateContentLikeStatus \
    --body '{"likeStatus": false}' \
    --contentId '547JllvA' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateContentLikeStatus'
delete_file $TEMP_FILE

#- 57 PublicDownloadContentPreview
java -jar ${JAR_PATH} ugc publicDownloadContentPreview \
    --contentId '8RWSpabU' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDownloadContentPreview'
delete_file $TEMP_FILE

#- 58 GetTag
java -jar ${JAR_PATH} ugc getTag \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTag'
delete_file $TEMP_FILE

#- 59 GetType
java -jar ${JAR_PATH} ugc getType \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetType'
delete_file $TEMP_FILE

#- 60 GetFollowedUsers
java -jar ${JAR_PATH} ugc getFollowedUsers \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetFollowedUsers'
delete_file $TEMP_FILE

#- 61 GetChannels
java -jar ${JAR_PATH} ugc getChannels \
    --namespace "test" \
    --userId 't7xk6Qxy' \
    >$TEMP_FILE 2>&1
update_status $? 'GetChannels'
delete_file $TEMP_FILE

#- 62 CreateChannel
java -jar ${JAR_PATH} ugc createChannel \
    --body '{"name": "WhfqoWfJ"}' \
    --namespace "test" \
    --userId 'w2o8oWUq' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateChannel'
delete_file $TEMP_FILE

#- 63 DeleteAllUserChannel
java -jar ${JAR_PATH} ugc deleteAllUserChannel \
    --namespace "test" \
    --userId 'vPCZ2HzT' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAllUserChannel'
delete_file $TEMP_FILE

#- 64 UpdateChannel
java -jar ${JAR_PATH} ugc updateChannel \
    --body '{"name": "7NXmWDlX"}' \
    --channelId 'suNIdQJR' \
    --namespace "test" \
    --userId '5lsNOlvk' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateChannel'
delete_file $TEMP_FILE

#- 65 DeleteChannel
java -jar ${JAR_PATH} ugc deleteChannel \
    --channelId 'fwaSbnsu' \
    --namespace "test" \
    --userId 'LCgToxuV' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteChannel'
delete_file $TEMP_FILE

#- 66 CreateContentDirect
update_status 0 'CreateContentDirect (skipped deprecated)'

#- 67 CreateContentS3
java -jar ${JAR_PATH} ugc createContentS3 \
    --body '{"contentType": "TekJgvg6", "fileExtension": "h5HIpH0D", "name": "viplEk4v", "preview": "j3LDp4yq", "subType": "Dt8QUZDp", "tags": ["xlHasinG"], "type": "cjrkmRMt"}' \
    --channelId 'tgjDSaIV' \
    --namespace "test" \
    --userId 'Bmft3Udg' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateContentS3'
delete_file $TEMP_FILE

#- 68 UpdateContentS3
java -jar ${JAR_PATH} ugc updateContentS3 \
    --body '{"contentType": "7p9PGmY2", "fileExtension": "H5kX4Msi", "name": "sSX28nAR", "preview": "xWRpv5ou", "subType": "5xtvd28O", "tags": ["UfCt8UJC"], "type": "5flNyj6H"}' \
    --channelId 'sTtX8P3l' \
    --contentId 'lnaaS9lq' \
    --namespace "test" \
    --userId 'yygPcfkJ' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateContentS3'
delete_file $TEMP_FILE

#- 69 UpdateContentDirect
update_status 0 'UpdateContentDirect (skipped deprecated)'

#- 70 DeleteContent
java -jar ${JAR_PATH} ugc deleteContent \
    --channelId 'IxfQZza8' \
    --contentId 'kNVbDxVM' \
    --namespace "test" \
    --userId 'q7HJk0F8' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteContent'
delete_file $TEMP_FILE

#- 71 PublicGetUserContent
java -jar ${JAR_PATH} ugc publicGetUserContent \
    --namespace "test" \
    --userId '9xAc3YVf' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserContent'
delete_file $TEMP_FILE

#- 72 DeleteAllUserContents
java -jar ${JAR_PATH} ugc deleteAllUserContents \
    --namespace "test" \
    --userId 'aENtrl0p' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAllUserContents'
delete_file $TEMP_FILE

#- 73 UpdateScreenshots
java -jar ${JAR_PATH} ugc updateScreenshots \
    --body '{"screenshots": [{"description": "TKZTXqzH", "screenshotId": "uBMYQSA2"}]}' \
    --contentId 'jz1ZOpdO' \
    --namespace "test" \
    --userId 'jSyMddB4' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateScreenshots'
delete_file $TEMP_FILE

#- 74 UploadContentScreenshot
java -jar ${JAR_PATH} ugc uploadContentScreenshot \
    --body '{"screenshots": [{"contentType": "1JuMf7RU", "description": "yBHRj8Ii", "fileExtension": "png"}]}' \
    --contentId 'imRllHT6' \
    --namespace "test" \
    --userId 'Dc40vFFA' \
    >$TEMP_FILE 2>&1
update_status $? 'UploadContentScreenshot'
delete_file $TEMP_FILE

#- 75 DeleteContentScreenshot
java -jar ${JAR_PATH} ugc deleteContentScreenshot \
    --contentId '6gpU7EW3' \
    --namespace "test" \
    --screenshotId 'x1dCpm55' \
    --userId 'gOeqQIqc' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteContentScreenshot'
delete_file $TEMP_FILE

#- 76 UpdateUserFollowStatus
java -jar ${JAR_PATH} ugc updateUserFollowStatus \
    --body '{"followStatus": false}' \
    --namespace "test" \
    --userId 'BM1J1Ibu' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserFollowStatus'
delete_file $TEMP_FILE

#- 77 GetGroups
java -jar ${JAR_PATH} ugc getGroups \
    --namespace "test" \
    --userId 'TrrkbmuT' \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroups'
delete_file $TEMP_FILE

#- 78 CreateGroup
java -jar ${JAR_PATH} ugc createGroup \
    --body '{"contents": ["1whOqmEn"], "name": "DXIWrBPl"}' \
    --namespace "test" \
    --userId 'Say46mv7' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateGroup'
delete_file $TEMP_FILE

#- 79 DeleteAllUserGroup
java -jar ${JAR_PATH} ugc deleteAllUserGroup \
    --namespace "test" \
    --userId '1BAZAOjt' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAllUserGroup'
delete_file $TEMP_FILE

#- 80 GetGroup
java -jar ${JAR_PATH} ugc getGroup \
    --groupId 'FJ2vmTj7' \
    --namespace "test" \
    --userId 'tT7TZHWD' \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroup'
delete_file $TEMP_FILE

#- 81 UpdateGroup
java -jar ${JAR_PATH} ugc updateGroup \
    --body '{"contents": ["dCkIsZoA"], "name": "rWwPHcyF"}' \
    --groupId 'AdAtYciL' \
    --namespace "test" \
    --userId 'IgRwFRr0' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroup'
delete_file $TEMP_FILE

#- 82 DeleteGroup
java -jar ${JAR_PATH} ugc deleteGroup \
    --groupId 'gwB9tz3v' \
    --namespace "test" \
    --userId 'p99XVlV8' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroup'
delete_file $TEMP_FILE

#- 83 GetGroupContent
java -jar ${JAR_PATH} ugc getGroupContent \
    --groupId 'rK3tE6n0' \
    --namespace "test" \
    --userId 'smip1tw3' \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupContent'
delete_file $TEMP_FILE

#- 84 DeleteAllUserStates
java -jar ${JAR_PATH} ugc deleteAllUserStates \
    --namespace "test" \
    --userId 'L7cUd9pq' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAllUserStates'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT