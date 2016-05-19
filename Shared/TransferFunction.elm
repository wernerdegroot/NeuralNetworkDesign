module TransferFunction exposing
  ( TransferFunction
  , hardlim
  , hardlims
  , purelin
  , satlin
  , satlins
  , logsig
  , tansig
  , poslin
  )

import NeuralSignal exposing ( NeuralSignal )

type alias TransferFunction = NeuralSignal -> NeuralSignal

hardlim : TransferFunction
hardlim n = 
  if n < 0.0 then
    0.0
  else
    1.0
    
hardlims : TransferFunction
hardlims n =
  if n < 0.0 then
    -1.0
  else
    1.0
    
purelin : TransferFunction
purelin n = n

satlin : TransferFunction
satlin n =
  if n < 0.0 then
    0.0
  else if n < 1.0 then
    n
  else
    1.0
    
satlins : TransferFunction
satlins n =
  if n < -1.0 then
    -1.0
  else if n < 1.0 then
    n
  else
    1.0
    
logsig : TransferFunction
logsig n = 1.0 / (1.0 + e^(-n))

tansig : TransferFunction
tansig n = (e^n - e^(-n)) / (e^n + e^(-n))

poslin : TransferFunction
poslin n =
  if n < 0.0 then
    0.0
  else 
    n