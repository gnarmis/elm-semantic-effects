module Effect.Page exposing
  ( load, reload, cleanReload, back, forward )

{-|
# Manually load a new URL or reload the current URL
@docs load, reload, cleanReload

# Load a URL stored in the user's browser history
@docs back, forward

-}

import Navigation


{-|
Alias for [`Navigation.load`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#load)
-}
load : String -> Cmd msg
load =
  Navigation.load


{-|
Alias for [`Navigation.reload`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#reload)
-}
reload : Cmd msg
reload =
  Navigation.reload


{-|
Alias for [`Navigation.reloadAndSkipCache`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#reloadAndSkipCache)
-}
cleanReload : Cmd msg
cleanReload =
  Navigation.reloadAndSkipCache


{-|
Alias for [`Navigation.back`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#back)
-}
back : Int -> Cmd msg
back =
  Navigation.back


{-|
Alias for [`Navigation.forward`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#forward)
-}
forward : Int -> Cmd msg
forward =
  Navigation.forward
