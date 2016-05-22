module Layer exposing ( Layer, act, closeEnough, convergeRecurrent, convergeRecurrentWithIntermediate )

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

convergeRecurrentWithIntermediate' : NeuralSignals -> Layer -> List NeuralSignals -> List NeuralSignals
convergeRecurrentWithIntermediate' input neurons acc =
  let
    output = act input neurons
    accWithOutput = output :: acc
  in
    if closeEnough output input then
      List.reverse accWithOutput
    else
      convergeRecurrentWithIntermediate' output neurons accWithOutput

convergeRecurrentWithIntermediate : NeuralSignals -> Layer -> List NeuralSignals
convergeRecurrentWithIntermediate input neurons =
  convergeRecurrentWithIntermediate' input neurons []