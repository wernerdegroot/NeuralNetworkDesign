module Layer exposing ( Layer(..), act )

import Neuron exposing ( Neuron )
import NeuralSignal exposing ( NeuralSignals )

type alias Layer = List Neuron

act : NeuralSignals -> Layer -> NeuralSignals
act neuralSignals neurons =
  List.map (Neuron.act neuralSignals) neurons