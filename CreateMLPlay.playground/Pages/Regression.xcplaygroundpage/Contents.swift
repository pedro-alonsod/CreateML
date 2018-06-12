import Foundation
import CreateML
//Specify data
let houseData = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/pedroalonso/Documents/Apps/CreateML/RegressionML/HouseData.csv"))
let (trainingCSVData, testCSVData) = houseData.randomSplit(by: 0.8, seed: 0)
//2 create model
let pricer = try MLRegressor(trainingData: houseData, targetColumn: "MEDV")
//Evaluation

let metrics = pricer.evaluation(on: testCSVData)
print(testCSVData, "TestData", String(describing: metrics.playgroundDescription), houseData)
//Save model
let csvMetadata = MLModelMetadata(author: "Pedro Alonso", shortDescription: "A model used to determine the price of a house based on some features.", version: "1.0")
try pricer.write(to: URL(fileURLWithPath: "/Users/pedroalonso/Documents/Apps/CreateML/RegressionML/HouseData.mlmodel"), metadata: csvMetadata)
