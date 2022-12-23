#lang racket

;; Literal list; use ' to prevent eval
(+ 1 2)
'(+ 1 2)

;; Math on complex nums:
(+ 1+2i 2-3i)

(string-append "Hello " "world!")
(format "The ~a ate the ~a" "cat" "mouse")
(printf "Hello, from printf\n")

(let ([me "Bob"])
  "Alice"
  me)

(let* ([x 1]
       [y (+ x 1)])
  (* x y))

;; structs are immutable by default, add #:mutable
;; in order to make them mutable.
(struct dog (name breed age) #:mutable)

(define fido
  (dog "Fido" "beagle" 4))

(dog? fido)
(dog-name fido)
(set-dog-name! fido "Kevin")
(dog-name fido)

(define fish%
  (class object%
    (init name size)
    (define current-size size)
    (define fish-name name)
    (super-new) ;; huh?
    (define/public (say-hello) "Hello, world!")
    (define/public (grow amt) (set! current-size (+ amt current-size)))
    (define/public (stats)
      (format "Name: ~a. Current size: ~a." fish-name current-size))))

(define charlie (new fish%
                     [size 10]
                     [name "Charlie"]))

(send charlie stats)
