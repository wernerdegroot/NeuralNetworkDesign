module TransferFunction exposing
  ( TransferFunction
  , apply
  , hardlim
  , hardlims
  , purelin
  , satlin
  , satlins
  , logsig
  , tansig
  , poslin
  )

import NeuralSignal

type TransferFunction = TransferFunction (NeuralSignal.Value -> NeuralSignal.Value)

apply : TransferFunction -> NeuralSignal.Value -> NeuralSignal.Value
apply (NeuralSignal f) = f

hardlim : TransferFunction
hardlim = TransferFunction (\n ->
  if n < 0.0 then
    0.0
  else
    1.0)
    
hardlims : TransferFunction
hardlims = TransferFunction (\n ->
  if n < 0.0 then
    -1.0
  else
    1.0)
    
purelin : TransferFunction
purelin = TransferFunction (\n -> n)

satlin : TransferFunction
satlin = TransferFunction (\n ->
  if n < 0.0 then
    0.0
  else if n < 1.0 then
    n
  else
    1.0)
    
satlins : TransferFunction
satlins = TransferFunction (\n ->
  if n < -1.0 then
    -1.0
  else if n < 1.0
    n
  else
    1.0)
    
logsig : TransferFunction
logsig = TransferFunction (\n -> 1.0 / (1.0 + e ^ (-n)))

tansig : TransferFunction
tansig = TransferFunction (\n -> (e ^ n - e ^ (-n)) / (e ^ n + e ^ (-n)))

poslin : TransferFunction
poslin = TransferFunction (\n ->
  if n < 0.0 then
    0.0
  else 
    n)