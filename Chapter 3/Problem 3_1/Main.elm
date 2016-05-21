module Main exposing ( .. )

import Neuron exposing ( Neuron(..) )
import TransferFunction
import Layer

type alias Shape = Float
type alias Texture = Float
type alias Weight = Float
type alias IsBanana = Bool

perceptron : Shape -> Texture -> Weight -> IsBanana
perceptron shape texture weight =
  let
    neuron = Neuron [ 0.0, 1.0, -1.0 ] 0.0 TransferFunction.hardlims
    neuronOutput = Neuron.act [ shape, texture, weight ] neuron
  in
    neuronOutput == 1.0

hamming : Shape -> Texture -> Weight -> IsBanana
hamming shape texture weight =
  let
    firstLayer =
      [ Neuron [ -1.0, 1.0, -1.0 ] 3.0 TransferFunction.purelin
      , Neuron [ -1.0, -1.0, 1.0 ] 3.0 TransferFunction.purelin 
      ]
      
    secondLayer =
      [ Neuron [ 1.0, -0.5 ] 0.0 TransferFunction.poslin
      , Neuron [ -0.5, 1.0 ] 0.0 TransferFunction.poslin
      ]
    
    firstLayerOutput = Layer.act [ shape, texture, weight ] firstLayer
    
    secondLayerOutput = Layer.convergeRecurrent firstLayerOutput secondLayer 
  in
    case secondLayerOutput of
      [ x, y ] -> x > y
      _ -> Debug.crash "The output of the Hamming network is expected to consist of two elements!"
      
hopfield : Shape -> Texture -> Weight -> IsBanana
hopfield shape texture weight =
  let
    layer =
      [ Neuron [ 0.2, 0.0, 0.0 ] -0.9 TransferFunction.satlins
      , Neuron [ 0.0, 1.2, 0.0 ] 0.0 TransferFunction.satlins
      , Neuron [ 0.0, -1.2, 0.0 ] 0.0 TransferFunction.satlins
      ]
    
    layerOutput = Layer.convergeRecurrent [ shape, texture, weight ] layer
    
    bananaPrototype = [ -1.0, 1.0, -1.0 ]
  in
    Layer.closeEnough layerOutput bananaPrototype