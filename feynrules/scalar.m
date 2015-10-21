(* ::Package:: *)

<< "FeynRules`"

LoadModel["SM.fr", "scalar.fr"]; 

\[ScriptCapitalL]new = (1/2)*del[phi, \[Mu]]*del[phi, \[Mu]] - (Mphi^2/2)*phi^2 + 
   gsm*mubar . mu*phi + gse*ebar . e*phi + gst*tabar . ta*phi

vertices = FeynmanRules[\[ScriptCapitalL]new]
decays = ComputeWidths[vertices]

UpdateWidths[decays]

(* Skip checking the Hermiticity since it is slow; this should be re-enabled when the model changes *)
(* CheckHermiticity[LSM + \[ScriptCapitalL]new] *)

WriteUFO[LSM + \[ScriptCapitalL]new]
