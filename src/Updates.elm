--Debug.log "UrlChange" location
module Updates exposing (..)


import Types exposing (Model,Movie)

import Material
import Msgs exposing (Msg)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of        
        Msgs.NoOp ->( model, Cmd.none )

        Msgs.Mdl msg ->
            Material.update Msgs.Mdl msg model -- me no

        Msgs.SelectTab num ->
            { model | selectedTab = num } ! []

        Msgs.Getdata response ->
        ( { model | posts = response }, Cmd.none )    

        
        Msgs.UrlChange location ->
            let
              
                newRoute =
                    parseLocation location

            in
              { model | route = newRoute } ! []

        
        
        {-- Msgs.Getdata (Ok json) ->
        --     ({model | posts = json}![])
        -- Msgs.Getdata (Err e) ->
        --     (Debug.log (toString e)model![])
        
        
        -- Msgs.OnLocationChange location ->
        --     let
        --         newRoute =
        --             parseLocation location
        --     in
        --         ( { model | route = newRoute }, Cmd.none ) --}


