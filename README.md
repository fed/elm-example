# elm-lab

<a href="http://elm-lang.org/" target="_blank" rel="noopener noreferrer">
    <img src="https://rawgithub.com/fknussel/elm-lab/master/elm-logo.svg" width="200px" alt="Elm" />
</a>

## Prerequisites

Install Elm globally:

```
npm install -g elm
```

## Building

Fetch all of the dependencies first:

```
elm-package install
```

Then build the source:

```
elm-make Pluralise.elm
```

This will generate a `index.html` file you can run in your browser.
