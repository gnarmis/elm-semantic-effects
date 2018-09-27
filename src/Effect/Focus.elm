module Effect.Focus exposing
  ( on, off )

{-|
# Manually set or unset the focus on a page
@docs on, off
-}

import Effect
import Dom
import Task exposing (Task)


{-| Alias for [`Dom.focus`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom#focus) in elm-lang/dom
-}
on : String -> Task Effect.Error ()
on =
  Dom.focus


{-| Alias for [`Dom.blur`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom#blur) in elm-lang/dom
-}
off : String -> Task Effect.Error ()
off =
  Dom.blur
