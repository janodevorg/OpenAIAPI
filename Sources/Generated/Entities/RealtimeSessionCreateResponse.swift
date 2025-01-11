// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// A new Realtime session configuration, with an ephermeral key. Default TTL
/// for keys is one minute.
public struct RealtimeSessionCreateResponse: Codable {
    /// Ephemeral key returned by the API.
    public var clientSecret: ClientSecret?
    /// The set of modalities the model can respond with. To disable audio,
    /// set this to ["text"].
    public var modalities: [Modality]?
    /// The default system instructions (i.e. system message) prepended to model 
    /// calls. This field allows the client to guide the model on desired 
    /// responses. The model can be instructed on response content and format, 
    /// (e.g. "be extremely succinct", "act friendly", "here are examples of good 
    /// responses") and on audio behavior (e.g. "talk quickly", "inject emotion 
    /// into your voice", "laugh frequently"). The instructions are not guaranteed 
    /// to be followed by the model, but they provide guidance to the model on the 
    /// desired behavior.
    /// 
    /// Note that the server sets default instructions which will be used if this 
    /// field is not set and are visible in the `session.created` event at the 
    /// start of the session.
    public var instructions: String?
    /// The voice the model uses to respond. Voice cannot be changed during the 
    /// session once the model has responded with audio at least once. Current 
    /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`, 
    /// `shimmer` and `verse`.
    public var voice: Voice?
    /// The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
    public var inputAudioFormat: String?
    /// The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
    public var outputAudioFormat: String?
    /// Configuration for input audio transcription, defaults to off and can be 
    /// set to `null` to turn off once on. Input audio transcription is not native 
    /// to the model, since the model consumes audio directly. Transcription runs 
    /// asynchronously through Whisper and should be treated as rough guidance 
    /// rather than the representation understood by the model.
    public var inputAudioTranscription: InputAudioTranscription?
    /// Configuration for turn detection. Can be set to `null` to turn off. Server 
    /// VAD means that the model will detect the start and end of speech based on 
    /// audio volume and respond at the end of user speech.
    public var turnDetection: TurnDetection?
    /// Tools (functions) available to the model.
    public var tools: [Tool]?
    /// How the model chooses tools. Options are `auto`, `none`, `required`, or 
    /// specify a function.
    public var toolChoice: String?
    /// Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.
    public var temperature: Double?
    /// Maximum number of output tokens for a single assistant response,
    /// inclusive of tool calls. Provide an integer between 1 and 4096 to
    /// limit output tokens, or `inf` for the maximum available tokens for a
    /// given model. Defaults to `inf`.
    public var maxResponseOutputTokens: MaxResponseOutputTokens?

    /// Ephemeral key returned by the API.
    public struct ClientSecret: Codable {
        /// Ephemeral key usable in client environments to authenticate connections
        /// to the Realtime API. Use this in client-side environments rather than
        /// a standard API token, which should only be used server-side.
        public var value: String?
        /// Timestamp for when the token expires. Currently, all tokens expire
        /// after one minute.
        public var expiresAt: Int?

        public init(value: String? = nil, expiresAt: Int? = nil) {
            self.value = value
            self.expiresAt = expiresAt
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.value = try values.decodeIfPresent(String.self, forKey: "value")
            self.expiresAt = try values.decodeIfPresent(Int.self, forKey: "expires_at")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(value, forKey: "value")
            try values.encodeIfPresent(expiresAt, forKey: "expires_at")
        }
    }

    public enum Modality: String, Codable, CaseIterable {
        case text
        case audio
    }

    /// The voice the model uses to respond. Voice cannot be changed during the 
    /// session once the model has responded with audio at least once. Current 
    /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`, 
    /// `shimmer` and `verse`.
    public enum Voice: String, Codable, CaseIterable {
        case alloy
        case ash
        case ballad
        case coral
        case echo
        case sage
        case shimmer
        case verse
    }

    /// Configuration for input audio transcription, defaults to off and can be 
    /// set to `null` to turn off once on. Input audio transcription is not native 
    /// to the model, since the model consumes audio directly. Transcription runs 
    /// asynchronously through Whisper and should be treated as rough guidance 
    /// rather than the representation understood by the model.
    public struct InputAudioTranscription: Codable {
        /// The model to use for transcription, `whisper-1` is the only currently 
        /// supported model.
        public var model: String?

        public init(model: String? = nil) {
            self.model = model
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.model = try values.decodeIfPresent(String.self, forKey: "model")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(model, forKey: "model")
        }
    }

    /// Configuration for turn detection. Can be set to `null` to turn off. Server 
    /// VAD means that the model will detect the start and end of speech based on 
    /// audio volume and respond at the end of user speech.
    public struct TurnDetection: Codable {
        /// Type of turn detection, only `server_vad` is currently supported.
        public var type: String?
        /// Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A 
        /// higher threshold will require louder audio to activate the model, and 
        /// thus might perform better in noisy environments.
        public var threshold: Double?
        /// Amount of audio to include before the VAD detected speech (in 
        /// milliseconds). Defaults to 300ms.
        public var prefixPaddingMs: Int?
        /// Duration of silence to detect speech stop (in milliseconds). Defaults 
        /// to 500ms. With shorter values the model will respond more quickly, 
        /// but may jump in on short pauses from the user.
        public var silenceDurationMs: Int?

