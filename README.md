Only 1.0.0 works. The generated code stopped compiling. Better use AIProxy.

[![Swift](https://github.com/janodevorg/OpenAIAPI/actions/workflows/swift.yml/badge.svg)](https://github.com/janodevorg/OpenAIAPI/actions/workflows/swift.yml) [![MIT license](http://img.shields.io/badge/license-MIT-lightgrey.svg)](http://opensource.org/licenses/MIT)

# OpenAIAPI

A Swift network client generated from the [OpenAI OpenAPI](https://github.com/openai/openai-openapi) definition.

[OpenAPI](https://en.wikipedia.org/wiki/OpenAPI_Specification) is a definition language to describe RESTful APIs like the one from OpenAPI. By using a code generator the client can be updated and [documented](https://janodevorg.github.io/OpenAIAPI/documentation/openaiapi/) with minimal effort. [CreateAPI](https://github.com/CreateAPI/CreateAPI) is one of such generators for the Swift language.

## Installation

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "git@github.com:OpenAIAPI/OpenAIAPI.git", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "...",
            dependencies: [
                .product(name: "OpenAIAPI", package: "OpenAIAPI")
            ]
        )
    ]
)
````

## Usage

To send a message:

```swift
let prompt = "hello there chatgpt!"
let api = APIClient(baseURL: URL(string: "https://api.openai.com/v1")!)
let completionRequest = CreateCompletionRequest(
    model: "text-ada-001",
    prompt: CreateCompletionRequest.Prompt.string(prompt),
    suffix: nil,
    maxTokens: 4_000,
    temperature: 0.7
)
var request = Paths.completions.post(completionRequest)
request.headers = ["Authorization": "Bearer YOUR_API_KEY"]
let completionResponse = try await api.send(request).value
```

The generated client doesn’t support Server Side Events or multipart encoding, so the client doesn’t support SSE or file upload/download on its own. If god is willing I’ll be adding support for this in the coming days.

## Regenerate the client

When OpenAI updates their OpenAPI definition you have to:  

1. [Install brew](https://brew.sh/)
2. Install CreateAPI: `brew install create-api`
3. Run make: `make`

Make will 
- download the [current definition](https://github.com/openai/openai-openapi/commits/master/openapi.yaml) 
- apply the patch `FineTune.patch`. This avoids a decoding error by changing `FineTune.hyperparams` from [String: AnyJSON] to `UnknownDictionary.swift`
- regenerate the client

Most likely, no manual changes will be needed.

## Need Get 2.1.6?

The SPM package generated depends on [Get](https://github.com/kean/Get) v1.0.2, and [URLQueryEncoder](https://github.com/CreateAPI/URLQueryEncoder) 0.2.0. Shall you ever need Get 2.1.6 and URLQueryEncoder 0.2.1, you may fork Get and add the file below to it. 

```swift
file: Request+Ext.swift
import Foundation

public extension Request {
    init(
        method: HTTPMethod = .get,
        url: String,
        query: [(String, String?)]? = nil,
        body: Encodable? = nil,
        headers: [String: String]? = nil,
        id: String? = nil
    ) {
        self.init(
            path: url,
            method: method,
            query: query,
            body: body,
            headers: headers,
            id: id
        )
    }
}
```

## About swiftlint

I’m using swiftlint as a SPM plugin. As of today (25 March 2023) this is problematic: 

- The swiftlint dependency checkout is huge, which wastes time and CPU. I can deal with it because my CI is a [self-hosted runner](https://github.com/janodevorg/OpenAIAPI/blob/main/.github/workflows/swift.yml#L14). An alternative is to generate a project with xcodegen and add a phase that uses a swiftlint installed with brew, or to write a plugin that uses a swiftlint binary ([like this](https://github.com/CreateAPI/CreateAPI/blob/main/Docs/SwiftPackagePlugins.md)).

- The current release (0.51.0-rc.2) ignores the `excludes` directive. This is fixed in main (see [issue #4722](https://github.com/realm/SwiftLint/issues/4722)) but requesting your plugin with `branch: "main"` has the unfortunate consequence of marking your package as unstable, which requires clients to be marked as unstable too (even if I tag OpenAPI as 1.0.1). What a mess. A workaround is to comment the swiftlint plugin in Package.swift, then uncommented in local, and ignore changes to the package (`git update-index --skip-worktree Package.swift`). This lets me lint locally without consequences for clients.

## Links of interest

- https://beta.openai.com/docs/api-reference/introduction An introduction to the API docs
- https://github.com/CreateAPI/CreateAPI Code generator for OpenAPI definitions
- https://github.com/kean/Get Network client used in the generated package
- https://github.com/openai/openai-openapi The OpenAI OpenAPI definition

