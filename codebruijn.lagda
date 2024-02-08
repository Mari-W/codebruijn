\begin{code}[hide]
module codebruijn where
open import Data.Nat using (ℕ; zero; suc)
variable
    k l m n : ℕ
\end{code}
\begin{code}
data Cov : (k l m : ℕ) → Set where
    ⋅  :              Cov  0        0        0
    L  : Cov k l m →  Cov  (suc k)  l        (suc m)
    R  : Cov k l m →  Cov  k        (suc l)  (suc m)
    B  : Cov k l m →  Cov  (suc k)  (suc l)  (suc m)

data Tm : ℕ → Set where
    #       : Tm 1
    ƛ       : Tm (suc n) → Tm n
    _$[_]_  : Tm k → Cov k l m → Tm l → Tm m
    
_ = ƛ (ƛ (ƛ ((# $[ L (R ⋅) ] #) $[ L (R (B ⋅)) ] (# $[ L (R ⋅) ] #))))
\end{code}