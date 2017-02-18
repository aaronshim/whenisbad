# whenisbad
A scheduling assistant.


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Motivation
We wanted to see what it was like to do a full-stack web project using as Haskelly stack as possible. We chose `servant` for the backend since it seemed to bring the most novel paradigms (by defining the API at the type level and therefore leveraging the type system that makes Haskell special). We chose Elm for the frontend because it was the most beginner-friendly (and seemingly popular) pure and reactive way to write frontend.

## Setup
This project is set to build using Stack (Haskell backend) and Elm (reactive frontend).

You will need Stack (most easily installed through the Haskell Platform combined installer) and Elm (most easily installed through npm). A Makefile will coordinate the build between the Stack-powered backend compilation and the Elm-powered frontend compilation.
