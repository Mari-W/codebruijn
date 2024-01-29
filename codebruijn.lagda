\begin{code}[hide]
module codebruijn where
open import Data.Nat using (zero; suc) renaming (ℕ to N)
variable
    k l m n : N
\end{code}
\begin{code}
data Cover : (k l m : N) → Set where
    done   :               Cover      0       0       0
    left   : Cover k l m → Cover (suc k)      l  (suc m)
    right  : Cover k l m → Cover      k  (suc l) (suc m)
    both   : Cover k l m → Cover (suc k) (suc l) (suc m)

data Term : N → Set where
    var  : Term 1
    lam  : Term (suc n) → Term n
    app  : Cover k l m → Term k → Term l → Term m
    
_ = lam {-f-} (lam {-x-} (app (right (left done)) (var {-f-}) (var {-x-})))
\end{code}