(* ::Package:: *)

<< "FeynRules`"

LoadModel["SM.fr", "darkphoton.fr"]; 

\[ScriptCapitalL]new = (-(1/4))*FS[Ad, \[Kappa], \[Tau]]*FS[Ad, \[Kappa], \[Tau]] + (1/2)*Mad^2*Ad[\[Kappa]]*Ad[\[Kappa]] + 
   eps*ee*ebar . Ga[\[Kappa]] . Ad[\[Kappa]] . e + eps*ee*mubar . Ga[\[Kappa]] . Ad[\[Kappa]] . mu

\[ScriptCapitalL]new = ExpandIndices[\[ScriptCapitalL]new]; 

vertices = FeynmanRules[\[ScriptCapitalL]new]
decays = ComputeWidths[vertices]

UpdateWidths[decays]

(* Skip checking the Hermiticity since it is slow; this should be re-enabled when the model changes *)
(* CheckHermiticity[LSM + \[ScriptCapitalL]new] *)

WriteUFO[LSM + \[ScriptCapitalL]new]
