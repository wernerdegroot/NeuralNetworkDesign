module TransferFunction exposing
  ( TransferFunction(..)
  , apply
  )

import NeuralSignal exposing ( NeuralSignal )

type TransferFunction
  = Hardlim
  | Hardlims
  | Purelin
  | Satlin
  | Satlins
  | Logsig
  | Tansig
  | Poslin
  
apply : TransferFunction -> NeuralSignal -> NeuralSignal
apply transferFunction =
  case transferFunction of
    Hardlim -> hardlim
    Hardlims -> hardlims
    Purelin -> purelin
    Satlin -> satlin
    Satlins -> satlins
    Logsig -> logsig
    Tansig -> tansig
    Poslin -> poslin

hardlim : NeuralSignal -> NeuralSignal
hardlim n = 
  if n < 0.0 then
    0.0
  else
    1.0
    
hardlims : NeuralSignal -> NeuralSignal
hardlims n =
  if n < 0.0 then
    -1.0
  else
    1.0
    
purelin : NeuralSignal -> NeuralSignal
purelin n = n

satlin : NeuralSignal -> NeuralSignal
satlin n =
  if n < 0.0 then
    0.0
  else if n < 1.0 then
    n
  else
    1.0
    
satlins : NeuralSignal -> NeuralSignal
satlins n =
  if n < -1.0 then
    -1.0
  else if n < 1.0 then
    n
  else
    1.0
    
logsig : NeuralSignal -> NeuralSignal
logsig n = 1.0 / (1.0 + e^(-n))

tansig : NeuralSignal -> NeuralSignal
tansig n = (e^n - e^(-n)) / (e^n + e^(-n))

poslin : NeuralSignal -> NeuralSignal
poslin n =
  if n < 0.0 then
    0.0
  else 
    n