        public init(type: String? = nil, threshold: Double? = nil, prefixPaddingMs: Int? = nil, silenceDurationMs: Int? = nil) {
            self.type = type
            self.threshold = threshold
            self.prefixPaddingMs = prefixPaddingMs
            self.silenceDurationMs = silenceDurationMs
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.type = try values.decodeIfPresent(String.self, forKey: "type")
            self.threshold = try values.decodeIfPresent(Double.self, forKey: "threshold")
            self.prefixPaddingMs = try values.decodeIfPresent(Int.self, forKey: "prefix_padding_ms")
            self.silenceDurationMs = try values.decodeIfPresent(Int.self, forKey: "silence_duration_ms")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(threshold, forKey: "threshold")
            try values.encodeIfPresent(prefixPaddingMs, forKey: "prefix_padding_ms")
            try values.encodeIfPresent(silenceDurationMs, forKey: "silence_duration_ms")
        }
    }

    public struct Tool: Codable {
        /// The type of the tool, i.e. `function`.
        public var type: `Type`?
        /// The name of the function.
        public var name: String?
        /// The description of the function, including guidance on when and how 
        /// to call it, and guidance about what to tell the user when calling 
        /// (if anything).
        public var description: String?
        /// Parameters of the function in JSON Schema.
        public var parameters: [String: AnyJSON]?

        /// The type of the tool, i.e. `function`.
        public enum `Type`: String, Codable, CaseIterable {
            case function
        }

        public init(type: `Type`? = nil, name: String? = nil, description: String? = nil, parameters: [String: AnyJSON]? = nil) {
            self.type = type
            self.name = name
            self.description = description
            self.parameters = parameters
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.type = try values.decodeIfPresent(`Type`.self, forKey: "type")
            self.name = try values.decodeIfPresent(String.self, forKey: "name")
            self.description = try values.decodeIfPresent(String.self, forKey: "description")
            self.parameters = try values.decodeIfPresent([String: AnyJSON].self, forKey: "parameters")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(name, forKey: "name")
            try values.encodeIfPresent(description, forKey: "description")
            try values.encodeIfPresent(parameters, forKey: "parameters")
        }
    }

    /// Maximum number of output tokens for a single assistant response,
    /// inclusive of tool calls. Provide an integer between 1 and 4096 to
    /// limit output tokens, or `inf` for the maximum available tokens for a
    /// given model. Defaults to `inf`.
    public enum MaxResponseOutputTokens: Codable {
        case int(Int)
        case object(Object)

        public enum Object: String, Codable, CaseIterable {
            case inf
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Int.self) {
                self = .int(value)
            } else if let value = try? container.decode(Object.self) {
                self = .object(value)
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Data could not be decoded as any of the expected types (Int, Object)."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .int(let value): try container.encode(value)
            case .object(let value): try container.encode(value)
            }
        }
    }

    public init(clientSecret: ClientSecret? = nil, modalities: [Modality]? = nil, instructions: String? = nil, voice: Voice? = nil, inputAudioFormat: String? = nil, outputAudioFormat: String? = nil, inputAudioTranscription: InputAudioTranscription? = nil, turnDetection: TurnDetection? = nil, tools: [Tool]? = nil, toolChoice: String? = nil, temperature: Double? = nil, maxResponseOutputTokens: MaxResponseOutputTokens? = nil) {
        self.clientSecret = clientSecret
        self.modalities = modalities
        self.instructions = instructions
        self.voice = voice
        self.inputAudioFormat = inputAudioFormat
        self.outputAudioFormat = outputAudioFormat
        self.inputAudioTranscription = inputAudioTranscription
        self.turnDetection = turnDetection
        self.tools = tools
        self.toolChoice = toolChoice
        self.temperature = temperature
        self.maxResponseOutputTokens = maxResponseOutputTokens
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.clientSecret = try values.decodeIfPresent(ClientSecret.self, forKey: "client_secret")
        self.modalities = try values.decodeIfPresent([Modality].self, forKey: "modalities")
        self.instructions = try values.decodeIfPresent(String.self, forKey: "instructions")
        self.voice = try values.decodeIfPresent(Voice.self, forKey: "voice")
        self.inputAudioFormat = try values.decodeIfPresent(String.self, forKey: "input_audio_format")
        self.outputAudioFormat = try values.decodeIfPresent(String.self, forKey: "output_audio_format")
        self.inputAudioTranscription = try values.decodeIfPresent(InputAudioTranscription.self, forKey: "input_audio_transcription")
        self.turnDetection = try values.decodeIfPresent(TurnDetection.self, forKey: "turn_detection")
        self.tools = try values.decodeIfPresent([Tool].self, forKey: "tools")
        self.toolChoice = try values.decodeIfPresent(String.self, forKey: "tool_choice")
        self.temperature = try values.decodeIfPresent(Double.self, forKey: "temperature")
        self.maxResponseOutputTokens = try values.decodeIfPresent(MaxResponseOutputTokens.self, forKey: "max_response_output_tokens")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(clientSecret, forKey: "client_secret")
        try values.encodeIfPresent(modalities, forKey: "modalities")
        try values.encodeIfPresent(instructions, forKey: "instructions")
        try values.encodeIfPresent(voice, forKey: "voice")
        try values.encodeIfPresent(inputAudioFormat, forKey: "input_audio_format")
        try values.encodeIfPresent(outputAudioFormat, forKey: "output_audio_format")
        try values.encodeIfPresent(inputAudioTranscription, forKey: "input_audio_transcription")
        try values.encodeIfPresent(turnDetection, forKey: "turn_detection")
        try values.encodeIfPresent(tools, forKey: "tools")
        try values.encodeIfPresent(toolChoice, forKey: "tool_choice")
        try values.encodeIfPresent(temperature, forKey: "temperature")
        try values.encodeIfPresent(maxResponseOutputTokens, forKey: "max_response_output_tokens")
    }
}
