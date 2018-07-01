module Types exposing (Model,Movie,Route(..),Mdl,initialModel,Movie_Slug)
import RemoteData exposing (WebData)

import Material exposing (..)
type alias Mdl = Material.Model



    
type alias Model=
    {name:String
    , mdl : Mdl
    , selectedTab : Int
    , posts: WebData  (List Movie)
    , route : Route
    }

type alias Movie =
    { title : String
    , slug : Movie_Slug
    , des: String
    , pk: Int
    --  ,actors: List Actor
    }


type alias Movie_Slug =
    String



type Route
    = MoviesRoute
    | DetailMovie String
    | NotFoundRoute
    | AboutRoute



initialModel : Route -> Model
initialModel route=
    ({ 
        name="Hello"
        , mdl= Material.model 
        , selectedTab = 0
        , posts = RemoteData.Loading
        , route = route
    })
