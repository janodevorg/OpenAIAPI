SOURCES_DIR := ../../Sources
PATCHES_DIR := patches
DOWNLOAD_URL := https://raw.githubusercontent.com/openai/openai-openapi/refs/heads/master/openapi.yaml
OPENAPI_TEMP := openapi.yaml.temp

# If there's a tag, we'll use `git describe --tags --abbrev=0`.
# If no tag exists, default to 'unknown'.
VERSION := $(shell git ls-remote --tags --refs --sort="version:refname" https://github.com/openai/openai-openapi.git \
             | tail -n1 \
             | sed 's/.*refs\/tags\///')

# Use the short commit hash. If that fails, also default to 'unknown'.
COMMIT := $(shell git ls-remote https://github.com/openai/openai-openapi.git HEAD \
            | cut -f1 \
            | cut -c1-7)

# Construct a final name like openapi-2.3.0-25be478.yaml
FINAL_FILE := openapi-$(VERSION)-$(COMMIT).yaml

DESTINATION_PATHS := $(SOURCES_DIR)/openapi.yaml

PATCH_FILES := $(sort $(wildcard $(PATCHES_DIR)/*.patch))

all: check_dirs download patch copy

help:
	@echo "Usage:"
	@echo "    make"
	@echo ""
	@echo "This will:"
	@echo "  - Ensure there is a patches folder"
	@echo "  - Download openapi.yaml as openapi.yaml.temp"
	@echo "  - Apply each patch existing in the folder patches"
	@echo "  - Rename the resulting file to '$(FINAL_FILE)'"
	@echo ""
	@exit 0

check_dirs:
	@[ -d "$(SOURCES_DIR)" ] || (echo "Error: '$(SOURCES_DIR)' directory does not exist. Stopping."; exit 1)
	@[ -d "$(PATCHES_DIR)" ] || (echo "Error: '$(PATCHES_DIR)' directory does not exist. Stopping."; exit 1)

download:
	@echo "Downloading openapi.yaml..."
	curl -sL "$(DOWNLOAD_URL)" -o "$(OPENAPI_TEMP)"
	@echo "Download complete."

patch:
	@echo "Applying patches..."
	@if [ -z "$(PATCH_FILES)" ]; then \
	  echo "No patch files found in '$(PATCHES_DIR)'."; \
	else \
	  for patch_file in $(PATCH_FILES); do \
	    echo "Applying patch: $$patch_file"; \
	    patch "$(OPENAPI_TEMP)" < "$$patch_file"; \
	  done; \
	  echo "All patches applied."; \
	fi

copy:
	@echo "Copying patched file to $(FINAL_FILE)..."
	cp "$(OPENAPI_TEMP)" "$(DESTINATION_PATHS)"
	rm -f $(OPENAPI_TEMP)
	@echo "Done."

clean:
	rm -f "$(OPENAPI_TEMP)"
	@echo "Cleaned up temporary files."
