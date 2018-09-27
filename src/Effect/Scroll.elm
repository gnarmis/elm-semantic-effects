module Effect.Scroll exposing
  ( toTop, toBottom, toY, toLeft, toRight, toX, getY, getX )

{-|
# Manually change the scroll position on an element that overflows its container
@docs toTop, toBottom, toY, toLeft, toRight, toX

# Get the current scroll position
@docs getY, getX
-}

import Effect
import Dom.Scroll
import Task exposing (Task)

{-| Alias for [`Dom.Scroll.toTop`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toTop) in *elm-lang/dom*
-}
toTop : String -> Task Effect.Error ()
toTop =
  Dom.Scroll.toTop


{-| Alias for [`Dom.Scroll.toBottom`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toBottom) in *elm-lang/dom*
-}
toBottom : String -> Task Effect.Error ()
toBottom =
  Dom.Scroll.toBottom


{-| Alias for [`Dom.Scroll.toY`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toY) in *elm-lang/dom*
-}
toY : String -> Float -> Task Effect.Error ()
toY =
  Dom.Scroll.toY


{-| Alias for [`Dom.Scroll.toLeft`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toLeft) in *elm-lang/dom*
-}
toLeft : String -> Task Effect.Error ()
toLeft =
  Dom.Scroll.toLeft


{-| Alias for [`Dom.Scroll.toRight`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toRight) in *elm-lang/dom*
-}
toRight : String -> Task Effect.Error ()
toRight =
  Dom.Scroll.toRight


{-| Alias for [`Dom.Scroll.toX`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#toX) in *elm-lang/dom*
-}
toX : String -> Float -> Task Effect.Error ()
toX =
  Dom.Scroll.toX


{-| Alias for [`Dom.Scroll.y`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#y) in *elm-lang/dom*
-}
getY : String -> Task Effect.Error Float
getY =
  Dom.Scroll.y



{-| Alias for [`Dom.Scroll.x`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-Scroll#x) in *elm-lang/dom*
-}
getX : String -> Task Effect.Error Float
getX =
  Dom.Scroll.x
