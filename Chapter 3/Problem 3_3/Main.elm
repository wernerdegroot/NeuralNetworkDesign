module Main exposing ( .. )

import NeuralSignal exposing ( NeuralSignals )
import Neuron exposing ( Neuron(..) )
import TransferFunction
import Layer

network : List NeuralSignals 
network =
  let
    neurons =
      [ Neuron [ 1.0, -1.0 ] 0.0 TransferFunction.satlins
      , Neuron [ -1.0, 1.0 ] 0.0 TransferFunction.satlins
      ]
  in
    Layer.convergeRecurrentWithIntermediate [ 0.9, 1.0 ] neurons