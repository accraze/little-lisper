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

; CH 1 Exercises
;
;1 10 different atoms
'foo
'bar
'baz
'*asdf
1337
'lol
'book
1234
'phone
'tree
'grass

;2 Make different lists
'(foo bar)
'(bar baz)
'(baz *asdf)
'(1337 1234)
'(lol book)
'(phone tree)
'(grass tree)
'(foo baz)
'(phone foo)
'(tree grass book)
'(1234 1337 phone)
'(baz bar)
'(tree grass lol)

;4 solve
(car (cons 'french '(fries)))  ; french
(cdr (cons 'oranges '(apples and peaches))) ; (apples and peaches)

;5 solve
(eq 'lisp 'lisp)

;6 if a is an atom, is there a list l that makes (null (cons a l)) true?
(null (cons '() '()))

;7 determine value of
(cons 'x 'y) ; (x y)
(cons '() '()) ; (NIL)
(car '()) ; NIL
(cdr '(())) ; NIL

; 8 true or false
(atom (car '((meatballs) and spaghetti))) ; false
(null (cdr '((meatballs)))) ; tru§e
(eq (car '(two meatballs)) (car (cdr '(two meatballs)))) ; false
(atom (cons 'meat '(ball))) ; false

; 9 solve
(car (cdr (cdr (car '((kiwis mangoes lemons) and (more)))))) ; lemons
(car (cdr (car (cdr '(() (eggs and (bacon)) (for) (breakfast)))))) ; and
(car (cdr (cdr (cdr '(() () () (and (coffee)) please))))) ; (and (coffee))

; 10 How to get the word Harry
(car (cdr (cdr '(apples in (Harry has a backyard)))))
(cdr (cdr '(apples and Harry)))
(car (cdr (cdr (car '(((apples) and ((Harry))) in his backyard)))))

