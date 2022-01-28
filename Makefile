# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

.PHONY: build samples

build:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle build

samples:
	rm -f samples.err
	find samples -type f -iname build.gradle -exec dirname {} \; | while read DIRECTORY; do \
		echo "# $$DIRECTORY"; \
		docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/$$DIRECTORY gradle:jdk17 gradle build || touch samples.err; \
	done
	[ ! -f samples.err ] || (rm samples.err && exit 1)

test:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle test

publish:
	docker run -e AB_NEXUS_USERNAME=${AB_NEXUS_USERNAME} -e AB_NEXUS_PASSWORD=${AB_NEXUS_PASSWORD} -t --rm -u  \
	$$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ gradle:jdk17 gradle publish