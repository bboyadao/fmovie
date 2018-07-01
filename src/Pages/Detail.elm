module Pages.Detail exposing (detailview)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Types exposing (Movie)




detailview : Movie -> Html Msg
detailview model =
    div [] [ text model.title]
        