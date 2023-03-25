#!/bin/bash -e -o pipefail

generate: createapi
	rm -rf Sources/Generated || true
	rm openapi.yaml || true
	wget https://raw.githubusercontent.com/openai/openai-openapi/master/openapi.yaml
	create-api generate openapi.yaml --config-option "module=OpenAIAPI"
	mkdir -p Sources/Generated
	mv CreateAPI/Sources/* Sources/Generated
	rm -rf CreateAPI || true
	patch Sources/Generated/Entities/FineTune.swift FineTune.patch

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

createapi: requirebrew
	@if ! command -v create-api &> /dev/null; then echo "Please install create-api using 'brew install create-api'"; exit 1; fi

requirebrew:
	@if ! command -v brew &> /dev/null; then echo "Please install brew from https://brew.sh/"; exit 1; fi

requirejq:
	@if ! command -v jq &> /dev/null; then echo "Please install jq using 'brew install jq'"; exit 1; fi
