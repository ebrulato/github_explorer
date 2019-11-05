# github_explorer

A Simple GitHub Explorer

## Disclaimer

This project is a sandbox for ideas.
So don't consider that this code base is always a good sample.
Note that there are no architecture defined in this project (the use case is too simple)
But there are some good ideas I think :)

# model
These classes use the *json_serializable* package for Json marshalling.
It allow us to check the integrity of the data, but a client of the classes still can't see if an 
attribute is optional or not. So I created a *Maybe<T>* (inspired on a Remi Rousselet's design) for 
the optional values.

**TODO:**
* explore the aggregation of objects (the current use case doesn't require this)

# util
This directory contains different ideas which could be used in different projects
* error: to contains error from a remote service called
* maybe: inspired from Elm (FP), used to deal with optional value, and support the *join* pattern to 
have a good code completude.
* result: inspired from Elm (FP), used to deal with error and allow to have a cleaner code, without 
any exception. As Dart allows us to have exceptions not declared in the prototypes, the usage 
of *result* allow us to have more complete prototypes declaration. 
* store_provider: a direct copy of a gist founded in the readme of the provider package. It allows
to have a kind of cleaner code in the *presenters*.
* view_model_status: a state management for data loaded from remote services. (see view and presenter)

# service
Use the *result<E, O>* pattern.

**TODO:**
* find a good solution for code injection (this remark should be generalized to the entire project).

# view
Flutter...

# view_model
should be rename as *presenter*

**TODO:**
* define an architecture... a kind of MVP ? 

# widget 
**TODO:**
* Find a better organisation.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
