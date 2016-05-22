module Main exposing (..)

import NeuralSignal exposing ( NeuralSignals )
import Neuron exposing ( Neuron(..) )
import TransferFunction
import Layer

hamming : NeuralSignals -> { firstLayerOutput: NeuralSignals, secondLayerOutputs: List NeuralSignals }
hamming input =
  let
    firstLayer =
      [ Neuron [ 1.0, 1.0 ] 2.0 TransferFunction.purelin
      , Neuron [ -1.0, -1.0 ] 2.0 TransferFunction.purelin 
      , Neuron [ -1.0, 1.0 ] 2.0 TransferFunction.purelin
      ]
      
    secondLayer =
      [ Neuron [ 1.0, -0.2, -0.2 ] 0.0 TransferFunction.poslin
      , Neuron [ -0.2, 1.0, -0.2 ] 0.0 TransferFunction.poslin
      , Neuron [ -0.2, -0.2, 1.0 ] 0.0 TransferFunction.poslin
      ]
    
    firstLayerOutput = Layer.act input firstLayer
    
    secondLayerOutputs = Layer.convergeRecurrentWithIntermediate firstLayerOutput secondLayer 
  in
    { firstLayerOutput = firstLayerOutput, secondLayerOutputs = secondLayerOutputs }
    
answer = hamming [ 1.0, 0 ]