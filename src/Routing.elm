module Routing exposing (..)

import Navigation exposing (Location)
import Types exposing ( Route(..))
import UrlParser exposing (..)


about:String
about= "about"

listmovie_link:String
listmovie_link= "movies"

matchers : UrlParser.Parser (Route -> a) a
matchers =
    UrlParser.oneOf
        [ map MoviesRoute UrlParser.top
        , map DetailMovie (UrlParser.s "watch" </> string)
        , map MoviesRoute (UrlParser.s "movies")
        , map AboutRoute (UrlParser.s "about")
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
--     "#players"


