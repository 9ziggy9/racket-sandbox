#lang racket/gui

;; Instantiate the frame% class
(define frame (new frame%
		   [label "racket-gui"]
		   [width 300]
		   [height 300]))

;; Make a static message in the frame
(define msg (new message%
		 [parent frame]
		 [label "Hello, World!"]))

(define click-count 0)

;; Click counter
(new button%
     [parent frame]
     [label "Click me!"]
     ;; Callback procedure for a button click:
     [callback (lambda (button event)
		 (set! click-count (+ click-count 1))
		 (send msg set-label
		       (format "Button clicked ~a times." click-count)))])

;; Exit button
(new button%
     [parent frame]
     [label "EXIT"]
     [callback (lambda (button event)
		 (send frame show #f))])

;; Programmers never implement the GUI event loop directly. Instead,
;; the windowing system automatically pulls each event from an internal
;; queue and dispatches the event to an appropriate window. The dispatch
;; invokes the window’s callback procedure or calls one of the window’s
;; methods. In the above program, the windowing system automatically
;; invokes the button’s callback procedure whenever the user clicks
;; Click Me.

;; Show frame by calling its show method
(send frame show #t)
