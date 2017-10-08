module Tests exposing (..)

import Test exposing (..)
import Expect
import Assoc exposing (..)


namesByAgesAssoc : List ( String, Int )
namesByAgesAssoc =
    [ ( "Mary", 30 ), ( "John", 20 ), ( "Ivan", 18 ), ( "John", 100 ) ]


all : Test
all =
    describe "Assoc"
        [ describe "lookup" <|
            [ test "Looks up a single value" <|
                \() ->
                    Expect.equal (lookup "John" namesByAgesAssoc) (Just 20)
            , test "Returns Nothing if nothing found" <|
                \() ->
                    Expect.equal (lookup "Pete" namesByAgesAssoc) Nothing
            ]
        , describe "lookupAll" <|
            [ test "Looks up all values" <|
                \() ->
                    Expect.equal (lookupAll "John" namesByAgesAssoc) [ 20, 100 ]
            , test "Returns an empty list if nothing found" <|
                \() ->
                    Expect.equal (lookupAll "Pete" namesByAgesAssoc) []
            ]
        ]
