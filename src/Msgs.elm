module Msgs exposing (..)
import Material exposing (..) 
import Types exposing (Movie)
import Navigation exposing (Location)
import RemoteData exposing (WebData)

type Msg    = NoOp
            | SelectTab Int
            | Mdl (Material.Msg Msg)
            | Getdata (WebData (List Movie))
            | UrlChange Location
            
