module Cmds exposing (..)


import Http
import Json.Decode as JDecode exposing (..)
import Json.Decode.Pipeline exposing (decode, required)
import Types exposing (Model,Movie)
import RemoteData

import Msgs exposing (Msg)




listMoviesUrl : String
listMoviesUrl =
    "http://127.0.0.1:8000/api/movie/?format=json&q="

cmdListMovies:  Cmd Msg
cmdListMovies  =
                    Http.get listMoviesUrl parsepost
                    |> RemoteData.sendRequest
                    |> Cmd.map Msgs.Getdata
        -- let url=
        --         "http://127.0.0.1:8000/api/movie/?format=json&q="

        --     request=
        --         Http.get url parsepost


        -- in
        --     Http.send Msgs.Getdata request
        
            




parsepost : JDecode.Decoder (List Movie)
parsepost =
    JDecode.list playerDecoder


playerDecoder : JDecode.Decoder Movie
playerDecoder =
    decode Movie
        |> required "Title" JDecode.string
        |> required "slug" JDecode.string
        |> required "Plot"  JDecode.string
        |> required "pk"  JDecode.int
        -- |> required "Actor"  JDecode.list JDecode.string

