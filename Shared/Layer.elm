module Layer exposing ( Layer, act, closeEnough, convergeRecurrent )

import Neuron exposing ( Neuron )
import NeuralSignal exposing ( NeuralSignals )

type alias Layer = List Neuron

act : NeuralSignals -> Layer -> NeuralSignals
act input neurons =
  List.map (Neuron.act input) neurons

closeEnough : NeuralSignals -> NeuralSignals -> Bool
closeEnough first second =
  let
    differences = List.map2 (-) first second
    absoluteDifferences = List.map abs differences
    sumOfAbsoluteDifferences = List.foldl (+) 0.0 absoluteDifferences
  in
    sumOfAbsoluteDifferences < 1e-4

convergeRecurrent : NeuralSignals -> Layer -> NeuralSignals
convergeRecurrent input neurons =
  let
    output = act input neurons
  in
    if closeEnough output input then
      output
    else
      convergeRecurrent output neurons
