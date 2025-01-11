// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// Fine-Tuning Job Integration
public struct FineTuningIntegration: Codable {
    /// The type of the integration being enabled for the fine-tuning job
    public var type: `Type`
    /// The settings for your integration with Weights and Biases. This payload specifies the project that
    /// metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
    /// to your run, and set a default entity (team, username, etc) to be associated with your run.
    public var wandb: Wandb

    /// The type of the integration being enabled for the fine-tuning job
    public enum `Type`: String, Codable, CaseIterable {
        case wandb
    }

    /// The settings for your integration with Weights and Biases. This payload specifies the project that
    /// metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
    /// to your run, and set a default entity (team, username, etc) to be associated with your run.
    public struct Wandb: Codable {
        /// The name of the project that the new run will be created under.
        ///
        /// Example: "my-wandb-project"
        public var project: String
        /// A display name to set for the run. If not set, we will use the Job ID as the name.
        public var name: String?
        /// The entity to use for the run. This allows you to set the team or username of the WandB user that you would
        /// like associated with the run. If not set, the default entity for the registered WandB API key is used.
        public var entity: String?
        /// A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
        /// default tags are generated by OpenAI: "openai/finetune", "openai/{base-model}", "openai/{ftjob-abcdef}".
        public var tags: [String]?

        public init(project: String, name: String? = nil, entity: String? = nil, tags: [String]? = nil) {
            self.project = project
            self.name = name
            self.entity = entity
            self.tags = tags
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.project = try values.decode(String.self, forKey: "project")
            self.name = try values.decodeIfPresent(String.self, forKey: "name")
            self.entity = try values.decodeIfPresent(String.self, forKey: "entity")
            self.tags = try values.decodeIfPresent([String].self, forKey: "tags")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(project, forKey: "project")
            try values.encodeIfPresent(name, forKey: "name")
            try values.encodeIfPresent(entity, forKey: "entity")
            try values.encodeIfPresent(tags, forKey: "tags")
        }
    }

    public init(type: `Type`, wandb: Wandb) {
        self.type = type
        self.wandb = wandb
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(`Type`.self, forKey: "type")
        self.wandb = try values.decode(Wandb.self, forKey: "wandb")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(wandb, forKey: "wandb")
    }
}
