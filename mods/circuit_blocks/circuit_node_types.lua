-- CircuitNodeTypes definitions
CircuitNodeTypes = {
    EMPTY = -1,
    IDEN = 0,
    X = 1,
    Y = 2,
    Z = 3,
    S = 4,
    SDG = 5,
    T = 6,
    TDG = 7,
    H = 8,
    SWAP = 9,
    BARRIER = 10,
    CTRL = 11, -- "control" part of multi-qubit gate
    TRACE = 12, -- In the path between a gate part and a "control" or "swap" part
    MEASURE_Z = 13,
    CONNECTOR_M = 14, -- Block that connects a wire to a distant wire
    CONNECTOR_F = 15, -- Block that connects a wire from a distant wire
    BLOCH_SPHERE = 16 -- Block that depicts the state of a qubit on a Bloch sphere
}
