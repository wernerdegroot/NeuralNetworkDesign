module Main exposing (..)

import Perceptron
import Layer exposing ( Layer )
import TransferFunction
import Neuron exposing ( Neuron(..) )
import NeuralSignal exposing ( NeuralSignals )

initialNetwork1 : Layer
initialNetwork1 =
  [ Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  , Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  , Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  ]

inputAndExpectedOutput1 : List { expectedOutput : NeuralSignals, input : NeuralSignals }
inputAndExpectedOutput1 = 
  [ { input = [ 1.0, 1.0 ], expectedOutput = [ 0.0, 1.0, 0.0 ] }
  , { input = [ 1.0, 2.0 ], expectedOutput = [ 0.0, 1.0, 0.0 ] }
  , { input = [ 2.0, 2.0 ], expectedOutput = [ 0.0, 1.0, 1.0 ] }
  , { input = [ 2.0, 0.0 ], expectedOutput = [ 0.0, 1.0, 1.0 ] }
  , { input = [ -1.0, 2.0 ], expectedOutput = [ 1.0, 0.0, 0.0 ] }
  , { input = [ -2.0, 1.0 ], expectedOutput = [ 1.0, 0.0, 0.0 ] }
  , { input = [ -1.0, -1.0 ], expectedOutput = [ 1.0, 1.0, 0.0 ] }
  , { input = [ -2.0, -2.0 ], expectedOutput = [ 1.0, 1.0, 0.0 ] }
  ]
  
initialNetwork2 : Layer
initialNetwork2 =
  [ Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  , Neuron [ 0.0, 0.0 ] 0.0 TransferFunction.Hardlim
  ]

trainedNetwork2 : Layer
trainedNetwork2 = Perceptron.train inputAndExpectedOutput2 initialNetwork2

inputAndExpectedOutput2 : List { expectedOutput : NeuralSignals, input : NeuralSignals }
inputAndExpectedOutput2 = 
  [ { input = [ 1.0, 1.0 ], expectedOutput = [ 0.0, 1.0 ] }
  , { input = [ 1.0, 2.0 ], expectedOutput = [ 0.0, 1.0 ] }
  , { input = [ 2.0, 1.5 ], expectedOutput = [ 0.0, 0.0 ] }
  , { input = [ 2.0, 0.0 ], expectedOutput = [ 0.0, 0.0 ] }
  , { input = [ -1.0, 2.0 ], expectedOutput = [ 1.0, 1.0 ] }
  , { input = [ -2.0, 1.0 ], expectedOutput = [ 1.0, 1.0 ] }
  , { input = [ -1.0, -1.0 ], expectedOutput = [ 1.0, 0.0 ] }
  , { input = [ -2.0, -2.0 ], expectedOutput = [ 1.0, 0.0 ] }
  ]