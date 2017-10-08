module Assoc exposing (lookup, lookupAll)

{-| Lookup a key in assoc lists

#Usage

@docs lookup
@docs lookupAll

-}


{-| Looks up a key in an association list and returns the first match.

    namesByAges = [("Mary", 30), ("John", 20), ("Ivan", 18), ("John", 100)]
    lookup "John" namesByAges == Just 20

-}
lookup : a -> List ( a, b ) -> Maybe b
lookup key assoc =
    case assoc of
        ( k, v ) :: tail ->
            if k == key then
                Just v
            else
                lookup key tail

        _ ->
            Nothing


{-| Looks up a key in an association list and returns all matches.

    namesByAges = [("Mary", 30), ("John", 20), ("Ivan", 18), ("John", 100)]
    lookupAll "John" namesByAges == [20, 100]

-}
lookupAll : a -> List ( a, b ) -> List b
lookupAll key assoc =
    case assoc of
        ( k, v ) :: tail ->
            if k == key then
                v :: lookupAll key tail
            else
                lookupAll key tail

        _ ->
            []
