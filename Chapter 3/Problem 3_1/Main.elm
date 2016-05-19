module Main exposing ( .. )

import Neuron exposing ( Neuron(..) )
import TransferFunction

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
    
