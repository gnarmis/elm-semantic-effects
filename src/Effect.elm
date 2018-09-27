module Effect exposing
  ( onDocument, onWindow, Error )

{-|
# Low-level functions (to be used only in rare cases)
@docs onDocument, onWindow

# Error handling for tasks that may fail
@docs Error
-}

import Dom
import Dom.LowLevel
import Task exposing (Task)
import Json.Decode exposing (Decoder)


{-| Alias for [`Dom.LowLevel.onDocument`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-LowLevel#onDocument) in *elm-lang/dom*
-}
onDocument : String -> Decoder msg -> (msg -> Task Never ()) -> Task Never Never
onDocument =
  Dom.LowLevel.onDocument


{-| Alias for [`Dom.LowLevel.onWindow`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom-LowLevel#onWindow) in *elm-lang/dom*
-}
onWindow : String -> Decoder msg -> (msg -> Task Never ()) -> Task Never Never
onWindow =
  Dom.LowLevel.onWindow


{-| Alias for [`Dom.Error`](http://package.elm-lang.org/packages/elm-lang/dom/latest/Dom#Error) in *elm-lang/dom*
-}
type alias Error =
  Dom.Error
