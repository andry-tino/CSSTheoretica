# CSSTheoretica
A Standard-ML library to formalize W3C CSS specification.

## What it is
_CSSTheoretica_ is a project for describing, in non procedural language, the [W3C CSS Standard Specification](https://www.w3.org/TR/CSS21/). By describing the specification in Standard-ML, the intention is achieving simplicity and a higher level characterization which does not involve writing algorithms in order to apply the specification, the purpose here is describing the standard!

## Why?
There is a strong connection to project [Organon](https://github.com/andry-tino/Organon). _CSSTheoretica_ will serve as the main library for _Organon_ in order to validate the standard when parsing an HTML+CSS input. The library is intended to be used together with proof assistants like [HOL](https://github.com/HOL-Theorem-Prover/HOL) or in bundle with other Standard-ML libraries implementing a verification program for CSS.
