// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// The `fine_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
public struct FineTuningJobCheckpoint: Codable {
    /// The checkpoint identifier, which can be referenced in the API endpoints.
    public var id: String
    /// The Unix timestamp (in seconds) for when the checkpoint was created.
    public var createdAt: Int
    /// The name of the fine-tuned checkpoint model that is created.
    public var fineTunedModelCheckpoint: String
    /// The step number that the checkpoint was created at.
    public var stepNumber: Int
    /// Metrics at the step number during the fine-tuning job.
    public var metrics: Metrics
    /// The name of the fine-tuning job that this checkpoint was created from.
    public var fineTuningJobID: String
    /// The object type, which is always "fine_tuning.job.checkpoint".
    public var object: Object

    /// Metrics at the step number during the fine-tuning job.
    public struct Metrics: Codable {
        public var step: Double?
        public var trainLoss: Double?
        public var trainMeanTokenAccuracy: Double?
        public var validLoss: Double?
        public var validMeanTokenAccuracy: Double?
        public var fullValidLoss: Double?
        public var fullValidMeanTokenAccuracy: Double?

        public init(step: Double? = nil, trainLoss: Double? = nil, trainMeanTokenAccuracy: Double? = nil, validLoss: Double? = nil, validMeanTokenAccuracy: Double? = nil, fullValidLoss: Double? = nil, fullValidMeanTokenAccuracy: Double? = nil) {
            self.step = step
            self.trainLoss = trainLoss
            self.trainMeanTokenAccuracy = trainMeanTokenAccuracy
            self.validLoss = validLoss
            self.validMeanTokenAccuracy = validMeanTokenAccuracy
            self.fullValidLoss = fullValidLoss
            self.fullValidMeanTokenAccuracy = fullValidMeanTokenAccuracy
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.step = try values.decodeIfPresent(Double.self, forKey: "step")
            self.trainLoss = try values.decodeIfPresent(Double.self, forKey: "train_loss")
            self.trainMeanTokenAccuracy = try values.decodeIfPresent(Double.self, forKey: "train_mean_token_accuracy")
            self.validLoss = try values.decodeIfPresent(Double.self, forKey: "valid_loss")
            self.validMeanTokenAccuracy = try values.decodeIfPresent(Double.self, forKey: "valid_mean_token_accuracy")
            self.fullValidLoss = try values.decodeIfPresent(Double.self, forKey: "full_valid_loss")
            self.fullValidMeanTokenAccuracy = try values.decodeIfPresent(Double.self, forKey: "full_valid_mean_token_accuracy")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(step, forKey: "step")
            try values.encodeIfPresent(trainLoss, forKey: "train_loss")
            try values.encodeIfPresent(trainMeanTokenAccuracy, forKey: "train_mean_token_accuracy")
            try values.encodeIfPresent(validLoss, forKey: "valid_loss")
            try values.encodeIfPresent(validMeanTokenAccuracy, forKey: "valid_mean_token_accuracy")
            try values.encodeIfPresent(fullValidLoss, forKey: "full_valid_loss")
            try values.encodeIfPresent(fullValidMeanTokenAccuracy, forKey: "full_valid_mean_token_accuracy")
        }
    }

    /// The object type, which is always "fine_tuning.job.checkpoint".
    public enum Object: String, Codable, CaseIterable {
        case fineTuningJobCheckpoint = "fine_tuning.job.checkpoint"
    }

    public init(id: String, createdAt: Int, fineTunedModelCheckpoint: String, stepNumber: Int, metrics: Metrics, fineTuningJobID: String, object: Object) {
        self.id = id
        self.createdAt = createdAt
        self.fineTunedModelCheckpoint = fineTunedModelCheckpoint
        self.stepNumber = stepNumber
        self.metrics = metrics
        self.fineTuningJobID = fineTuningJobID
        self.object = object
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.createdAt = try values.decode(Int.self, forKey: "created_at")
        self.fineTunedModelCheckpoint = try values.decode(String.self, forKey: "fine_tuned_model_checkpoint")
        self.stepNumber = try values.decode(Int.self, forKey: "step_number")
        self.metrics = try values.decode(Metrics.self, forKey: "metrics")
        self.fineTuningJobID = try values.decode(String.self, forKey: "fine_tuning_job_id")
        self.object = try values.decode(Object.self, forKey: "object")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(fineTunedModelCheckpoint, forKey: "fine_tuned_model_checkpoint")
        try values.encode(stepNumber, forKey: "step_number")
        try values.encode(metrics, forKey: "metrics")
        try values.encode(fineTuningJobID, forKey: "fine_tuning_job_id")
        try values.encode(object, forKey: "object")
    }
}
