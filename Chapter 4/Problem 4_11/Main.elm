module Main exposing (..)

import Perceptron
import Layer exposing ( Layer )
import TransferFunction
import Neuron exposing ( Neuron(..) )
import NeuralSignal exposing ( NeuralSignals )

initialNetwork : Layer
initialNetwork =
  [ Neuron [ 1.0, 0.0 ] 0.5 TransferFunction.Hardlim
  ]

inputAndExpectedOutput : List { expectedOutput : NeuralSignals, input : NeuralSignals }
inputAndExpectedOutput = 
  [ { input = [ 1.0, 4.0 ], expectedOutput = [ 0.0 ] }
  , { input = [ 1.0, 5.0 ], expectedOutput = [ 0.0 ] }
  , { input = [ 2.0, 4.0 ], expectedOutput = [ 0.0 ] }
  , { input = [ 2.0, 5.0 ], expectedOutput = [ 0.0 ] }
  , { input = [ 3.0, 1.0 ], expectedOutput = [ 1.0 ] }
  , { input = [ 3.0, 2.0 ], expectedOutput = [ 1.0 ] }
  , { input = [ 4.0, 1.0 ], expectedOutput = [ 1.0 ] }
  , { input = [ 4.0, 2.0 ], expectedOutput = [ 1.0 ] }
  ]

trainedNetwork : Layer
trainedNetwork = Perceptron.train inputAndExpectedOutput initialNetwork

testAllInputVectors : List Bool
testAllInputVectors =
  List.map (\{ input, expectedOutput } -> Layer.act input trainedNetwork == expectedOutput) inputAndExpectedOutput