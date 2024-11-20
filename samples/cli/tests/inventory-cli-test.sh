#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..44"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminCreateChainingOperations
./ng net.accelbyte.sdk.cli.Main inventory adminCreateChainingOperations \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "EAxcVpFrttufHIRd", "operations": [{"consumeItems": [{"inventoryId": "H9UzVRiXbqlAw7r6", "options": ["W2ktQG0h5JAav5kR", "a62WopBJHPtcDs8b", "BZLCXLx8bbgorQeF"], "qty": 2, "slotId": "6hkspInrAip6lyzS", "sourceItemId": "xwElFHHdgs21Jub7"}, {"inventoryId": "4CUkNmKJfh5pUkHO", "options": ["DpoMF78NY4YkHs1c", "nz1JSDgY1TXp38zs", "CTCrbCbPOyNQkT7N"], "qty": 44, "slotId": "4OI18mAQLnzjMf8G", "sourceItemId": "Z2WBZqxYG3aREAu2"}, {"inventoryId": "D6QVKNCWP75TB0i7", "options": ["pKxR8dl0zRVW4EZG", "9m0XcgGVbMqSszE8", "GHavj7AorKsxwkos"], "qty": 54, "slotId": "5MecdKi5r6QEa1ys", "sourceItemId": "LEzth6mXhzkzWkFe"}], "createItems": [{"customAttributes": {"ZSoEAcBdW19m4eu6": {}, "d5tA5jUmiTqpyhPF": {}, "dxLzFQN05MYzYiKW": {}}, "inventoryConfigurationCode": "e5dNRljv7IPrDQQR", "inventoryId": "gat0SevkLGMS0lyu", "qty": 70, "serverCustomAttributes": {"aO35llzQRaT5kPxU": {}, "fofvnnSuB0y5WUlr": {}, "MdI4sNveabntBSxT": {}}, "slotId": "eIv53HGCiljvjKoy", "slotUsed": 59, "source": "OTHER", "sourceItemId": "6SCwGrncqmLtjQHA", "tags": ["f8TgoNm03VLisV6z", "wPuo3td6TC6I3lMj", "GSWN2laRlxfcjHfY"], "toSpecificInventory": false, "type": "6MbwL6IY69z1UaLq"}, {"customAttributes": {"YSYWytLPziZMdjxc": {}, "BZufQxGiHPllG4cY": {}, "EzfTD1ZBm3MqHcUm": {}}, "inventoryConfigurationCode": "LZZbSqb8RwNmn9Hr", "inventoryId": "NQy4uZAAiE0mit9R", "qty": 67, "serverCustomAttributes": {"UdjsoqwGyzzWi9gw": {}, "QYv7t1o7TTr1Dmrh": {}, "Zv15T7quIOvBMcaY": {}}, "slotId": "mvCkGZ5dAgqxpBFm", "slotUsed": 1, "source": "OTHER", "sourceItemId": "Loxozr6wfNPX2bOI", "tags": ["tRMvqtlB2jJCSQT2", "79ZZPYGu0rdlgdWy", "OtXi3choQrpOsDBU"], "toSpecificInventory": false, "type": "epjChB3V0v52Dlym"}, {"customAttributes": {"6puQ23xoJ8aeCnaL": {}, "pUKp44YUDjasWIPU": {}, "vmEejtGeoyIPa8ZR": {}}, "inventoryConfigurationCode": "rvjj7il35MXbN9oC", "inventoryId": "MNqq98SjTvhZNkSQ", "qty": 60, "serverCustomAttributes": {"X3ateEKDpADz1x3p": {}, "oD3Qgb3boLQQ1MzH": {}, "7Qm8bwbmXgdAPh1E": {}}, "slotId": "ThG96gAFKK2WDgCc", "slotUsed": 49, "source": "OTHER", "sourceItemId": "rvqAThuwjRHpKKTl", "tags": ["mVr9XuoJbRFQSKVP", "Hbn4Xxtu7LQRENjE", "Eztx1WsYSiZqan0n"], "toSpecificInventory": true, "type": "I39YBHqaTHeKtW18"}], "removeItems": [{"inventoryId": "iGeUlc9d9sogWa24", "slotId": "CKNS0GqVvUfHQvsH", "sourceItemId": "XNUNe4mhgo5QB65l"}, {"inventoryId": "SAiYnNjkfZrQvGgb", "slotId": "LdLsFzHkBMr1yrOM", "sourceItemId": "lNFSrUEirnjX9fDm"}, {"inventoryId": "IbeZxzfTcyiuATus", "slotId": "9hsfpFDcSDG8aMVG", "sourceItemId": "LiBNrDjqoxcwgGLX"}], "targetUserId": "pUL4pp2ncYAHdNzD", "updateItems": [{"customAttributes": {"meIP6rOvDz9KOsb3": {}, "92k6YmJFfRByjlBi": {}, "uFM3FIoVk8T3GpAn": {}}, "inventoryId": "kCmBUqg2SCnqntX9", "serverCustomAttributes": {"y1aZSWMiVi10sG6v": {}, "xkfUcmqRRbceJ5i0": {}, "EeDxOgBnhhqElIaD": {}}, "slotId": "ml48wdNFLTm5T50x", "sourceItemId": "9WT0GfH2rtOa4EXs", "tags": ["XzOXQAk4mqrxzTtu", "Ll4XlbGL8QOxtjzm", "8y2wNhmwoYZyI4EF"], "type": "ZKBcYrCEAE7WIsfm"}, {"customAttributes": {"x40NLRc6m8heKnWh": {}, "zfe2NubeoKFeIaFQ": {}, "CYoDPICpnduEEQlU": {}}, "inventoryId": "LdJz4mnRBkMNxvvK", "serverCustomAttributes": {"gAT8mJrYq6hRkloq": {}, "xM3gpwxcfMy9Xzjj": {}, "I5YbsKoADkzJEN2V": {}}, "slotId": "Hzih3bit0VWn3CO3", "sourceItemId": "9PXDNxtXgeO3FgkX", "tags": ["hjDzaQY3snn2ZkP7", "cFdP43e5dC9XIBud", "fZgrbHDIDm4hMzF4"], "type": "TxodenSrUTvfqU0b"}, {"customAttributes": {"foMm5cTtFWbotQyX": {}, "JRcQWsmqPNs92epx": {}, "k0i8VxsZNereSvf9": {}}, "inventoryId": "699mCEHThUJkETAs", "serverCustomAttributes": {"Sp7gh4TeUTkOkAYf": {}, "JB8AT9t4Tv207Y2Q": {}, "D3oD5fLCr3OOlXVv": {}}, "slotId": "8ZGF7uYnGzpipNDi", "sourceItemId": "gNJma1MbqqZtfNWq", "tags": ["l4nmwAft4gqkNNlW", "kD9eOziYRFOn0jJL", "HC9LxhvNXTwGBCto"], "type": "hLtl9Zuhytm5UDrT"}]}, {"consumeItems": [{"inventoryId": "6QXCs5SPBbRPZTF6", "options": ["oQAXVG7tnsZg5QgX", "jvyGJPN4eXbJE5Vs", "2GcyomQoIXimBJeh"], "qty": 50, "slotId": "enmPZnGBt4P7Wnbd", "sourceItemId": "SJtjX7ZshZyZl5x4"}, {"inventoryId": "bRXBHUTrDzZSKscf", "options": ["OcYu3dpCROYqUiGK", "XVFCmpo6sPwVOEDS", "JsEK5QpNhlI2iS5E"], "qty": 31, "slotId": "IaTIKUkmkk9QM0NB", "sourceItemId": "MA9ORxpzwLR2AK6e"}, {"inventoryId": "XUGPJsw1fiP80G9P", "options": ["clxcft2ulIJzPyrV", "EiOG4UcqsuGKHhMR", "WLVd3DlhLuIpomM8"], "qty": 38, "slotId": "dlwuUccE536ugBp3", "sourceItemId": "HBvepnDCjgyJlXe3"}], "createItems": [{"customAttributes": {"6mgWjLfFmteue9nz": {}, "J6fH24T805tVg8Jq": {}, "U0jZpjvsugAOS7u8": {}}, "inventoryConfigurationCode": "RiWyerCSa8SRgwsA", "inventoryId": "j1ik1jglaDXTvKCW", "qty": 46, "serverCustomAttributes": {"RulpqpymDkQhtrHW": {}, "wRVnwVBOqOHi8pWG": {}, "d1juYhiqjRJOqB5F": {}}, "slotId": "93zFQbJndUDpdONn", "slotUsed": 10, "source": "OTHER", "sourceItemId": "zVrjfGXZnqAQUoY1", "tags": ["GjlIIk0iKoTTS1j0", "2o7JjTXAQN0qdskd", "QV0TqI8EFnmDbxIx"], "toSpecificInventory": false, "type": "efglSs6g4iY9u02a"}, {"customAttributes": {"CNYIWekp18lOC3mN": {}, "qF7Bl0LcghVHfPEs": {}, "pxwhRON0bc1eMbEI": {}}, "inventoryConfigurationCode": "jowLqc3ecjXJbZDK", "inventoryId": "KoxLE1Y3Dymtj3gi", "qty": 85, "serverCustomAttributes": {"YaT5hOPjaf3H0tYi": {}, "ghU0VUfcYHJbBfAK": {}, "SiPW3VgsZXiR1DJ7": {}}, "slotId": "HVWqMkNSawQUWDFJ", "slotUsed": 44, "source": "OTHER", "sourceItemId": "q8PdH6hJPUAc0RVw", "tags": ["XgAgntLMCuaXBWQi", "6BqPg4xr0lCancUZ", "GCHsZYoLfR1KtOv7"], "toSpecificInventory": true, "type": "y0b65uvuKNuy0ytZ"}, {"customAttributes": {"Q7M6Nzy1adnSKOLF": {}, "Kx1dX4LuWJu3pDMU": {}, "AeeZ97SBROPYuG6X": {}}, "inventoryConfigurationCode": "qP6oo7G73zdxTgOf", "inventoryId": "nwIdlNa29fDLh741", "qty": 71, "serverCustomAttributes": {"MSJlHeb34sZKHcl5": {}, "LLLOexL4fZvWtND2": {}, "tcBFpX8lNtFEJ7tn": {}}, "slotId": "kY6Mca5afj12K2Iz", "slotUsed": 36, "source": "OTHER", "sourceItemId": "BvvWm4udE0OXudXg", "tags": ["Nne8kJATwlc6esUp", "6Sw1I98jeZQ7hfxn", "hLd3Knaknoed9DHh"], "toSpecificInventory": true, "type": "OqQGhCUr6iTrjyEg"}], "removeItems": [{"inventoryId": "arAdNJOIG36I6tRb", "slotId": "RcrEveMdAdiPKDUV", "sourceItemId": "SC00PYeDcagginxn"}, {"inventoryId": "FIna3yddcbsPheTH", "slotId": "26IUJNvYuGRUvpZa", "sourceItemId": "HCuESOiIZsMfB4ZH"}, {"inventoryId": "3mtgWgU4pCAKxeE7", "slotId": "0CaunQNxot371W9G", "sourceItemId": "4AvQkqsGnmyo5JJT"}], "targetUserId": "UVmb8GEXFTlEMEsF", "updateItems": [{"customAttributes": {"zYqwgK1Np5nodqpL": {}, "m7FhJBNXzAFdO0Kh": {}, "qf6kiTdSGv2LFjAK": {}}, "inventoryId": "Y7CbgsWqFWZX7kPB", "serverCustomAttributes": {"om8F9GLLTG8phc3n": {}, "4iLoIllKlpO2pqiX": {}, "JF3WGRaoQomSJC4D": {}}, "slotId": "drKF7SUQPLG59e0k", "sourceItemId": "5ZtX6wK7PpUlcIW3", "tags": ["2iK7MGt1ixY5rA1W", "oVeJIePF8ZrQzP4z", "vtdxdbZUpd6FJtHJ"], "type": "1pyVwyKQLY6FEO65"}, {"customAttributes": {"Rb3z7CYLM8IlsHqf": {}, "fnrfsGlfPaZKBwa3": {}, "Ddb60ufPpzwj1QGI": {}}, "inventoryId": "FmlVf4jvapseE9LN", "serverCustomAttributes": {"9bvhOrHflIOd6X3v": {}, "iLvtEk4mTIpUA9gx": {}, "o8SV38nEhoXmM2W7": {}}, "slotId": "l6jHMA2rG3nakopA", "sourceItemId": "ywelu01nryEJ0Nqo", "tags": ["Tow0qiOiC4j0iktm", "0ZPLkLOsp0LZ5njN", "86Hl8kUXzt6bSc6b"], "type": "WvgpVyW9dD1kOmvr"}, {"customAttributes": {"Aejcq2LgkQuaS7RB": {}, "x3vim02jBOxrZDyv": {}, "pcLYOWA8NjxOnaEo": {}}, "inventoryId": "k4nOOCzfsflhjbng", "serverCustomAttributes": {"JOUn18G5MlfDTk8a": {}, "G40NlncceIZSwgAI": {}, "kgzh4pTU0Am4DZhl": {}}, "slotId": "0bQxFJ3sWCqQpQ2F", "sourceItemId": "bKPFMycMSQ4qfAac", "tags": ["R0LgB5BUXvjcu2s6", "w3VifnKqmTSoGH1X", "EfY6QAYn6WQ5UBEU"], "type": "1QAOHfZiGhxOdcuD"}]}, {"consumeItems": [{"inventoryId": "XSxSc3aZPV87pna0", "options": ["8gxefTYKhuxaEc7M", "4P7UckSC6ePeN8i4", "GrFES9z7xueHpATH"], "qty": 4, "slotId": "3q7akMpcmnnx6RVB", "sourceItemId": "rop9v7aZK3h65hbN"}, {"inventoryId": "15zfQSfQrtfF3TQN", "options": ["0OcNDLr36vzohZyj", "MQAg5mPYhrLTyU8O", "hgfY9JQYGF4bYXEc"], "qty": 61, "slotId": "JKQQewVLMUoAnaRc", "sourceItemId": "Yp7FUjfIGaffoflE"}, {"inventoryId": "IByYqeKN0meGelYF", "options": ["5wWaDhukU4khGG4v", "ZFTYnPkmSu4PWam1", "jxR7SETWjteoc8fg"], "qty": 43, "slotId": "vU4PbmRDcrg0DjQj", "sourceItemId": "BECXvea7H1m2lJFR"}], "createItems": [{"customAttributes": {"Z3ZprZ60zMjhTHeh": {}, "94TSenE5hCFkIf5w": {}, "eqZ18MH57l2Zsrh9": {}}, "inventoryConfigurationCode": "0ETtYmGukz3Mnlrj", "inventoryId": "cHp6B8Vj7rXFgDnD", "qty": 21, "serverCustomAttributes": {"eLzYEvwSWTaLQjct": {}, "vrK2jhsYpKPlXn77": {}, "AtYoFzLAATPY8P8P": {}}, "slotId": "3cfoivvQxevecWw7", "slotUsed": 90, "source": "ECOMMERCE", "sourceItemId": "ry0KK5rgAGO0dW8r", "tags": ["X2MVUGKSZ4GcLkt4", "pK32sJxlZcCTpTdR", "tCHvuk6B6XTmSLyn"], "toSpecificInventory": true, "type": "0sigBVZxiKdV57Gv"}, {"customAttributes": {"Ryd9UuL02Le8HSCs": {}, "lsDd4M1F5qRIblS7": {}, "Nz81GRazPAANjfBo": {}}, "inventoryConfigurationCode": "ldFOyqA2clJ5gEOa", "inventoryId": "CgM6Yn6RugbNEIpG", "qty": 55, "serverCustomAttributes": {"dt7zqmSKxOEQlVcx": {}, "6GqsBq8vdhWVnuYL": {}, "gpZehK0G2nmyuViB": {}}, "slotId": "9kRTcSQdTnNYGeAf", "slotUsed": 26, "source": "ECOMMERCE", "sourceItemId": "3wSkHKufBdS3ZOok", "tags": ["ZB4cXnAXyuGz6Llx", "Hv8SwyagYvDJ3w3U", "NgIGj2jZtEYT8sIP"], "toSpecificInventory": true, "type": "1fUfKmihDbmu8ePW"}, {"customAttributes": {"lQMVDXEHeiGTnwyE": {}, "w6hIWDZrpP7rz3IS": {}, "W510kHr4isTKWjmv": {}}, "inventoryConfigurationCode": "67nuHCXWfwnwGioV", "inventoryId": "wVzmmBVVFfpqx1Ae", "qty": 78, "serverCustomAttributes": {"nZhsjwJeGwaPSDMZ": {}, "z95OYKiqaZD63xe5": {}, "rruJVfLGea0ZtlzU": {}}, "slotId": "cuHAXz0UV31MfuGa", "slotUsed": 77, "source": "OTHER", "sourceItemId": "gmBLE35YhyiDV90S", "tags": ["eI5yppBHoytVznCg", "Nyx9fbT63ShEh8Pb", "GikLjgjcj34uulU6"], "toSpecificInventory": false, "type": "YBZsWFbr3RSP0W9n"}], "removeItems": [{"inventoryId": "Bhvhf8Q0DtJMcYQd", "slotId": "N66bswAgt65X4N1L", "sourceItemId": "QZmB61JMdtwCVUrY"}, {"inventoryId": "Que84dwmbwFEnAZa", "slotId": "WsQJtRYoagRJK5PX", "sourceItemId": "9UcOvhPyE11TRT2S"}, {"inventoryId": "Kseoe8VLie0LBa36", "slotId": "KNzjf005CXNGehQ2", "sourceItemId": "aTjTDfKFDXC7eGL5"}], "targetUserId": "YhJDWh9YWqc0qgV6", "updateItems": [{"customAttributes": {"d9yOfIMLds2DbPca": {}, "oMdtRLTmSvTkQQgB": {}, "7exYvmHMxr5hPCJJ": {}}, "inventoryId": "ztJBg0tTJg46IewO", "serverCustomAttributes": {"XE2AkCh3QIZsUf8l": {}, "GFXcmwTERHclOdxI": {}, "wqejxe18rNdb8Otq": {}}, "slotId": "6j1mqUav7k05HAQl", "sourceItemId": "tnSojV4jT65yclX2", "tags": ["FtAz0vJjFIYWOaNd", "simmkW2miH3xRHAK", "y4QxZkaXZ7vmiEd0"], "type": "JPxVyQpshaDwNqTb"}, {"customAttributes": {"bFMXAMfVXe0GZeMg": {}, "sRsmH1EQrYmkPKTP": {}, "OlhTtSiZNCxuogFt": {}}, "inventoryId": "eTHJe4BhSSQkQD6W", "serverCustomAttributes": {"mOt6D7ufFVTOhvQp": {}, "fbBke8aEdd36xj6w": {}, "ySoltDxsbzxrlaKE": {}}, "slotId": "fkoYjY2o6ouRW9Ut", "sourceItemId": "NquwC3WgumrIz4Nh", "tags": ["GztZpr4U4fwQIiLX", "gmRasvjO4lj8m3XE", "wP2b4gd3xOeii8Jn"], "type": "mssep2xD2NY0kABe"}, {"customAttributes": {"Gs9yxahld1pO0Gyf": {}, "5PO3COyMvczgEpzZ": {}, "3FbtxfhcRC7IVYa6": {}}, "inventoryId": "iZ5uFRYNn3SHiWxF", "serverCustomAttributes": {"0YbuU5ar5qTLWUCy": {}, "0Afgc050XIZRW491": {}, "e94mQjVOOBnIWhun": {}}, "slotId": "ElqZUodp3IhtCSHy", "sourceItemId": "1ei1fIrPvfHnRN06", "tags": ["EjRwEQlNapJRfk4f", "9Zcw1pEHAyNFxcVT", "KuAQTGh5BxjWOozG"], "type": "oDtsUuYo5p8ED5QZ"}]}], "requestId": "AufwNa8lzfjv9oYM"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '79' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["jlVHY1AHwF3vGoav", "7MK0PcLnEkcokKwc", "Q0baDT9OyJ2h23GU"], "serviceName": "S2amU7syGlElXdEA", "targetInventoryCode": "OrVSnLocLVVYamQc"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId '4wcG5nDBLJoJHbiQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["5duE5p4cfs2E41cK", "8QTwiIAvxSvNDlmM", "5nQFMGzs7fzjgyc4"], "serviceName": "4mEh9tRk8knYSV30", "targetInventoryCode": "lnroQehMDli6t9un"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'QLYXxm09wpGAbpEm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'Q7gkZEY8rG0q0Q2Q' \
    --limit '8' \
    --offset '21' \
    --sortBy 'updatedAt:desc' \
    --userId 'JzRbkF2I03dIjvBb' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "A6bfbYaJCJjfk2TU", "userId": "vn95FhO7VW3mbDVM"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'Du87t0ldWf7iSGIi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'KFtWtn4Yr2svKM6p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 34}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'QxPRXH7uxBJEECQE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "1li3Bg7Jxc9pUnZm"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'vhidwCkZwqjYLfTi' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '58' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'mTC34jxW4pIDwdqX' \
    --tags 'pmRmut9H9XyWI8bp' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId '8fQxRuX91uYmtrHJ' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'bEGTUj7YjERL1rEQ' \
    --sourceItemId 'G02zccA8wvLsWUNd' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code '6lPKvqDejvqklTSv' \
    --limit '61' \
    --offset '12' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TiRJ8daGTVX3Bb7j", "description": "lz5IfHgKjI9mwJSr", "initialMaxSlots": 80, "maxInstancesPerUser": 45, "maxUpgradeSlots": 19, "name": "Y76PxLv9HBEUe89A"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'wEw1HO4FnKtx4XLK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'AmlDr19uJ3nq6Ver' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zVCcI8y3Cz0YqCKU", "description": "h5RD9vNAp4jinFpn", "initialMaxSlots": 87, "maxInstancesPerUser": 50, "maxUpgradeSlots": 49, "name": "vfAHS0VgLu11A3HT"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'ovFi4tPAGfleyCA6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '63' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tcqsnzoVILjkwW61"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'duF87aUyrdt4XSpW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '20' \
    --owner 'AetsanzqP8oxfrtb' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "7cUQZ2QUAxJrINPX", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'Avt70ZUT2fSk3LL0' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'calqxEewuGS469k2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hG0WKt4sUmanYxM0' \
    --body '{"options": ["UHZVNYzGMNIpWoSL", "kUrfuf4U3WeYeA9t", "2ENKKWrFtHIi1CMg"], "qty": 74, "slotId": "nS98QqftSjq7sn8y", "sourceItemId": "reciPLfkVyyJsbGp"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'O6JgehDJxEN7JlZc' \
    --namespace "$AB_NAMESPACE" \
    --userId '8LMq1o2jZWu4yA3r' \
    --body '[{"customAttributes": {"0u4q1bTHXIjfJKyF": {}, "lM0u1uuoVdn9yVoS": {}, "lKNchPHNL4X3LLaG": {}}, "serverCustomAttributes": {"PGdqLE8SohhhuiTn": {}, "JarYYkHBDdSzBXdx": {}, "apwhd5IQYBQuxLvP": {}}, "slotId": "uWYvE3fsNy9Z9Ohx", "sourceItemId": "XvCp9y7fLD2qfCXn", "tags": ["lUnqxT1WsRNMZcA9", "2hzC7MNa8vVe4MHX", "6AgMep90AyyUJyAK"], "type": "5PRMRMwdvl0hv6g6"}, {"customAttributes": {"2GxBW2tQF5tkTjgJ": {}, "aMYvNQOsDa4bkcge": {}, "pqtxjbrztee7QLTG": {}}, "serverCustomAttributes": {"Aak7Kaol01DK97D2": {}, "xnik42miteR5eQAe": {}, "1rzmmgqBPRmd6mO4": {}}, "slotId": "oI8KDqebm83raNBJ", "sourceItemId": "5y7axEkvI4oxZEDx", "tags": ["GiBnNbn0zaf7CaOS", "lHXrUSA6sMJzA5mt", "qISQ83TTbtefXWzn"], "type": "De4LQdXfFBii2RAM"}, {"customAttributes": {"EX5RMjBFVZGYzQqV": {}, "8d9mDdUIoiIJFNxu": {}, "NOmUSWw18T1IxVWC": {}}, "serverCustomAttributes": {"xdvPL9e4P01vxP8x": {}, "j1LyEirURERnEMzp": {}, "ImW6sjAHyCK5tNan": {}}, "slotId": "GBrkzUvck3xTtmOF", "sourceItemId": "MebS4AdlNzwog2Ih", "tags": ["ErkNhNcECWwchW6z", "L9SkbLlrNXnGanMa", "zb8jvRWenURH48aJ"], "type": "uALEcSqcE15u6D31"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'DjOsrs3CUYATdqnQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GbqiqOkNeATj7eGj' \
    --body '{"customAttributes": {"odd7CcJUrI6MAugK": {}, "5kypNrp2nFe9FmN8": {}, "6sK5LOq4ft5jGcMI": {}}, "qty": 58, "serverCustomAttributes": {"2bRBr27fVMWuAfDq": {}, "LMR919IZPKOKiAVQ": {}, "XXOmqFHLbyXmgCNi": {}}, "slotId": "XH8uenbC5CphgMwe", "slotUsed": 8, "source": "OTHER", "sourceItemId": "olYLETRpABAmO2EG", "tags": ["vJ4UMS93yOxNInDB", "yhnoluO6ti0QP2ss", "iJ66OzOj84O6tgoh"], "type": "jtC7bzjPpucddXJ5"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'zifF8y959anrNSle' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ywHbHig6IKWVZ77K' \
    --body '[{"slotId": "eRWdECaFGzfZ2hxc", "sourceItemId": "J2Fnemn7M23SzUo4"}, {"slotId": "hNBDh9ZFP1OW0nXO", "sourceItemId": "ErQPS4VsRoYIK69y"}, {"slotId": "g9ADCGiXaLs2xjHk", "sourceItemId": "inOD975nARHCmhNH"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'SXuqIHsxvaUoXDmw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WsukxncuD3QxCXMd' \
    --body '[{"customAttributes": {"00YBWCaVVmM45mfI": {}, "ZsWhkS476dGGJwJ0": {}, "0UH197MJ6zU7JLMQ": {}}, "qty": 50, "serverCustomAttributes": {"kXsVJbXi7eRZa7Ww": {}, "Ic895ImqK6tVsaUq": {}, "3stUh5J5Z9GiBiSA": {}}, "slotId": "ylX5cS0IeHpWCugm", "slotUsed": 11, "source": "OTHER", "sourceItemId": "L0QQpxsuD8PGqku5", "tags": ["9eFJrOXyDYz9vMUO", "PG0iHDT8QbF7gHPT", "PQbvLt2NRqJGIKzL"], "type": "yH1y72L13Ornyx34"}, {"customAttributes": {"luLdvtsTKXMjiw6g": {}, "YPvfn2Qt9iyq3Nyk": {}, "8ncu2Z3eDHH9WaVO": {}}, "qty": 35, "serverCustomAttributes": {"iKhDcJ7TCcNIsQ3P": {}, "uppUxDSK8aOTGMud": {}, "cxlCV4cNbJGQ57lP": {}}, "slotId": "dinpjS2DRfGt9Gly", "slotUsed": 23, "source": "ECOMMERCE", "sourceItemId": "Q4X67tPZSTpPq3xj", "tags": ["rElvvDgw0ag7kSWE", "0Hiqm5IuLryiEXqv", "UWDjU1G0EVjVZw1T"], "type": "oLuPakQN1MpOs1RV"}, {"customAttributes": {"Frcg2CXxepx78fvs": {}, "yhE2BKtyTDSIM7mk": {}, "mvZ7Cmsh4US8o4jf": {}}, "qty": 79, "serverCustomAttributes": {"Mfuc8VOsnmnlVljd": {}, "WYmELe74p38vumnx": {}, "AnYBTxaTIz0jcgDI": {}}, "slotId": "8Pkz96vd80msqIm5", "slotUsed": 2, "source": "OTHER", "sourceItemId": "lNUBDShHD32vvL28", "tags": ["FPwTiXfLcxDC9Ynd", "02mECIQhfIhHtADU", "Q9zimQTQT95pFJUA"], "type": "JsyAfeKOufV4f15N"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'ohXu6opxQGRt6Pql' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kL0diRhLC10ih2EQ' \
    --body '{"incMaxSlots": 11}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ao3m61P2xaNfmn8O' \
    --body '{"customAttributes": {"nb1a9gMz0F2UBRmM": {}, "hAbUWmFhdYLWzMuv": {}, "3zkUY0n0BAZkwbYk": {}}, "inventoryConfigurationCode": "BLyO6A0FqfhnaB3Y", "qty": 48, "serverCustomAttributes": {"Xku2YVuOzhxHmnrr": {}, "V9ZGWrZ05sxe6A6R": {}, "pmKDebNkylbynkgT": {}}, "slotId": "9vayLLiizac7Ge6z", "slotUsed": 75, "source": "ECOMMERCE", "sourceItemId": "dlt7rjF5RaJwvkWV", "tags": ["co2LTo5ijlvDF8qB", "WCQ9dLWYyS8zdhMe", "BXH8x6HdVfZVDAiU"], "type": "6iJOF7JKZFNk2NKy"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId '59X8iOg2sVBiCoeC' \
    --body '[{"customAttributes": {"5weXJl7PeiMH8z8d": {}, "Vej8N2yv6VTnOK7x": {}, "AvM7tuL81lsR7xxS": {}}, "inventoryConfigurationCode": "Vp3Gd2TK0HzYviTg", "qty": 4, "serverCustomAttributes": {"mx82JVBRLPZ6Iz8t": {}, "ne5dbguBF6Gsvvdl": {}, "8jHz9x7XZIjU4IK9": {}}, "slotId": "lOLaZaMphKCqTq3E", "slotUsed": 98, "source": "ECOMMERCE", "sourceItemId": "NKgYazujsmSmylT1", "tags": ["YtxIq73aMb48jISd", "97KORRhxSWLWLNfH", "RD3V15QaGGL46Lux"], "type": "JF3sbeqWBdQuWfgB"}, {"customAttributes": {"AKx27MSBqabUXOGk": {}, "koMUZn1YXj5zFZeO": {}, "COR9NvBQZSJPOIKr": {}}, "inventoryConfigurationCode": "RBrYVzi9ui3lvozT", "qty": 39, "serverCustomAttributes": {"RH36bqS2oFY76PU1": {}, "AziBOHEAj1cT3u6Z": {}, "c2FbrTFznTgDIwZI": {}}, "slotId": "RWf6T3by2kYSCdnF", "slotUsed": 76, "source": "ECOMMERCE", "sourceItemId": "Lc0xcTjqjdcEfU61", "tags": ["OJYMnW49rWynp1ck", "1vT90C6o86cSRL9c", "gbUmulhe98oaFKlQ"], "type": "icdrxVhrtwSd9QWV"}, {"customAttributes": {"MYz7TU1TsxsChScl": {}, "Skb5aBi9K9zyv6gF": {}, "ZXI5nXJ7hLi6Hwew": {}}, "inventoryConfigurationCode": "eRmyo91dIn7QqXBD", "qty": 72, "serverCustomAttributes": {"2QSPAd9sxoLnWGP1": {}, "PafIjLX8ce0KbNN7": {}, "Ycl2JfmQplvGjVQ4": {}}, "slotId": "aebjfgGu472oWJlf", "slotUsed": 12, "source": "OTHER", "sourceItemId": "lLM4xjfkNL4lU6ja", "tags": ["GfsD1cfswmeFpvtD", "tetoQVFL8LNW11vt", "paTxi7k489jRCn48"], "type": "bvkCPfKofwXOIZZQ"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'AJza84lKKmVOaTS6' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'xBbNrSUAW2ak7ISD' \
    --body '{"entitlementType": "rBVg6NuDZvPb1kuU", "inventoryConfig": {"slotUsed": 12}, "itemId": "HIKeTyBG5dCUoExn", "itemType": "KfV3869IN4V1OdhH", "items": [{"bundledQty": 53, "entitlementType": "GVU7Exlkmc4xYiLj", "inventoryConfig": {"slotUsed": 77}, "itemId": "GouFu4hXONgUwJnU", "itemType": "pryDeRcpUvlrw2Mw", "sku": "C1uuokpaIjL0Vxe5", "stackable": false, "useCount": 77}, {"bundledQty": 23, "entitlementType": "x3QcFo9gxOgvDc7x", "inventoryConfig": {"slotUsed": 79}, "itemId": "PdKLddfdsUqjXVzW", "itemType": "1QqxnWR5sheLgsAF", "sku": "4ctv5guycGiq9j2E", "stackable": true, "useCount": 90}, {"bundledQty": 71, "entitlementType": "7dvBVC5zgOKLTDmH", "inventoryConfig": {"slotUsed": 9}, "itemId": "gUZ8ZFyyEr0KBXuJ", "itemType": "BqK4QtEydPWLPBYi", "sku": "R3UbJc1ZYapx7C47", "stackable": false, "useCount": 98}], "quantity": 40, "sku": "wDZCIXFNEL3uWVRz", "stackable": true, "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'a2IMlNiXpF4qvsUU' \
    --limit '32' \
    --offset '47' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '34' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '88' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'O30lpzcBQMAEcNcJ' \
    --limit '34' \
    --offset '97' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'zl2kBuLFXIeCEKZU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["Tz3GvCAZ5j24acYH", "brryHB6GO9zP3Fae", "pA3b3YJ9nJM6vtT2"], "qty": 85, "slotId": "xv85K5MU2qmbeqaV", "sourceItemId": "emINdClpF7OvlBIE"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'gjse5kd6GEDo08yq' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '63' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId '5HleLoog4me2NBFp' \
    --tags '62xlXvVcJerTPW02' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'PWsHiKYArAxnKBfB' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"fDlrQQuAc10DjjwM": {}, "v4vrIPRtvhQIyLar": {}, "jaLOKnX51yAB8Pa3": {}}, "slotId": "uNGKhaLlJzJMSnJI", "sourceItemId": "IgsAVmaGYxUX1B9o", "tags": ["VuzG2CnYX2YBF2g7", "TVtzYEHUodh3iUfB", "thbepUCTWiZ1uqh7"]}, {"customAttributes": {"GAi4FEIu44u83ZLR": {}, "xYlYqlpq03BGdIk4": {}, "oEogFVGR71rJOBy6": {}}, "slotId": "lsj1AKGBjnHmaAu4", "sourceItemId": "YK87DYAWWcbcbGWm", "tags": ["KgE8CZ4AELr5lraa", "5v5P5Cj8hgFsqHC9", "h5JPiMEtgKuiGTYg"]}, {"customAttributes": {"wWv5XldL6rOVGcRA": {}, "n51rVAQSxp4qTB54": {}, "mKA3V9DKlCeZ7mLY": {}}, "slotId": "sHooOIaxIpb1cIOJ", "sourceItemId": "PS3lJ80YJ41U4ooQ", "tags": ["980ywmg1pWpWit1Q", "C7FKe0fnHUlmU1un", "GKM0tgfeWy47bbwM"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'I4gGmvK9gW596FwB' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "NrFXt3TAuKBwBcD1", "sourceItemId": "2ae6r3hHwya4NpdO"}, {"slotId": "zg3hr6ucHf7dbh2i", "sourceItemId": "KNUl0qJqzoKMRMG5"}, {"slotId": "41PAiNjULsx4SnKN", "sourceItemId": "XLMUaDSwwQlnNRZJ"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'HBSB4fZWEFIZs28F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 10, "slotId": "mj8YRvae4f4lhBPb", "sourceItemId": "arbWEm8bVtZcfVCP"}, {"qty": 6, "slotId": "1keYXJvtggDdXjbd", "sourceItemId": "jMBahFZZGMTcqnWr"}, {"qty": 70, "slotId": "ZpfcFBUsnnDJlmD1", "sourceItemId": "iEokbUiYzCQh2iNT"}], "srcInventoryId": "wtnohddMzMTQ9P7s"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'YLDWAJOA75K4BYJ2' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'fkqYJoF2FI3vyyqR' \
    --sourceItemId 'zc20O7FdsJP1G9ty' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE