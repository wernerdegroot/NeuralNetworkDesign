module Neuron exposing
  ( Bias
  , Weight
  , Weights
  , Neuron(..)
  , act
  , getWeights
  , getBias
  , getTransferFunction
  )

import NeuralSignal exposing ( NeuralSignal, NeuralSignals )
import TransferFunction exposing ( TransferFunction )

type alias Bias = Float
type alias Weight = Float
type alias Weights = List Weight

type Neuron = Neuron Weights Bias TransferFunction

-- Accessors:
getWeights : Neuron -> Weights
getWeights (Neuron weights _ _) = weights

getBias : Neuron -> Bias
getBias (Neuron _ bias _) = bias

getTransferFunction : Neuron -> TransferFunction
getTransferFunction (Neuron _ _ transferFunction) = transferFunction

-- Other:
sum : List NeuralSignal -> NeuralSignal
sum = List.foldr (+) 0.0

applyWeights : NeuralSignals -> Weights -> NeuralSignals
applyWeights = List.map2 (*)

act : NeuralSignals -> Neuron -> NeuralSignal
act neuralSignals (Neuron weights bias transferFunction) =
  let
    weightedInput = applyWeights neuralSignals weights
    summerOutput = sum weightedInput + bias
  in
    transferFunction summerOutput