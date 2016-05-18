module Neuron where
  ( Bias
  , Weight
  , Weights
  , NeuralSignals
  , Neuron
  , createWeights
  , act
  )

import Dict exposing ( Dict )
import NeuralSignal exposing ( NeuralSignal, NeuralSignals )
import TransferFunction exposing ( TransferFunction )

type alias Bias = Float
type alias Weight = Float
type Weights = Weights (Dict NeuralSignal.Index Weight)

type Neuron = Neuron Weights Bias TransferFunction
  
createWeights : List ( NeuralSignal.Index, Weight ) -> Weights
createWeights = Dict.fromList >> Weights

findAndApplyWeight : Weights -> NeuralSignal -> NeuralSignal.Value
findAndApplyWeight (Weights weightsByIndex) (index, value) =
  let
    weight = weightsByIndex
      |> Dict.get index
      |> Maybe.withDefault 0.0
  in
    weight * value

sum : List NeuralSingal.Value -> NeuralSignal.Value
sum = List.foldr (+) 0.0

applyWeights : NeuralSignals -> Weights -> NeuralSignal.Value
applyWeights neuralSignals weights =
  List.map (findAndApplyWeight weights) neuralSignals

act : NeuralSignals -> Neuron -> NeuralSignal.Value
act neuralSignals (Neuron weights bias transferFunction) =
  let
    weightedInput = applyWeights neuralSignals weights
    summerOutput = sum weightedInput + bias
  in
    TransferFunction.apply transferFunction summerOutput