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
echo "1..41"

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
    --body '{"message": "EAxcVpFrttufHIRd", "operations": [{"consumeItems": [{"inventoryId": "H9UzVRiXbqlAw7r6", "qty": 100, "slotId": "7eHpzSn3ZPUdc0qh", "sourceItemId": "4n8mzZ0m8SAMTwE6"}, {"inventoryId": "I56IaRDBXxyaNoMR", "qty": 87, "slotId": "hkspInrAip6lyzSx", "sourceItemId": "wElFHHdgs21Jub74"}, {"inventoryId": "CUkNmKJfh5pUkHOD", "qty": 32, "slotId": "FcDtgOjchIua5tWE", "sourceItemId": "IC32ogW7olvbTgrh"}], "createItems": [{"customAttributes": {"RTcPiSuL0Sly6XM4": {}, "OI18mAQLnzjMf8GZ": {}, "2WBZqxYG3aREAu2D": {}}, "inventoryConfigurationCode": "6QVKNCWP75TB0i7p", "inventoryId": "KxR8dl0zRVW4EZG9", "qty": 25, "serverCustomAttributes": {"Z4U68su8XfqlqNiT": {}, "vB6SdAdIhUDrwoZ5": {}, "MecdKi5r6QEa1ysL": {}}, "slotId": "Ezth6mXhzkzWkFeZ", "slotUsed": 90, "source": "dSpHt0P7MIIR7Cky", "sourceItemId": "F6C7duuyZ0GhDogq", "tags": ["rhBRd8lDR6qVNPRZ", "YdFLIAjGGJddVCvu", "9vx5KQ7KYnIuMBva"], "toSpecificInventory": false, "type": "35llzQRaT5kPxUfo"}, {"customAttributes": {"fvnnSuB0y5WUlrMd": {}, "I4sNveabntBSxTeI": {}, "v53HGCiljvjKoyD6": {}}, "inventoryConfigurationCode": "SCwGrncqmLtjQHAf", "inventoryId": "8TgoNm03VLisV6zw", "qty": 86, "serverCustomAttributes": {"o3twu0MesTCf9x4r": {}, "t69lna7qxNeIxPz6": {}, "MbwL6IY69z1UaLqY": {}}, "slotId": "SYWytLPziZMdjxcB", "slotUsed": 70, "source": "ufQxGiHPllG4cYEz", "sourceItemId": "fTD1ZBm3MqHcUmLZ", "tags": ["ZbSqb8RwNmn9HrNQ", "y4uZAAiE0mit9RGC", "CHYzUOcEdscKHPEq"], "toSpecificInventory": false, "type": "v7t1o7TTr1DmrhZv"}, {"customAttributes": {"15T7quIOvBMcaYmv": {}, "CkGZ5dAgqxpBFmaL": {}, "oxozr6wfNPX2bOIt": {}}, "inventoryConfigurationCode": "RMvqtlB2jJCSQT27", "inventoryId": "9ZZPYGu0rdlgdWyO", "qty": 39, "serverCustomAttributes": {"kLnvxkT1X68cmDc3": {}, "fxU8MyKrQpM4hkkK": {}, "6KKXNB3Gv0IqmF51": {}}, "slotId": "TkhjYnaq6foWvXa3", "slotUsed": 3, "source": "vmEejtGeoyIPa8ZR", "sourceItemId": "rvjj7il35MXbN9oC", "tags": ["MNqq98SjTvhZNkSQ", "70D0H6BXksUC9b6i", "5lZC9xv32e8c5csS"], "toSpecificInventory": false, "type": "zH7Qm8bwbmXgdAPh"}], "removeItems": [{"inventoryId": "1EThG96gAFKK2WDg", "slotId": "CcxvONZm3EeERmDn", "sourceItemId": "yeFoF7VSZ6pf3vne"}, {"inventoryId": "SD2Tb3g7mSQUhAEt", "slotId": "rmjqU6YE3p4lSck0", "sourceItemId": "ZHn5GI39YBHqaTHe"}, {"inventoryId": "KtW18iGeUlc9d9so", "slotId": "gWa24CKNS0GqVvUf", "sourceItemId": "HQvsHXNUNe4mhgo5"}], "targetUserId": "QB65lSAiYnNjkfZr", "updateItems": [{"customAttributes": {"QvGgbLdLsFzHkBMr": {}, "1yrOMlNFSrUEirnj": {}, "X9fDmIbeZxzfTcyi": {}}, "inventoryId": "uATus9hsfpFDcSDG", "serverCustomAttributes": {"8aMVGLiBNrDjqoxc": {}, "wgGLXpUL4pp2ncYA": {}, "HdNzDmeIP6rOvDz9": {}}, "slotId": "KOsb392k6YmJFfRB", "sourceItemId": "yjlBiuFM3FIoVk8T", "tags": ["3GpAnkCmBUqg2SCn", "qntX9y1aZSWMiVi1", "0sG6vxkfUcmqRRbc"], "type": "eJ5i0EeDxOgBnhhq"}, {"customAttributes": {"ElIaDml48wdNFLTm": {}, "5T50x9WT0GfH2rtO": {}, "a4EXsXzOXQAk4mqr": {}}, "inventoryId": "xzTtuLl4XlbGL8QO", "serverCustomAttributes": {"xtjzm8y2wNhmwoYZ": {}, "yI4EFZKBcYrCEAE7": {}, "WIsfmx40NLRc6m8h": {}}, "slotId": "eKnWhzfe2NubeoKF", "sourceItemId": "eIaFQCYoDPICpndu", "tags": ["EEQlULdJz4mnRBkM", "NxvvKgAT8mJrYq6h", "RkloqxM3gpwxcfMy"], "type": "9XzjjI5YbsKoADkz"}, {"customAttributes": {"JEN2VHzih3bit0VW": {}, "n3CO39PXDNxtXgeO": {}, "3FgkXhjDzaQY3snn": {}}, "inventoryId": "2ZkP7cFdP43e5dC9", "serverCustomAttributes": {"XIBudfZgrbHDIDm4": {}, "hMzF4TxodenSrUTv": {}, "fqU0bfoMm5cTtFWb": {}}, "slotId": "otQyXJRcQWsmqPNs", "sourceItemId": "92epxk0i8VxsZNer", "tags": ["eSvf9699mCEHThUJ", "kETAsSp7gh4TeUTk", "OkAYfJB8AT9t4Tv2"], "type": "07Y2QD3oD5fLCr3O"}]}, {"consumeItems": [{"inventoryId": "OlXVv8ZGF7uYnGzp", "qty": 18, "slotId": "GYY7KQI1AeFgPqaO", "sourceItemId": "kvo1aolB4lkKB4EY"}, {"inventoryId": "OkQ1jMD3cym8xIfk", "qty": 83, "slotId": "0jJLHC9LxhvNXTwG", "sourceItemId": "BCtohLtl9Zuhytm5"}, {"inventoryId": "UDrT6QXCs5SPBbRP", "qty": 69, "slotId": "TF6oQAXVG7tnsZg5", "sourceItemId": "QgXjvyGJPN4eXbJE"}], "createItems": [{"customAttributes": {"5Vs2GcyomQoIXimB": {}, "JehyxlNsjUgxBkF6": {}, "wFPoJeQediogEhhM": {}}, "inventoryConfigurationCode": "2rIizGdKvOPdq5xr", "inventoryId": "gxSmy1DN9LFkYW5D", "qty": 88, "serverCustomAttributes": {"iGKXVFCmpo6sPwVO": {}, "EDSJsEK5QpNhlI2i": {}, "S5EpGhhvXYck0upM": {}}, "slotId": "zUYnb76tFkEORV3b", "slotUsed": 41, "source": "K6eXUGPJsw1fiP80", "sourceItemId": "G9Pclxcft2ulIJzP", "tags": ["yrVEiOG4UcqsuGKH", "hMRWLVd3DlhLuIpo", "mM8sm1MiaI1mX2tJ"], "toSpecificInventory": false, "type": "Bp3HBvepnDCjgyJl"}, {"customAttributes": {"Xe36mgWjLfFmteue": {}, "9nzJ6fH24T805tVg": {}, "8JqU0jZpjvsugAOS": {}}, "inventoryConfigurationCode": "7u8RiWyerCSa8SRg", "inventoryId": "wsAj1ik1jglaDXTv", "qty": 75, "serverCustomAttributes": {"qqRRulpqpymDkQht": {}, "rHWwRVnwVBOqOHi8": {}, "pWGd1juYhiqjRJOq": {}}, "slotId": "B5F93zFQbJndUDpd", "slotUsed": 84, "source": "y8M9zVrjfGXZnqAQ", "sourceItemId": "UoY1GjlIIk0iKoTT", "tags": ["S1j02o7JjTXAQN0q", "dskdQV0TqI8EFnmD", "bxIxi4YKlONk2Q5Y"], "toSpecificInventory": true, "type": "JvaizwiilatuUjjt"}, {"customAttributes": {"9lIMGql5ElEa9EII": {}, "lGcHB3CfR3ncDlwi": {}, "3v3MFFJ1KesKoELC": {}}, "inventoryConfigurationCode": "pobBEG8X645xpdXp", "inventoryId": "ai0rYaT5hOPjaf3H", "qty": 39, "serverCustomAttributes": {"Hhhkg1yLVbLFzHEP": {}, "8cM4NTwr0KHaAsmT": {}, "ej52WKi6tArAURt9": {}}, "slotId": "plCSVq8PdH6hJPUA", "slotUsed": 5, "source": "qDuAXI66bQ71w0de", "sourceItemId": "oV9Lx5RDA1l2Xcrc", "tags": ["iYNEzvSZIPkhSgOR", "cz5S5BvmgBLxh4ij", "FnE3Tam69qSZ7PC6"], "toSpecificInventory": false, "type": "SKOLFKx1dX4LuWJu"}], "removeItems": [{"inventoryId": "3pDMUAeeZ97SBROP", "slotId": "YuG6XqP6oo7G73zd", "sourceItemId": "xTgOfnwIdlNa29fD"}, {"inventoryId": "Lh741IslKHzGlLKW", "slotId": "UtDQs61OQAoxyyQp", "sourceItemId": "RWCiiPDGQhNPEwiJ"}, {"inventoryId": "Cf2XJVrlzqQls1oz", "slotId": "hLVA3kE8jKvgatOE", "sourceItemId": "BM70TdlNBJYOmpu1"}], "targetUserId": "VCarzBsV6xnZ5Jrz", "updateItems": [{"customAttributes": {"zjrcaug6CWVG8SWP": {}, "3glU6muswVJnNnN7": {}, "kAa7j0riFc5HTHQI": {}}, "inventoryId": "oVsGo7dwV9DBqFKH", "serverCustomAttributes": {"QkETJyTlUrwDTnou": {}, "jQD4IEiH9Z5qXn3a": {}, "oRtlqOECohViHA5C": {}}, "slotId": "zgFSy8X1A3PrIfap", "sourceItemId": "q5AAeMe4L3mDWORB", "tags": ["VXTIIJM9XsYIIZxi", "XNMR9BgaWcFX3SUB", "hyoTsMWPAxUMkawa"], "type": "GpAyrIwMif3BOdko"}, {"customAttributes": {"cVTd4BxqGWV6mTJ0": {}, "sQs6XNbjvqhnUVLW": {}, "u8olKdxL6ozRmDD0": {}}, "inventoryId": "jJvlfV5OemPYdYT7", "serverCustomAttributes": {"DROCjtuzFMbAG9YI": {}, "89hmguB8FOTjMLo4": {}, "b9rIzqYkEpstyVTB": {}}, "slotId": "crM8rG0rH0zcswwV", "sourceItemId": "eMK6MbGIVIu8vvwL", "tags": ["c7KY3uVoJXTIMtpg", "kieDyF97lGdMiHKx", "bWCYzo8yO2KTK9tm"], "type": "mOnYnOpas6ghP1y4"}, {"customAttributes": {"Zi7s7QBlk44Z44B1": {}, "GZgKg4uKxaCgcGLu": {}, "C3brWdTYCfHkIySo": {}}, "inventoryId": "k5DiXZtLW87rGysr", "serverCustomAttributes": {"yod3dNQrmsApRA6H": {}, "X3RwrKt2ecozL0TO": {}, "g54vCE48L5oLF6M4": {}}, "slotId": "lNa4JUMSHNgqRqCV", "sourceItemId": "7usamANkZlOX9Sfo", "tags": ["95HgXqKhTPkwfLM9", "uSybRzWek2gZvRrv", "r0n9d9lvccKMLhrT"], "type": "rcBE2ItBS3KtKZWe"}]}, {"consumeItems": [{"inventoryId": "8aoFzAyBME74HUti", "qty": 32, "slotId": "OxrZDyvpcLYOWA8N", "sourceItemId": "jxOnaEok4nOOCzfs"}, {"inventoryId": "flhjbngJOUn18G5M", "qty": 23, "slotId": "xqMPpcVfRwNj547f", "sourceItemId": "H0XrKEDpEY8VnocG"}, {"inventoryId": "Ajci0V3tBf2jnHGK", "qty": 33, "slotId": "phn50c9tNLDljhZ2", "sourceItemId": "jxLRX3z46OCaGBeM"}], "createItems": [{"customAttributes": {"fPlNos4yBRjrERHE": {}, "onAZR8GmEu0q1p6Q": {}, "CyY6vSkVFWdsbYuV": {}}, "inventoryConfigurationCode": "EGVxYheR3j5mNZ6v", "inventoryId": "wv7K8Asvt1j1Rx59", "qty": 14, "serverCustomAttributes": {"aEc7M4P7UckSC6eP": {}, "eN8i4GrFES9z7xue": {}, "HpATHccee9GXhKcj": {}}, "slotId": "mSEwdrkEnnqKzFsL", "slotUsed": 11, "source": "65hbN15zfQSfQrtf", "sourceItemId": "F3TQN0OcNDLr36vz", "tags": ["ohZyjMQAg5mPYhrL", "TyU8OhgfY9JQYGF4", "bYXEcENx9xZlAcho"], "toSpecificInventory": false, "type": "AnaRcYp7FUjfIGaf"}, {"customAttributes": {"foflEIByYqeKN0me": {}, "GelYF5wWaDhukU4k": {}, "hGG4vZFTYnPkmSu4": {}}, "inventoryConfigurationCode": "PWam1jxR7SETWjte", "inventoryId": "oc8fgvZDDhoO05oK", "qty": 34, "serverCustomAttributes": {"0DjQjBECXvea7H1m": {}, "2lJFRZ3ZprZ60zMj": {}, "hTHeh94TSenE5hCF": {}}, "slotId": "kIf5weqZ18MH57l2", "slotUsed": 39, "source": "z9F1BxNNgnke4akn", "sourceItemId": "cw7wu9TmXfJWBPrx", "tags": ["9Ns8eLzYEvwSWTaL", "QjctvrK2jhsYpKPl", "Xn77AtYoFzLAATPY"], "toSpecificInventory": true, "type": "8P3cfoivvQxevecW"}, {"customAttributes": {"w7Rry0KK5rgAGO0d": {}, "W8rX2MVUGKSZ4GcL": {}, "kt4pK32sJxlZcCTp": {}}, "inventoryConfigurationCode": "TdRtCHvuk6B6XTmS", "inventoryId": "Lyn50sigBVZxiKdV", "qty": 85, "serverCustomAttributes": {"GvRyd9UuL02Le8HS": {}, "CslsDd4M1F5qRIbl": {}, "S7Nz81GRazPAANjf": {}}, "slotId": "BoldFOyqA2clJ5gE", "slotUsed": 84, "source": "7XIZRZ7tZdIs0xf4", "sourceItemId": "czdt7zqmSKxOEQlV", "tags": ["cx6GqsBq8vdhWVnu", "YLgpZehK0G2nmyuV", "iB9kRTcSQdTnNYGe"], "toSpecificInventory": true, "type": "9FmYel0kOw72o8Zk"}], "removeItems": [{"inventoryId": "gk0jS6rDWUwfhKvr", "slotId": "f2AaH4yCWrHSppnI", "sourceItemId": "ZkNnTn3rzH5NvAtc"}, {"inventoryId": "vNedgS1fUfKmihDb", "slotId": "mu8ePWlQMVDXEHei", "sourceItemId": "GTnwyEw6hIWDZrpP"}, {"inventoryId": "7rz3ISW510kHr4is", "slotId": "TKWjmv67nuHCXWfw", "sourceItemId": "nwGioVwVzmmBVVFf"}], "targetUserId": "pqx1AeLtzcPJ3jtD", "updateItems": [{"customAttributes": {"YBo4FUTH7CGfKSyx": {}, "gRR1DiCqSMzpqIFG": {}, "LkDs7ACC1RgBfoNr": {}}, "inventoryId": "HlFi2qJLgmBLE35Y", "serverCustomAttributes": {"hyiDV90SeI5yppBH": {}, "oytVznCgNyx9fbT6": {}, "3ShEh8PbGikLjgjc": {}}, "slotId": "j34uulU6FYBZsWFb", "sourceItemId": "r3RSP0W9nBhvhf8Q", "tags": ["0DtJMcYQdN66bswA", "gt65X4N1LQZmB61J", "MdtwCVUrYQue84dw"], "type": "mbwFEnAZaWsQJtRY"}, {"customAttributes": {"oagRJK5PX9UcOvhP": {}, "yE11TRT2SKseoe8V": {}, "Lie0LBa36KNzjf00": {}}, "inventoryId": "5CXNGehQ2aTjTDfK", "serverCustomAttributes": {"FDXC7eGL5YhJDWh9": {}, "YWqc0qgV6d9yOfIM": {}, "Lds2DbPcaoMdtRLT": {}}, "slotId": "mSvTkQQgB7exYvmH", "sourceItemId": "Mxr5hPCJJztJBg0t", "tags": ["TJg46IewOXE2AkCh", "3QIZsUf8lGFXcmwT", "ERHclOdxIwqejxe1"], "type": "8rNdb8Otq6j1mqUa"}, {"customAttributes": {"v7k05HAQltnSojV4": {}, "jT65yclX2FtAz0vJ": {}, "jFIYWOaNdsimmkW2": {}}, "inventoryId": "miH3xRHAKy4QxZka", "serverCustomAttributes": {"XZ7vmiEd0JPxVyQp": {}, "shaDwNqTbbFMXAMf": {}, "VXe0GZeMgsRsmH1E": {}}, "slotId": "QrYmkPKTPOlhTtSi", "sourceItemId": "ZNCxuogFteTHJe4B", "tags": ["hSSQkQD6WmOt6D7u", "fFVTOhvQpfbBke8a", "Edd36xj6wySoltDx"], "type": "sbzxrlaKEfkoYjY2"}]}], "requestId": "o6ouRW9UtNquwC3W"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '14' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["sQryiEtOAbpeUNf2", "6UqkCfgCUYBn2xaO", "BdPF0JmX8qwU1cTu"], "serviceName": "HHPB5S3DvPRCzBrV", "targetInventoryCode": "UxmDOj3cvRFaTC11"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'W0TGTCm4fZWuk6pQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["xDQpKqxLGeMvr9Ts", "vcMQ7dBsaIecRxIs", "ZvD6rmzVr5XT1Nxw"], "serviceName": "0v1dMQ9Rrbk6C2cV", "targetInventoryCode": "Wf6ttvbU1PO6ApCD"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId '2VXidT7w0Oc15N8W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'htCSHy1ei1fIrPvf' \
    --limit '69' \
    --offset '39' \
    --sortBy 'inventoryConfigurationCode' \
    --userId '7WQnp8jXZedgt5cy' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "Ne27HLtwtVOaxgP6", "userId": "Jbct8puMybYGxD9I"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'PmmsLmu3kaPj0O4z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'd8Tb7cUNGPTBxiFF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 59}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId '9oYMXMjlVHY1AHwF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "3vGoav7MK0PcLnEk"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'cokKwcQ0baDT9OyJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '15' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId '23GUS2amU7syGlEl' \
    --tags 'XdEAOrVSnLocLVVY' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'amQc4wcG5nDBLJoJ' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'HbiQ5duE5p4cfs2E' \
    --sourceItemId '41cK8QTwiIAvxSvN' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'DlmM5nQFMGzs7fzj' \
    --limit '13' \
    --offset '51' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "GtRUcCFeY5g4XgBs", "description": "bfzqxBPNe8ae1Il4", "initialMaxSlots": 1, "maxInstancesPerUser": 28, "maxUpgradeSlots": 54, "name": "QLYXxm09wpGAbpEm"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'DY9vLh3u6EDsUmrV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '6kH4OotKwG3UC6XC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nnZxF8CmQr17W65b", "description": "r34rBBN9tU6TDm5G", "initialMaxSlots": 23, "maxInstancesPerUser": 98, "maxUpgradeSlots": 30, "name": "MDu87t0ldWf7iSGI"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'iKFtWtn4Yr2svKM6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '34' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "LGZ0TBujELAUK6mQ"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName '5iZgbwwm5iGzXtck' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '16' \
    --owner 'rgidKupvXO6aj4hC' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "1NDBvQvRPnAz4VzW", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'CpoBCbyJsF5IjF1c' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId '0W338HS6CBgVRyih' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YNZ84CVhziXV8HwS' \
    --body '{"qty": 26, "slotId": "2zccA8wvLsWUNd6l", "sourceItemId": "PKvqDejvqklTSvDw"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'uOrP9lzpiX0VuFpZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'um7izxe7NPzjOa8E' \
    --body '[{"customAttributes": {"7wY76PxLv9HBEUe8": {}, "9AwEw1HO4FnKtx4X": {}, "LKAmlDr19uJ3nq6V": {}}, "serverCustomAttributes": {"erzVCcI8y3Cz0YqC": {}, "KUh5RD9vNAp4jinF": {}, "pnQ5xF9wwbvMZyeD": {}}, "slotId": "eRnVfPUa6xVVBcq3", "sourceItemId": "wZpFIYeAg79HcLJX", "tags": ["J7mpVI6eTYAjdPlC", "iQQC35cj4KyOVgvn", "WbfRJtsB7cUQZ2QU"], "type": "AxJrINPXppPNO3Af"}, {"customAttributes": {"mXcgwC3IN6tvKgLB": {}, "9QmJIOq9dP5szG71": {}, "utjsQ4CrRb9gUCeV": {}}, "serverCustomAttributes": {"z7fWbZIdhevfZvyV": {}, "7AcodcZwKjYDdmJO": {}, "lzwm9Su4FnS98Qqf": {}}, "slotId": "tSjq7sn8yreciPLf", "sourceItemId": "kVyyJsbGpO6JgehD", "tags": ["JxEN7JlZc8LMq1o2", "jZWu4yA3r0u4q1bT", "HXIjfJKyFlM0u1uu"], "type": "oVdn9yVoSlKNchPH"}, {"customAttributes": {"NL4X3LLaGPGdqLE8": {}, "SohhhuiTnJarYYkH": {}, "BDdSzBXdxapwhd5I": {}}, "serverCustomAttributes": {"QYBQuxLvPuWYvE3f": {}, "sNy9Z9OhxXvCp9y7": {}, "fLD2qfCXnlUnqxT1": {}}, "slotId": "WsRNMZcA92hzC7MN", "sourceItemId": "a8vVe4MHX6AgMep9", "tags": ["0AyyUJyAK5PRMRMw", "dvl0hv6g62GxBW2t", "QF5tkTjgJaMYvNQO"], "type": "sDa4bkcgepqtxjbr"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'ztee7QLTGAak7Kao' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l01DK97D2xnik42m' \
    --body '{"customAttributes": {"iteR5eQAe1rzmmgq": {}, "BPRmd6mO4oI8KDqe": {}, "bm83raNBJ5y7axEk": {}}, "qty": 44, "serverCustomAttributes": {"68eqGJtWf1Ybgg8r": {}, "dwY9bmrvHmO07KNq": {}, "X9LM2IwEsdOGBXBw": {}}, "slotId": "nzDX8v3xgC1Ge9Pd", "slotUsed": 2, "source": "OTHER", "sourceItemId": "TAJ2Gp1r0sVZ6LJA", "tags": ["OddIL2l3hPjNDKv2", "LWfXqjr8fS79En3w", "YowBdkaZ3y6i38XQ"], "type": "jLDRqkpiFK5BtiQ2"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '72Uo9UBJWodpdwsX' \
    --namespace "$AB_NAMESPACE" \
    --userId '1jorcyR0x3YiHF8I' \
    --body '[{"slotId": "TGPRQBCgIs1Q2lzx", "sourceItemId": "l0yF5m77TTh4gUoj"}, {"slotId": "8u2WRcLiEtzVlnkf", "sourceItemId": "lfn7pHY48F1dl1q9"}, {"slotId": "2m3iRlfnBAk0CwiA", "sourceItemId": "sR65yQ9ssuHdGmxn"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCEr0KcgeqzGbruN' \
    --body '{"customAttributes": {"B72HHMkjzyBB4UFK": {}, "iaoV0VOem2yqPsMF": {}, "xKybPkbuS6x9cLJ1": {}}, "inventoryConfigurationCode": "APnNlsa2bRBr27fV", "qty": 79, "serverCustomAttributes": {"9U4jReteIMgzISom": {}, "CsodJrhQW41q2Osp": {}, "CZbt3Uta5I0uGcL1": {}}, "slotId": "koyHjCH5olYLETRp", "slotUsed": 54, "source": "ECOMMERCE", "sourceItemId": "BAmO2EGvJ4UMS93y", "tags": ["OxNInDByhnoluO6t", "i0QP2ssiJ66OzOj8", "4O6tgohjtC7bzjPp"], "type": "ucddXJ5zifF8y959"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'anrNSleywHbHig6I' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'KWVZ77KeRWdECaFG' \
    --body '{"entitlementType": "zfZ2hxcJ2Fnemn7M", "inventoryConfig": {"slotUsed": 55}, "itemId": "3SzUo4hNBDh9ZFP1", "itemType": "OW0nXOErQPS4VsRo", "items": [{"bundledQty": 71, "entitlementType": "mulP4tQ6R1OqKVOT", "inventoryConfig": {"slotUsed": 28}, "itemId": "xjHkinOD975nARHC", "itemType": "mhNHSXuqIHsxvaUo", "sku": "XDmwWsukxncuD3Qx", "stackable": true, "useCount": 49}, {"bundledQty": 78, "entitlementType": "f0R9s2kndhhZhwAi", "inventoryConfig": {"slotUsed": 76}, "itemId": "IZsWhkS476dGGJwJ", "itemType": "00UH197MJ6zU7JLM", "sku": "QyMWzYQCAaPJgoxG", "stackable": true, "useCount": 30}, {"bundledQty": 71, "entitlementType": "JaSzUtY4ZD0Xtb0U", "inventoryConfig": {"slotUsed": 38}, "itemId": "pH16NUsVY21NVIs7", "itemType": "NRen2Y3Ns0QJQeaW", "sku": "ytPfds1BYx0EaURy", "stackable": false, "useCount": 11}], "quantity": 10, "sku": "8ZyyZeHAWGgJUbUJ", "stackable": false, "useCount": 2}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'HDT8QbF7gHPTPQbv' \
    --limit '76' \
    --offset '68' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '98' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '89' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'qJGIKzLyH1y72L13' \
    --limit '84' \
    --offset '11' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'IuBWgJTNFfM8M0IW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 20, "slotId": "oe8KDgy0xZfAcNg1", "sourceItemId": "4Ws8TIP1LKiFQoLD"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'vumfqrgSfnx2h61X' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '7' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'N1MGRXBJ6mVV7JS9' \
    --tags 'qjNLwvI8JdiY3RRi' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'LilmOGF6dLLIeIVI' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"jMcdlbdRXTGIrdNL": {}, "5gJPqTAjgqaTHf1A": {}, "NTJ9Yk997XkGOdC6": {}}, "slotId": "ItxDT8p4n4XCFkD1", "sourceItemId": "AJLCwszbZxuHSgDO", "tags": ["K8bjoF7bL2635Kbt", "ZTGJpqgl2IzNXGTu", "QPIDpor7t1aJLNNz"]}, {"customAttributes": {"6QIVC9Mfuc8VOsnm": {}, "nlVljdWYmELe74p3": {}, "8vumnxAnYBTxaTIz": {}}, "slotId": "0jcgDI8Pkz96vd80", "sourceItemId": "msqIm5bufnBqrpLe", "tags": ["qhwVhjnnjKMEmtbi", "WsAQHbMrKYi0Zxs5", "SWCqZXHLLa31oQf7"]}, {"customAttributes": {"BULnZDhutDM6Bqgu": {}, "qD5xxGxBWtnTKUe2": {}, "znsqPzPkwCBo2SwC": {}}, "slotId": "UsTag4MLAo3m61P2", "sourceItemId": "xaNfmn8Onb1a9gMz", "tags": ["0F2UBRmMhAbUWmFh", "dYLWzMuv3zkUY0n0", "BAZkwbYkBLyO6A0F"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'qfhnaB3YxKNdOTac' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "CcJfIfXshuLUk5Wd", "sourceItemId": "pxjZx5noXPhPUTKb"}, {"slotId": "onoucNmzwOZOK56s", "sourceItemId": "Dkci5rZ8iMlOuksQ"}, {"slotId": "JCiRFiZWwJ7NrTb1", "sourceItemId": "XTB9YQzUJ9XlYJ8B"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'zP6EUmUXGM5anIlo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 50, "slotId": "HdVfZVDAiU6iJOF7", "sourceItemId": "JKZFNk2NKy59X8iO"}, {"qty": 12, "slotId": "MYXlrJ81lHvv9rqv", "sourceItemId": "EoM8YmVjAkO3HKsE"}, {"qty": 32, "slotId": "v6VTnOK7xAvM7tuL", "sourceItemId": "81lsR7xxSVp3Gd2T"}], "srcInventoryId": "K0HzYviTgYmx82JV"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'BRLPZ6Iz8tne5dbg' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'uBF6Gsvvdl8jHz9x' \
    --sourceItemId '7XZIjU4IK9lOLaZa' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE