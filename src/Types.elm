module Types exposing (Model,Movie,Route(..),MovieID,Mdl,initialModel)
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
    , slug : String
    , des: String
    , pk: Int
    --  ,actors: List Actor
    }


type alias MovieID = String

type Route
    = MoviesRoute
    | MovieRoute MovieID
    | NotFoundRoute



initialModel : Route -> Model
initialModel route=
    ({ 
        name="Hello"
        , mdl= Material.model 
        , selectedTab = 0
        , posts = RemoteData.Loading
        , route =MoviesRoute
    })

-- initialModel : Model
-- initialModel =
--     ({ 
--         name="Hello"
--         , mdl= Material.model 
--         , selectedTab = 0
--         , posts = RemoteData.Loading
--         , route =MoviesRoute
--     })

