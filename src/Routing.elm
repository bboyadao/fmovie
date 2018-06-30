module Routing exposing (..)

import Navigation exposing (Location)
import Types exposing (MovieID, Route(..))
import UrlParser exposing (..)



matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MoviesRoute top
        , map MovieRoute (s "players" </> string)
        , map MoviesRoute (s "players")
        ]

parseLocation : Location  -> Route
parseLocation location =
    case (UrlParser.parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


-- playersPath : String
-- playersPath =
--     "#/"


-- playerPath : MovieID -> String
-- playerPath slug =
--     "#/watch/" ++ slug