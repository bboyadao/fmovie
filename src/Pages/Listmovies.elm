module Pages.Listmovies exposing(..)


import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import RemoteData
import Navigation exposing (Location)
import RemoteData exposing (WebData)

import Updates exposing (update)
import Subs exposing (subscriptions)
import Msgs exposing (Msg)
import Cmds exposing (cmdListMovies)
import Routing exposing (parseLocation) 
--playerPath
import Types exposing (Model,Route(..),Movie)
-- import CustomHtmlEvents exposing (onLinkClick)


import Material
-- init : ( Model, Cmd Msg )
-- init =
--     (model
--         {name="Hello"
--         ,mdl= Material.model 
--         ,selectedTab = 0
--         ,posts=[]
--         }
--         ,cmdListMovies
                    
--             )

-- initialState : Location -> ( Model, Cmd Msg )
-- initialState location =
--     initialModel ! []

initialModel : Route -> Model
initialModel route =
    ({ 
        name="Hello"
        , mdl= Material.model 
        , selectedTab = 0
        , posts = RemoteData.Loading
        , route = MoviesRoute
    })


-- init : ( Model, Cmd Msg )
-- init =
--     ( initialModel, cmdListMovies )

init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( initialModel currentRoute, cmdListMovies )

main : Program Never Model Msg
main =
    -- Html.program
    Navigation.program
        Msgs.UrlChange
        { init = init
        , view = my
        , update = update
        , subscriptions = subscriptions
        }


my : Model -> Html Msg
my model =
    div []
        [ mylistview model ]

mylistview : Model -> Html Msg
mylistview model =
    listview model.posts

listview : WebData (List Movie) -> Html Msg
listview response =
    Html.div []
        [ 
         maybeList response
        ]

maybeList : WebData (List Movie) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success posts ->
            movieViews posts

        RemoteData.Failure error ->
            text (toString error)


nav : Html Msg
nav =
    Html.div [ class "clearfix mb2 white bg-black" ]
        [ Html.div [ class "left p2" ] [ text "Players" ] ]


movieViews : List Movie -> Html Msg
movieViews players =
    Html.div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "TITLE" ]
                    , th [] [ text "DES" ]
                    , th [] [ text "SLUG" ]
                    
                    ]
                ]
            , tbody [] (List.map playerRow players)
            ]
        ]


playerRow : Movie -> Html Msg
playerRow model =
   
    tr []
        [
              td [] [ text (toString model.pk) ]
             ,td [] [ a[href model.slug
                    -- , onLinkClick (Msgs.ChangeLocation path) 
                        ] [ text model.title ]]
             
            , td [] [ text model.des ]
            , td [] [ text (toString model.slug )
            
            ]
        
        , td []
            []
        ]



-- editBtn : Movie -> Html.Html Msg
-- editBtn movie =
--     let
--         path =
--             playerPath movie.slug
--     in
--         a
--             [ class "btn regular"
--             , href path
--             ]
--             [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]