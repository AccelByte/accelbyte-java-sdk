# Copyright (c) 2022 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

SHELL := /bin/bash

.PHONY: build samples

build:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
			gradle --console=plain -i --no-daemon build

samples:
	rm -f samples.err
	find samples -type f -iname build.gradle -exec dirname {} \; | while read DIRECTORY; do \
		echo -e "\n# $$DIRECTORY\n"; \
		docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/$$DIRECTORY -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
				gradle --console=plain -i --no-daemon build || touch samples.err; \
	done
	[ ! -f samples.err ] || (rm samples.err && exit 1)

test_core:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	sed -i "s/\r//" "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" && \
			trap "docker stop -t 1 justice-codegen-sdk-mock-server && docker rm -f justice-codegen-sdk-httpbin" EXIT && \
			docker run -d --name justice-codegen-sdk-httpbin -p 8070:80 kennethreitz/httpbin && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec &) && \
			(for i in $$(seq 1 10); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8070" 2>/dev/null && exit 0 || sleep 10; done; exit 1) && \
			(for i in $$(seq 1 10); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8080" 2>/dev/null && exit 0 || sleep 10; done; exit 1) && \
			docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --network host -e AB_HTTPBIN_URL=http://localhost:8070 -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
					gradle --console=plain -i --no-daemon testCore
	
test_integration:
	@test -n "$(ENV_FILE_PATH)" || (echo "ENV_FILE_PATH is not set" ; exit 1)
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --env-file $(ENV_FILE_PATH) -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
			gradle --console=plain -i --no-daemon testIntegration

test_cli:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	rm -f test.err
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/samples/cli -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
			gradle --console=plain -i --no-daemon installDist
	sed -i "s/\r//" "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" && \
			trap "docker stop -t 1 justice-codegen-sdk-mock-server" EXIT && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec &) && \
			(for i in $$(seq 1 10); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/8080" 2>/dev/null && exit 0 || sleep 10; done; exit 1) && \
			sed -i "s/\r//" samples/cli/tests/* && \
			rm -f samples/cli/tests/*.tap && \
			for FILE in $$(ls samples/cli/tests/*.sh); do \
					echo "# $$(basename "$$FILE")"; \
					(set -o pipefail; docker run --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data -w /data/samples/cli  --network host -e GRADLE_USER_HOME=/data/.gradle gradle:7.5.1-jdk8 \
							bash "/data/$${FILE}" | tee "$${FILE}.tap") || touch test.err; \
			done
	[ ! -f test.err ]

publish:
	docker run -t --rm -u  $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ -e GRADLE_USER_HOME=/data/.gradle \
			-e PUBLISH_OSSRH_USERNAME="$$PUBLISH_OSSRH_USERNAME" -e PUBLISH_OSSRH_PASSWORD="$$PUBLISH_OSSRH_PASSWORD" \
			-e PUBLISH_ASC_KEY="$$(cat "$$PUBLISH_ASC_KEY_FILE_PATH")" -e PUBLISH_ASC_KEY_PASSWORD="$$PUBLISH_ASC_KEY_PASSWORD" \
			gradle:7.5.1-jdk8 gradle --console=plain -i --no-daemon publishToSonatype closeAndReleaseSonatypeStagingRepository

test_broken_link:
	@test -n "$(SDK_MD_CRAWLER_PATH)" || (echo "SDK_MD_CRAWLER_PATH is not set" ; exit 1)
	rm -f test.err
	bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i README.md
	#DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i CHANGELOG.md
	(for FILE in $$(find docs -type f); do \
			(set -o pipefail; DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i $$FILE) || touch test.err; \
	done)
	DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i "https://docs.accelbyte.io/guides/customization/java-sdk-guide.html"
	[ ! -f test.err ]

version:
	if [ -n "$$MAJOR" ]; then VERSION_PART=1; elif [ -n "$$PATCH" ]; then VERSION_PART=3; else VERSION_PART=2; fi &&	# Bump minor version if MAJOR or MINOR is not set \
			VERSION_OLD=$$(cat version.txt | tr -d '\n') && \
			VERSION_NEW=$$(awk -v part=$$VERSION_PART -F. "{OFS=\".\"; \$$part+=1; print \$$0}" version.txt) && \
			echo $${VERSION_NEW} > version.txt &&	# Bump version.txt \
			sed -i "s/version = '[0-9]\+\.[0-9]\+\.[0-9]\+'/version = '$$VERSION_NEW'/" build.gradle &&		# Bump build.gradle \
			sed -i "s/private String sdkVersion = \"[0-9]\+\.[0-9]\+\.[0-9]\+\";\+/private String sdkVersion = \"$$VERSION_NEW\";/" src/main/java/net/accelbyte/sdk/core/SDKInfo.java &&		# Bump SDK \
			sed -i "s/implementation 'net.accelbyte.sdk:sdk:[0-9]\+\.[0-9]\+\.[0-9]\+'\+/implementation 'net.accelbyte.sdk:sdk:$$VERSION_OLD'/" samples/getting-started/app/build.gradle		# Bump getting-started sample app
