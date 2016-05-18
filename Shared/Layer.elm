module Layer exposing ( Layer(..), act )

import Neuron exposing ( Neuron )
import NeuralSignal exposing ( NeuralSignals )

type Layer = Layer ( List Neuron )

act : NeuralSignals -> Layer -> NeuralSignals
act neuralSignals ( Layer neurons ) =
  let
    neuronOutputs = List.map (Neuron.act neuralSignals) neurons
  in
    List.indexedMap (,) neuronOutputs