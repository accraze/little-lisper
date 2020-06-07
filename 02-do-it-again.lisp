; Chapter 2
; Do It, Do It Again, and Again and Again...
;
(defun lat? (l)
  (cond
   ((null l) t)
   ((atom (car l)) (lat? (cdr l)))
   (t nil)))

(lat? '(Jack Sprat could eat no chicken fat)) ; true - each s-expression is atom
(lat? '((Jack) Sprat could eat no chicken fat)) ; false -- (car l is list)
(lat? '(Jack (Sprat could) eat no chicken fat)) ; false -- one s-expression is a list.
(lat? '()) ; true - since list is empty (no list)


(lat? '(bacon and eggs)) ; true -- each s- expression is atom
(lat? '(bacon '(and eggs))) ; nil -- on s-expression is a list.

(defun member? (a lat)
  (cond
    ((null lat) nil)
    (t (or
      (eq (car lat) a)
      (member? a (cdr lat))
    ))))

;
; The First Commandment
; Always ask null as first question
; when expressing any function.
;

; Exercises
;
; 2.1
(lat? '(german chocolate cake)) ; true
(lat? '(poppy seed cake)) ; true
(lat? '('(linzer) '(torte) ())) ; true
; 2.2
; step through 2.1

;2.3
(member? 'coffee '(german chocolate cake)) ; false
(member? 'seed '(poppy seed cake)) ; true

; 2.4
; re-write functions using if insted of cond
(defun lat? (l)
   (if (null l) '(t nil)
   (or (atom (car l)) (lat? (cdr l)))
   ))
(lat? '(german chocolate cake)) ; true

(defun member? (a lat)
    (if (null lat)
    nil
    (or
      (eq (car lat) a)
      (member? a (cdr lat))
    )))

; 2.5
; determine whether a list is the empty list or does
; not contain an atomic s-expression
(defun nonlat? (l)
  (cond
   ((null l) T)
   ((lat? l) nil)
   (t t)))
(nonlat? '(german chocolate cake)) ; false
(nonlat? '(poppy seed cake)) ; false
(nonlat? '('(linzer) '(torte) ())) ; false
(nonlat? '('(blue cheese) '(and) '(red) '(wine))) ; true


; 2.6
; determine whether a lat contains the atom cake

(defun member-cake? (lat)
  (cond
    ((null lat) nil)
    (t (or
    (eq (car lat) 'cake)
    (member-cake? (cdr lat))))))

(member-cake? '(german chocolate cake)) ;true
(member-cake? '(poppy seed cake)) ;true
(member-cake? '('(linzer) '(torte) ())) ;false

; 2.7
;
(defun member2? (a lat)
  (cond
    ((null lat) nil)
    (t (or
       (member2? a (cdr lat))
       (eq a (car lat))))))

(member? 'coffee '(german chocolate cake))
(member2? 'coffee '(german chocolate cake))
; same - false
;
(member? 'coffee '(poppy seed cake))
(member2? 'coffee '(poppy seed cake))
; same - false

(member? 'seed '(poppy seed cake))
(member2? 'seed '(poppy seed cake))
; same - true

; 2.8
; yes they are the same

; 2.9
(member? 'seed '('(linzer) '(torte) ()))

; 2.10
(defun member-twice? (a lat)
  (cond
    ((member? a lat)(member? a (cdr lat)))
    (t nil)))


(member-twice? 'poppy (cons 'poppy '(poppy seed cake))) ; true
(member-twice? 'poppy  '(poppy seed cake)) ;  false
