\begin{code}[hide]
module codebruijn where
open import Data.Nat using (ℕ; zero; suc)
variable
    k l m n : ℕ
\end{code}
\begin{code}
data Cov : (k l m : ℕ) → Set where
    ⋅ :             Cov      0       0       0
    L : Cov k l m → Cov (suc k)      l  (suc m)
    R : Cov k l m → Cov      k  (suc l) (suc m)
    B : Cov k l m → Cov (suc k) (suc l) (suc m)

data Term : ℕ → Set where
    #       : Term 1
    ƛ       : Term (suc n) → Term n
    _$[_]_  : Term k → Cov k l m → Term l → Term m
    
_ = ƛ (ƛ (ƛ ((# $[ L (R ⋅) ] #) $[ L (R (B ⋅)) ] (# $[ L (R ⋅) ] #))))
\end{code}