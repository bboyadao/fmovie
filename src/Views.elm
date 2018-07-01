module Views exposing (view)
import Html exposing (..)
import Html exposing (Html,div)
import Types exposing (Model,Mdl,Movie,Movie_Slug,Route(..))
import Msgs exposing (Msg)
import Html.Attributes exposing (href, class, style)
import RemoteData exposing (WebData)
import Routing exposing (about,listmovie_link)
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


nav:  Html Msg
nav  =
    Html.div [] [
            li[] [a [href listmovie_link] [text "List "]]
            ,li[] [a [] [text "Actions "]]
            ,li[] [a [href about] [text "About "]]
    ]


view : Model  -> Html Msg
view model =
    Layout.render Msgs.Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.onSelectTab Msgs.SelectTab
        , Layout.selectedTab model.selectedTab
         
        
        ]
        { header = 
        [ h1 [ style [ ( "padding", "2rem" ) ] ] [ text "My Movie" ] ]
        , drawer = [ 
                nav
            ]
        
        , tabs = ( 
            [ 
                text "List Movies" , text "Session" , text "Session" 
            ]
            ,[ 
                Color.background (Color.color Color.Green Color.S400) 
                
            ]
            )
        
        , main = [ page  model ]
        }
        |> Material.Scheme.topWithScheme Color.Teal Color.LightGreen



page : Model -> Html Msg
page model =
    case model.route of

        Types.NotFoundRoute ->
            notFoundView
        Types.AboutRoute -> 
            aboutView

        Types.MoviesRoute ->
           mylistview model

        Types.DetailMovie slug ->
            case findPostById slug model.posts of
                Just post ->
                    detailview post
                Nothing -> 
                    notFoundView
                
            -- playerEditPage  model  slug


            

findPostById : String -> WebData (List Movie) -> Maybe Movie
findPostById slug movies =
    case RemoteData.toMaybe movies of
        Just movie ->
            movie
                |> List.filter (\post -> post.slug == slug)
                |> List.head

        Nothing ->
            Nothing                

playerEditPage : Model -> Movie_Slug -> Html Msg
playerEditPage model movieslug =
    case model.posts of
        RemoteData.NotAsked ->
            text "Not Ask"

        RemoteData.Loading ->
            text "Feaching data ..."

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
aboutView: Html Msg
aboutView = 
    Html.div []
        [ h1 [] [ text "ABOUT PAGE"]
        ]


