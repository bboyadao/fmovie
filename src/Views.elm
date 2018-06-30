module Views exposing (view)
import Html exposing (..)
import Html exposing (div)
import Types exposing (Model,Mdl,Movie,MovieID,Route(..))
import Msgs exposing (Msg)
import Html.Attributes exposing (href, class, style)
import RemoteData exposing (WebData)

import Pages.Listmovies exposing (mylistview)
import Pages.Detail exposing (detailview)



import Material.Menu as Menu
import Material
import Material.Options as Options exposing (cs, css, div, nop, when)
import Material.Button as Button
import Material.Icon as Icon
import Material.Scheme
import Material.Color as Color
import Material.Layout as Layout
import Material.Tabs as Tabs

tabviews: Model -> Html Msg
tabviews model = 
    case model.selectedTab of
        0 ->
            mylistview model

        1 ->
            text "something else"
        2-> text "something else2222"
        _ ->
            text "404"




-- movieViews: List Movie -> Html Msg
-- movieViews posts =
--     li [] [

--         p [ ][text posts.title

--         , span [][ text "-->"]

--         ]
--         , p[] [text posts.des]
        -- ,List.map actorsView post.actors |> ul []
    -- ]

-- actorsView: String -> Html Msg
-- actorsView actor =
    
--     li [] [text  (toString actor)]





subview : Model -> Html Msg
subview model =    
        
    Tabs.render Msgs.Mdl [0] model.mdl
    [ Tabs.ripple
    , Tabs.onSelectTab Msgs.SelectTab
    , Tabs.activeTab model.selectedTab
    ]
    [ Tabs.label
    [ Options.center ]
    [ Icon.i "info_outline"
    , Options.span [ css "width" "4px" ] []
    , text "About tabs"
    ]
    , Tabs.label
    [ Options.center ]
    [ Icon.i "code"
    , Options.span [ css "width" "4px" ] []
    , text "Example"
    ]
    ]   []
        

 

view : Model  -> Html Msg
view model =
    Layout.render Msgs.Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.onSelectTab Msgs.SelectTab
        , Layout.selectedTab model.selectedTab

        ]
        { header = [ h1 [ style [ ( "padding", "2rem" ) ] ] [ text "My Movie" ] ]
        , drawer = []
        
        , tabs = ( [ 
            text "List Movies" , text "Session" , text "Session" ]
            ,  [ Color.background (Color.color Color.Green Color.S400) 
            ])

        , main = [ page  model ]
        }|> Material.Scheme.topWithScheme Color.Teal Color.LightGreen

-- view : Model  -> Html Msg
-- view model =
--     Html.div [] [
--         page model
--     ]


---------------- LIST VIEWS----------------



-------------------DETAIL-----------------


page : Model -> Html Msg
page model =
    case model.route of
        Types.MoviesRoute ->
           mylistview model

        Types.MovieRoute slug ->
            playerEditPage model slug

        Types.NotFoundRoute ->
            notFoundView


playerEditPage : Model -> Types.MovieID -> Html Msg
playerEditPage model movieslug =
    case model.posts of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success movies ->
            let
                maybeMovie =
                                movies
                                    |> List.filter (\movie -> movie.slug == movieslug)
                                    |> List.head
            in
                case maybeMovie of
                    Just movie ->
                        detailview movie

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)



notFoundView : Html Msg
notFoundView =
    Html.div []
        [ text "not dound detail ok"
        ]
