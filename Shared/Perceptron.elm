module Perceptron exposing ( adjustNeuron, adjustLayer, adjustLayerForAll )

import Neuron exposing ( Neuron(..), Weights, Bias )
import NeuralSignal exposing ( NeuralSignal, NeuralSignals )
import Layer exposing ( Layer ) 

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
adjustNeuron : NeuralSignals -> NeuralSignal -> Neuron -> Neuron
adjustNeuron input expectedOutput neuron =
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
    
adjustLayer : NeuralSignals -> NeuralSignals -> Layer -> Layer
adjustLayer input expectedOutput neurons =
  List.map2 (adjustNeuron input) expectedOutput neurons
  
type alias InputAndExpectedOutput = { input: NeuralSignals, expectedOutput: NeuralSignals } 
  
adjustLayerForAll : List InputAndExpectedOutput -> Layer -> Layer
adjustLayerForAll inputsAndExpectedOutputs neurons =
  let
    adjustForInputAndExpectedOutput : InputAndExpectedOutput -> Layer -> Layer
    adjustForInputAndExpectedOutput { input, expectedOutput } acc = adjustLayer input expectedOutput acc 
  in
    List.foldl adjustForInputAndExpectedOutput neurons inputsAndExpectedOutputs