module Main exposing (..)

import Perceptron
import Layer exposing ( Layer )
import TransferFunction
import Neuron exposing ( Neuron(..) )
import NeuralSignal exposing ( NeuralSignals )

initialNetwork : Layer
initialNetwork =
  [ Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  ]

inputAndExpectedOutput : List { expectedOutput : NeuralSignals, input : NeuralSignals }
inputAndExpectedOutput = 
  [ { input = [ -1.0, 1.0 ], expectedOutput = [ 1.0 ] }
  , { input = [ -1.0, -1.0 ], expectedOutput = [ 1.0 ] }
  , { input = [ 0.0, 0.0 ], expectedOutput = [ 0.0 ] }
  , { input = [ 1.0, 0.0 ], expectedOutput = [ 0.0 ] }
  ]

trainedNetwork : Layer
trainedNetwork = Perceptron.train inputAndExpectedOutput initialNetwork