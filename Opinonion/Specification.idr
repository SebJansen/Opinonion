module Opinonion.Specification

import Data.List
import Data.Maybe

public export
record Person where
    constructor MkPerson
    firstName, lastName : String
    likes : List Person
    credit : Int

public export
interface Sentient Person where
    likes : Person -> Person -> Bool
    setLikes : Person -> Person -> Person
    getIdentity : Person -> String