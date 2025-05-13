param n; 
param w{i in 1..n}; 
param q; 
param T; 
param r{t in 1..T, i in 1..n}; 

var x{i in 1..n} >= 0;
var z{t in 1..T}; 
var y{i in 1..n} binary; 

minimize objFunc: sum{t in 1..T} z[t]; 

subject to minAssets: sum{i in 1..n} y[i] <= q; 
subject to allocateWeights: sum{i in 1..n} x[i] = 1; 
subject to assetWeight {i in 1..n}: x[i] <= y[i]; 
subject to maxReturn {i in 1..n}: sum{t in 1..T} z[t] >= sum{t in 1..T} (w[i] - x[i]) * r[t, i]; 
subject to minReturn {i in 1..n}: sum{t in 1..T} z[t] >= sum{t in 1..T} -(w[i] - x[i]) * r[t, i]; 
# subject to testc: sum{t in 1..T} z[t] >= 0; 
