; Chapter 1 of The Little LISPer:
; Toys

;
; Atoms:
;
'atom
(quote atom)
'turkey
(quote turkey)
1492
(quote 1492)
'3turkey
(quote 3turkey)
'u
(quote u)
'*abc$
(quote *abc$)

;
; lists and s-expressions
;
'(atom)
(quote (atom))
'(atom turkey or)
(quote (atom turkey or))
; '(atom turkey) or - fails because OR is unbound
'((atom turkey) or)
'xyz
(quote xyz)
'(x y z)
(quote (x y z))
'(how are you doing so far)
'(((how) are) ((you) (doing so)) far)
'()
'(() () () ())

;
; car examples
;
(car '(a b c)) ; a
(car '((a b c) x y z)) ; (a b c)

; (car 'hotdog)     ; fails -- cannot car an atom
; (car '())         ; fails -- cannot car an emptylist
;
; LAW OF CAR
; car is only defined for non-null lists.
;
(car '(((hotdogs)) (and) (pickle) relish))  ; '((hotdogs))
(car (car '(((hotdogs)) (and))))            ; '(hotdogs)

;
; cdr examples
;
(cdr '(a b c))              ; '(b c)
(cdr '((a b c) x y z))      ; '(x y z)
(cdr '(hamburger))          ; '()
(cdr '((x) t r))            ; '(t r)

; (cdr 'hotdogs)    ; fails -- cannot cdr an atom
; (cdr '())         ; fails -- cannot cdr empty list

;
; cons examples
;
(cons 'peanut '(butter and jelly))                  ; '(peanut butter and jelly)
(cons '(banana and) '(peanut butter and jelly))     ; '((banana and) peanut butter and jelly)

; (cons '((a b c)) 'b)  ; fails -- 'b is not a list
; (cons 'a 'b)          ; fails -- 'b is not a list

;
; The law of cons
; cons takes 2 arguments.
; the 2nd argument must be a list
; the result is a list.
;
(cons 'a (cdr '((b) c d))) ; (a c d)

; null examples
;
(null '())         ; true
(null '(a b c))    ; false

;
; (null 'spaghetti)    ; fails -- only works for lists not atoms

;
; the law of null
; only defined for lists

; eq examples
;
(eq 'Harry 'Harry)         ; true
(eq 'margarine 'butter)    ; false
;
;; ; (eq '() '(strawberry))   ; fails -- only works on atoms
;; ; (eq 5 6)                 ; fails -- only works on non-numeric atoms
;

; the law of eq
; eq takes two arguments
; both arguments must be atoms
