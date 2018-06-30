module Pages.Detail exposing (detailview)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Types exposing (Movie)


detailview : Movie -> Html Msg
detailview model =
    div [] [ text "Detail page"]
        -- [ nav model
        -- , form model
        -- ]


-- nav : Movie -> Html Msg
-- nav model =
--     div [ class "clearfix mb2 white bg-black p1" ]
--         []


-- form : Movie -> Html Msg
-- form player =
--     div [ class "m3" ]
--         [ h1 [] [ text player.title ]
--         , formLevel player
--         ]


-- formLevel : Movie -> Html Msg
-- formLevel player =
--     div
--         [ class "clearfix py1"
--         ]
--         [ div [ class "col col-5" ] [ text "Level" ]
--         , div [ class "col col-7" ]
--             [ span [ class "h2 bold" ] [ text (toString player.slug) ]
--             , btnLevelDecrease player
--             , btnLevelIncrease player
--             ]
--         ]


-- btnLevelDecrease : Movie -> Html Msg
-- btnLevelDecrease player =
--     a [ class "btn ml1 h1" ]
--         [ i [ class "fa fa-minus-circle" ] [] ]


-- btnLevelIncrease : Movie -> Html Msg
-- btnLevelIncrease player =
--     a [ class "btn ml1 h1" ]
--         [ i [ class "fa fa-plus-circle" ] [] ]