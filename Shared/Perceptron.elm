module Perceptron exposing ( adjustNeuron )

import Neuron exposing ( Neuron(..), Weights, Bias )
import NeuralSignal exposing ( NeuralSignal, NeuralSignals )

-- Arithmetic with weights and biasses:
addWeights : Weights -> Weights -> Weights
addWeights = List.map2 (+)

multiplyWeights : Float -> Weights -> Weights
multiplyWeights factor = List.map ((*) factor)

addBias : Bias -> Bias -> Bias
addBias = (+)

multiplyBias : Float -> Bias -> Bias
multiplyBias = (*)

-- Other:
adjustNeuron : Neuron -> NeuralSignals -> NeuralSignal -> Neuron
adjustNeuron neuron input expectedOutput =
  let
    weights = Neuron.getWeights neuron
    bias = Neuron.getBias neuron
    transferFunction = Neuron.getTransferFunction neuron
    
    actualOutput = Neuron.act input neuron
    correction = expectedOutput - actualOutput
    
    adjustedWeights = addWeights weights (multiplyWeights correction input)
    adjustedBias = addBias bias (multiplyBias correction 1.0)
  in
    Neuron adjustedWeights adjustedBias transferFunction