module Main

import Data.List

import Opinonion.Specification
import Opinonion.Implementation

donald : Person
dennis : Person
haskell : Person
seb : Person

dennis = MkPerson "Dennis" "Ritchie" [] 12000
haskell = MkPerson "Haskell" "Curry" [] 15000
donald = MkPerson "Donald" "Trump" [] 11000
seb = MkPerson "Seb" "Jansen" [ haskell ] 9500

allDomain : List Person
allDomain = [ dennis, donald, haskell, seb ]

main : IO ()
main = do
  printLn $ show ( allDomain )

  printLn $ dennis `setLikes` haskell
  
  printLn $ "Seb likes Haskell? "
            ++ show (seb `likes` haskell)
    
  printLn $ "Does Donald exist? "
            ++ show (thereExists (\p => p.firstName == "Donald") allDomain)
  
  printLn $ "Does everybody have over 9000 credit? "
            ++ show (forAll (\p => p.credit > 9000) allDomain)
  
  printLn $ "Does everybody have over 10000 credit? "
            ++ show (forAll (\p => p.credit > 10000) allDomain)