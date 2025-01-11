#!/bin/bash -e -o pipefail

generate: createapi requirewget
	rm -rf Sources/Generated || true 
	create-api generate openapi.yaml --config-option "module=OpenAIAPI"
	mv CreateAPI/Sources Sources/Generated
	rm -rf CreateAPI || true

refresh: requirewget
	rm openapi.yaml || true
	wget https://raw.githubusercontent.com/openai/openai-openapi/master/openapi.yaml

docc: requirejq
	rm -rf docs
	swift build
	DOCC_JSON_PRETTYPRINT=YES
	swift package \
 	--allow-writing-to-directory ./docs \
	generate-documentation \
 	--target OpenAIAPI \
 	--output-path ./docs \
 	--transform-for-static-hosting \
 	--hosting-base-path OpenAIAPI \
	--emit-digest
	cat docs/linkable-entities.json | jq '.[].referenceURL' -r | sort > docs/all_identifiers.txt
	sort docs/all_identifiers.txt | sed -e "s/doc:\/\/OpenAIAPI\/documentation\\///g" | sed -e "s/^/- \`\`/g" | sed -e 's/$$/``/g' > docs/all_symbols.txt
	@echo "Check https://janodevorg.github.io/OpenAIAPI/documentation/openaiapi/"
	@echo ""

test:
	set -o pipefail && xcodebuild test -scheme "OpenAIAPI-Package" -destination "OS=16.2,name=iPhone 14 Pro" -skipPackagePluginValidation | xcpretty
	set -o pipefail && xcodebuild test -scheme "OpenAIAPI-Package" -destination "platform=macOS,arch=arm64" -skipPackagePluginValidation | xcpretty
	set -o pipefail && xcodebuild test -scheme "OpenAIAPI-Package" -destination "platform=macOS,arch=arm64,variant=Mac Catalyst" -skipPackagePluginValidation | xcpretty
	set -o pipefail && xcodebuild test -scheme "OpenAIAPI-Package" -destination "platform=tvOS Simulator,name=Apple TV 4K (3rd generation)" -skipPackagePluginValidation | xcpretty
	set -o pipefail && xcodebuild test -scheme "OpenAIAPI-Package" -destination "platform=watchOS Simulator,name=Apple Watch Ultra (49mm)" -skipPackagePluginValidation | xcpretty	

createapi: requirebrew
	@if ! command -v create-api &> /dev/null; then echo "Please install create-api using 'brew install create-api'"; exit 1; fi

requirebrew:
	@if ! command -v brew &> /dev/null; then echo "Please install brew from https://brew.sh/"; exit 1; fi

requirewget:
	@if ! command -v brew &> /dev/null; then echo "Please install wget using 'brew install wget'"; exit 1; fi

requirejq:
	@if ! command -v jq &> /dev/null; then echo "Please install jq using 'brew install jq'"; exit 1; fi
