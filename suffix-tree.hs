import Data.List

type Edge = (String, STree)

 -- Dumb suffix tree that does not know about its alphabet 
data STree = Leaf | Node [Edge]
  deriving Show



-- Adds the terminal character, "$" to a string
-- Need to add the terminal character somewhere else. Maybe within mkTree?
addTerminal ::  String -> String
addTerminal s = s ++ "$"

-- Do we need to insert alphabetically? for now, I am not.
-- Helper function that adds an edge to the graph
insertEdge :: String -> STree -> STree
insertEdge s Leaf = Node [(s, Leaf)]
insertEdge s (Node xs) = Node (xs ++ (s , Leaf) : [])

{- Split an edge into a subtree, containing prefix and suffix
   Assume that at least 1 letter from string matches, and will always
   end with "$"
-}
splitEdge :: String -> Edge -> Edge
splitEdge [] _ = ([], Leaf)
splitEdge (s : '$' : []) Leaf = ((s : '$' : []), Leaf)
splitEdge (s : st) Leaf = 

-- Searches edges leaving a single node for a desired prefix.
-- Just a dumb search algorithm, we're only using it with 4 letters so
-- no need for efficiency.
findPrefix :: String -> STree -> Bool
findPrefix s Leaf = False
findPrefix s (Node []) = False
findPrefix s (Node ((prefix, tree) : edges) ) =
           if (head s) == (head prefix) then True
           else (findPrefix s (Node edges) )

mkTree :: String -> STree
mkTree [] = Node []
mkTree (x : xs) = Leaf

-- Helper for Show functions ---------------------------------------------------

{--- Convert edges to String
-- Convert nodes to String

showSTree :: Show (STree) => STree -> String
showSTree tree = ""

instance Show (STree) where
  show t = showSTree t
-}

testTree :: STree
testTree = Node [("ab", Node [("ca$", Leaf), ("$", Leaf)]),
                 ("bca$", Leaf), ("ca", Leaf)]
