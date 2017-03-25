# whenisbad
A scheduling assistant.


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Motivation
We wanted to see what it was like to do a full-stack web project using as Haskelly stack as possible. We chose `servant` for the backend since it seemed to bring the most novel paradigms (by defining the API at the type level and therefore leveraging the type system that makes Haskell special). We chose Elm for the frontend because it was the most beginner-friendly (and seemingly popular) pure and reactive way to write frontend.

## Setup
This project is set to build using Stack (Haskell backend) and Elm (reactive frontend).

You will need Stack (most easily installed through the Haskell Platform combined installer) and Elm (most easily installed through npm). A Makefile will coordinate the build between the Stack-powered backend compilation and the Elm-powered frontend compilation.

In order to run the project you will need to run
    make; make server-start

## Docker
The quickest way to get started with a dev environment is to use `docker-compose`, as specified in the `Dockerfile` and `docker-compose.yml`. We start by building the image:

    docker-compose build

This step will probably take a while because Stack will need to download and build all dependencies. Just bear with us for a sec! (or more likely, half an hour). Once it is done, we can start the container:

    docker-compose run --rm --service-ports whenisbad

This will open up a bash shell in a docker container with the environment set up and the first version already built for you. Please feel free to start the webapp, as before, with

    make server-start

and you should be able to break out of that command and re-build as necessary if you have changed the files in the repo. The image has been set up to reflect any changes to the source directory you might change outside the image automatically before any re-build.