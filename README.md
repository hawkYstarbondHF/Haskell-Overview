# Haskell Overview for Programming Languages

## Installing

In order to use Haskell in GitHub codespaces, you will first need to install Haskell with this command (agree to all prompts):

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Then you can update your terminal with this command (or simply open a new one):

```
source /home/codespace/.ghcup/env
```

To install on your personal machine you can follow the instructions here:

[Haskell Platform](https://www.haskell.org/downloads/)

## Running

Once the Haskell Platform is installed, execute the following command from the command line.

```
runghc HaskellOverview.hs
```

However, while developing the code, you should primarily interact with your code in the interpreter, which you can launch with this command:

```
ghci HaskellOverview.hs
```

## Testing

To perform unit tests, you will first need to update cabal, the Haskell package manager:

```
cabal update
```

Then install [HUnit](https://hackage.haskell.org/package/HUnit), [silently](https://hackage.haskell.org/package/silently), and [directory](https://hackage.haskell.org/package/directory) with these commands:

```
cabal install --lib HUnit
cabal install --lib silently
cabal install --lib directory
```

Once these are installed, you can test your code by running:

```
runghc HaskellOverviewTest.hs
```

## Project Objectives

TODO: Explain the point of this assignment in your own words with a brief paragraph. Say what the code does.

## Files

TODO: Bulleted list with brief description of each file

## Known Issues

TODO: Describe any problems with your submission, or indicate that you believe everything functions correctly.

## Author

**Eleanor Wagner**