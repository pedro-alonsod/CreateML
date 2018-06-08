import CreateML
import Foundation
//1
let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/pedroalonso/Documents/Apps/CreateML/TextClassifier/spam.json"))
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
let spamClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")
//2
let trainingAccuracy = (1.0 - spamClassifier.trainingMetrics.classificationError) * 100
let validationAccuracy = (1.0 - spamClassifier.validationMetrics.classificationError) * 100
//3
let evaluationMetrics = spamClassifier.evaluation(on: testingData)
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100
//4
let metadata = MLModelMetadata(author: "Pedro Alonso", shortDescription: "A model trained to classify spam messages", version: "1.0")
try spamClassifier.write(to: URL(fileURLWithPath: "/Users/pedroalonso/Documents/Apps/CreateML/TextClassifier/SpamDetector.mlmodel"), metadata: metadata)
