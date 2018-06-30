module Base exposing(..)
import Html exposing (..)
import Types exposing (Model,initialModel,Route)
import Updates exposing (update)
import Subs exposing (subscriptions)
import Msgs exposing (Msg)
import Material
import Cmds exposing (cmdListMovies)
import Views exposing (view)
import RemoteData
import Navigation exposing (Location)
import Routing exposing (..)
-- init : ( Model, Cmd Msg )
-- init =
--     (
--         {name="Hello"
--         ,mdl= Material.model 
--         ,selectedTab = 0
--         ,posts=[]        
--         }
--         ,Cmd.none
                    
--             )




init :Location ->  ( Model, Cmd Msg )
init location =
    
    let
        currentRoute =
            Routing.parseLocation location
    in
    
        ( initialModel currentRoute, cmdListMovies )
    -- ( initialModel, cmdListMovies )




main : Program Never Model Msg
main =
    Navigation.program Msgs.UrlChange
        { init = init
        , view = Views.view
        , update = update
        , subscriptions = subscriptions
        }

