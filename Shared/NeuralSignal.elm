module NeuralSignal exposing ( Index, Value, NeuralSignal, NeuralSignals )

type alias Index = Int
type alias Value = Float

type alias NeuralSignal = ( Index, Value )
type alias NeuralSignals = List ( Index, Value )