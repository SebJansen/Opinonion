module Opinonion.Implementation

import Opinonion.Specification

import Data.List
import Data.Maybe

public export
thereExists : ( pred : a -> Bool ) -> List a -> Bool
thereExists pred d = isJust ( find pred d)

public export
forAll : ( pred : a -> Bool ) -> List a -> Bool
forAll pred d = length ( filter pred d) == length d

public export
Show Person where
    show p = p.firstName ++ " likes "
             ++ show ( map ( \lp => lp.firstName ) p.likes )

public export
Eq Person where
    x == y = (show x == show y)

public export
Sentient Person where
    likes p o = isJust ( find ( \lp => lp == o ) p.likes )
    setLikes p o = record { likes = p.likes ++ [o] } p
    getIdentity p = show p