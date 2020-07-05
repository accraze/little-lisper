; Chapter 3
; Cons The Magnificient
;
; Try to remove atom from list
(defun rember (a lat)
	(cond
		((null lat) (quote '()))
		(t (cond
				 ((eq (car lat) a)(cdr lat))
				 (t (rember a (cdr lat)))))))

(rember 'bacon '(bacon lettuce and tomato)) ; (lettuce and tomato)

; !!!this does not work for later members -- we lose all the atoms preceding it...

;
; THE SECOND COMMANDMENT
; use cons to build lists
;
(defun rember (a lat)
	(cond
		((null lat) (quote '()))
		(t (cond
				 ((eq (car lat) a)(cdr lat))
				 (t (cons (car lat)(rember a (cdr lat))))))))

;
; THE THIRD COMMANDMENT
; When building a list, describe the first typical element,
; and then cons it onto the natural recursion.
;
(defun firsts (l)
	(cond
		((null l) (quote '()))
		(t (cons (car (car l))(firsts(cdr l))))))

(firsts '((a b a) (cde) (efg)))  ; (a c e)

(defun insertR (new old lat)
	(cond
		((null lat) (quote '()))
		(t  (cond
					((eq (car lat) old) (cons old (cons new (cdr lat))))
					(t (cons (car lat) (insertR new old (cdr lat))))
				))))

(insertR 'topping 'fudge '(ice cream with fudge for dessert))  ; ice cream with fudge topping for dessert

(defun insertL (new old lat)
	(cond
		((null lat) (quote '()))
		(t  (cond
					((eq (car lat) old) (cons new (cons old (cdr lat))))
					(t (cons (car lat) (insertR new old (cdr lat))))
				))))

(insertL 'topping 'fudge '(ice cream with fudge for dessert))  ; ice cream with topping fudge for dessert

(defun subst1 (new old lat)
	(cond
		((null lat) (quote '()))
		(t  (cond
					((eq (car lat) old) (cons new (cdr lat)))
					(t (cons (car lat) (subst1 new old (cdr lat))))
				))))

(subst1 'topping 'fudge '(ice cream with fudge for dessert))  ; ice cream with topping for dessert

(defun subst2 (new o1 o2 lat)
	(cond
		((null lat) (quote '()))
		(t  (cond
					((eq (car lat) o1) (cons new (cdr lat)))
					((eq (car lat) o2) (cons new (cdr lat)))
					(t (cons (car lat) (subst2 new o1 o2 (cdr lat))))
				))))

(subst2 'vanilla 'chocolate 'banana '(banana ice cream with chocolate topping))  ; vanilla ice cream with chocolate topping


(defvar l1 '((paella spanish)(wine red)(and beans)))
(defvar l2 '())
(defvar l3 '(cincinnati chili))
(defvar l4 '(texas hot chili))
(defvar l5 '(soy sauce and tomato sauce))
(defvar l6 '((spanish)()(paella)))
(defvar l7 '((and hot)(but dogs)))
(defvar a1 'chili)
(defvar a2 'hot)
(defvar a3 'spicy)
(defvar a4 'sauce)
(defvar a5 'soy)

; 3.1
(defun seconds (l)
	(cond
		((null l) (quote '()))
		(t (cons (car (cdr l))(firsts(cdr l))))))

(seconds l1) ; (spanish red beans)
(seconds l2) ; ()
(seconds l7) ; (hot dogs)

; 3.2
(defun dupla (a l)
	  (cond
			((null l) '())
			(t (cons a (dupla a (cdr l))))))

(dupla a2 l4) ; (hot hot hot)
(dupla a2 l2) ; ()
(dupla a1 l5) ; (chili chili chili chili chili)

; 3.3
(defun doublez (a lat)
	(cond
		((null lat) '())
		((eq (car lat) a)(cons a lat))
		(t (cons (car lat)
			(doublez a (cdr lat))))))
(doublez a2 l2) ; ()
(doublez a1 l3) ; (cincinnati chili chili)
(doublez a2 l4) ; (texas hot hot chili)

; 3.4
(defun subst-sauce (a lat)
	(cond
		((null lat) '())
		(t (cond
				 ((eq (car lat) 'sauce)
					(cons a (cdr lat)))
				 (t (cons (car lat)
									(subst-sauce a (cdr lat))))))))
(subst-sauce a1 l4); (texas hot chili)
(subst-sauce a1 l5); (soy chili and tomato sauce)
(subst-sauce a4 l2); NIL

; 3.5
(defun subst3 (new o1 o2 o3 lat)
	(cond
		((null lat) '())
		(t (cond
				 ((eq (car lat) o1)
					(cons new (cdr lat)))
				 ((eq (car lat) o2)
					(cons new (cdr lat)))
				 ((eq (car lat) o3)
					(cons new (cdr lat)))
				 (t (cons (car lat)
(subst3 new o1 o2 o3 (cdr lat))))))))
(subst3 a5 a1 a2 a4 l5); (soy soy and tomato sauce)
(subst3 a4 a1 a2 a3 l4); (texas sauce chili)
(subst3 a3 a1 a2 a5 l2); ()

; 3.6
(defun substN (new slat lat)
	(cond
		((null lat) '())
		(t (cond
				 ((member (car lat) slat)
					(cons new (cdr lat)))
				 (t (cons (car lat)
									(substN new slat (cdr lat))))))))

(substN a2 l3 l4); correct
(substN a4 l3 l5); correct
(substN a4 l3 l2); correct
; 3.7 step through
;
; 3.8
; Typical elements - possible results as list
; Natural recursion - cons'd together

; 3.9

(defun rember (a lat)
	(cond
		((null lat) '())
		((eq (car lat) a)(cdr lat))
		(t (cons (car lat)
						 (rember a (cdr lat))))))


(rember a1 l3); (cincinnati)
(rember a4 l5); (soy and tomato sauce)
(rember a4 l2); NIL

(defun rember2 (a lat)
	(cond
		((null lat) '())
		((eq (car lat) a) (cons a (rember a (cdr lat))))
		(t (cons (car lat)
						 (rember2 a (cdr lat))))))

(rember2 a1 l3); (cincinnati chili)
(rember2 a4 l5); (soy sauce and tomato sauce)
(rember2 a4 l2); NIL

; 3.10
(defun rember (a lat)
	(cond
		((null lat) '())
		((eq (car lat) a)(cdr lat))
		(t (cons (car lat)
						 (rember a (cdr lat))))))

(defun insertR (new old lat);COMMON 1
	  (cond ;COMMON 1
			((null lat) '());COMMON 1
			(t (cond ;COMMON 1
					 ((eq (car lat) old) ;COMMON 1
						(cons old
									(cons new (cdr lat))))
					 (t (cons (car lat) ;COMMON 2
										(insertR ;COMMON 2
											new old (cdr lat))))))));COMMON 2

(defun insertL (new old lat);COMMON 1
	(cond ;COMMON 1
		((null lat) '()) ;COMMON 1
		(t (cond ;COMMON 1
				 ((eq (car lat) old) ;COMMON 1
					(cons new
								(cons old (cdr lat))))
				 (t (cons (car lat) ;COMMON 2
									(insertL ;COMMON 2
										new old (cdr lat))))))));COMMON 2

(defun subst_ (new old lat) ;COMMON 1
	(cond ;COMMON 1
		((null lat) '());COMMON 1
		(t (cond ;COMMON 1
				 ((eq (car lat) old) ;COMMON 1
					(cons new (cdr lat)))
				 (t (cons (car lat) ;COMMON 2
									(subst_ ;COMMON 2
										new old (cdr lat))))))));COMMON 2

