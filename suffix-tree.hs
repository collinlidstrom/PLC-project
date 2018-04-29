import Data.List

type Edge = (String, STree)

data STree = Leaf | Node [Edge]
  deriving Show

mkTree :: String -> STree
mkTree [] = Node []
mkTree (x : xs) = Leaf

-- Adds the terminal character, "$" to a string
-- Need to add the terminal character somewhere else. Maybe within mkTree?
addTerminal ::  String -> String
addTerminal s = s ++ "$"

-- Do we need to insert alphabetically? for now, I am not.
-- Helper function that adds an edge to the graph
insertEdge :: String -> STree -> STree
insertEdge s Leaf = Node [(s, Leaf)]
insertEdge s (Node xs) = Node (xs ++ (s , Leaf) : [])


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
