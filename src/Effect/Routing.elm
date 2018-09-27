module Effect.Routing exposing
  ( Location, run, runWithFlags, custom, customWithFlags )

{-|
# Data structure representing a URL
@docs Location

# Pipeline functions to initialize programs with location routing
@docs run, runWithFlags

# Standard functions to initialize programs with location routing
@docs custom, customWithFlags

-}

import Navigation
import VirtualDom

{-| Alias for [`Navigation.Location`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#Location)
-}
type alias Location =
  Navigation.Location


{-| Type alias for arguments to `VirtualDom.program`
-}
type alias Setup model msg =
  { init : (model, Cmd msg)
  , update : msg -> model -> (model, Cmd msg)
  , subscriptions : model -> Sub msg
  , view : model -> VirtualDom.Node msg
  }


{-| Generate your initial model with the page's `Location` as data; the initial
model specified in your setup (the second argument) becomes a fallback if
anything goes wrong in parsing the location.

This function follows the pattern of `Dom.Program.run` and
`Dom.Program.runWithFlags` in *danielnarey/elm-semantic-dom*, which are intended
to be used as pipeline functions, but it calls
[`Navigation.program`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#program)
instead of `VirtualDom.program`.

The two additional arguments, given as a tuple, are a function to generate an
initial model given a `Location` and a type key that routes URL changes to the
program's update function.

-}
run : (Location -> Maybe model, Location -> msg) -> Setup model msg -> Program Never model msg
run (initializer, updateKey) programSetup =
  let
    (initialModel, loadCmd) =
      programSetup.init

  in
    { init =
        initializer
          >> Maybe.withDefault initialModel
          >> flip (,) loadCmd

    , update = programSetup.update
    , subscriptions = programSetup.subscriptions
    , view = programSetup.view
    }
      |> Navigation.program updateKey


{-| Same pattern as `Effect.Routing.run`, except that the function to generate
the initial model will handle flags from the JavaScript side of the application.
Calls
[`Navigation.programWithFlags`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#programWithFlags).

-}
runWithFlags : (flags -> Location -> Maybe model, Location -> msg) -> Setup model msg -> Program flags model msg
runWithFlags (initializer, updateKey) programSetup =
  let
    (initialModel, loadCmd) =
      programSetup.init

    withDefaultModel initializer flags location =
      location
        |> initializer flags
        |> Maybe.withDefault initialModel
        |> flip (,) loadCmd

  in
    { init =
        initializer
          |> withDefaultModel

    , update = programSetup.update
    , subscriptions = programSetup.subscriptions
    , view = programSetup.view
    }
      |> Navigation.programWithFlags updateKey


{-| Alias for [`Navigation.program`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#program)
-}
custom : (Location -> msg) -> { init : Location -> (model, Cmd msg), update : msg -> model -> (model, Cmd msg), subscriptions : model -> Sub msg, view : model -> VirtualDom.Node msg } -> Program Never model msg
custom =
  Navigation.program


{-| Alias for [`Navigation.programWithFlags`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#programWithFlags)
-}
customWithFlags : (Location -> msg) -> { init : flags -> Location -> (model, Cmd msg), update : msg -> model -> (model, Cmd msg), subscriptions : model -> Sub msg, view : model -> VirtualDom.Node msg } -> Program flags model msg
customWithFlags =
  Navigation.programWithFlags
