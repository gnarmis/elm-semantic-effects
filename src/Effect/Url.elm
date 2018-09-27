module Effect.Url exposing
  ( stepTo, displayAs )

{-|
# Manually update the browser's address bar
@docs stepTo, displayAs

-}

import Navigation


{-| Alias for [`Navigation.newUrl`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#newUrl)
-}
stepTo : String -> Cmd msg
stepTo =
  Navigation.newUrl


{-| Alias for [`Navigation.modifyUrl`](http://package.elm-lang.org/packages/elm-lang/navigation/latest/Navigation#modifyUrl)
-}
displayAs : String -> Cmd msg
displayAs =
  Navigation.modifyUrl
