module Quiz01_TypeTheory where

-- Small expression and type AST for exercises
data Expr
	= Var String
	| Lam String Expr
	| App Expr Expr
	deriving (Eq, Show)

data Type
	= TInt
	| TBool
	| TVar String
	| TFun Type Type
	deriving (Eq, Show)

-- Beta-reduction: reduce one application if possible
betaReduce :: Expr -> Expr
betaReduce = error "implement betaReduce"

-- Compute principal (most general) type for an expression if it exists
principalType :: Expr -> Maybe Type
principalType = error "implement principalType"

-- Hindley-Milner inference returning either error or inferred type
hmInfer :: Expr -> Either String Type
hmInfer = error "implement hmInfer"