;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname practicaMIXfinal) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (add12 n m) (+ 1 m))


(define (contarElem l)
(foldr add12 0 l))

(define (nElementos? n l) (
                           equal? n (foldr add12 0 l)
                           ))

(define (transformaN n f l) (
                             cond
                              [(zero? n) l]
                              [else (cons (f (first l)) (transformaN (sub1 n) f (rest l)))] 
                             ))

(define (intervalo n) (
                       cond
                        [(zero? n) empty]
                        [else (append (intervalo (sub1 n)) (list n))]
                       ))

(define (dibujar-elipses n) (
                             cond
                              [(zero? n) (empty-scene 300 300)]
                              [else (place-image (rotate (* 2 n) (ellipse (* 10 n) (* 5 n) "outline" "blue")) 150 150 (dibujar-elipses (sub1 n)))]
                              ))

(define (implica x y) (
                       or (not x) y
                       ))
(define (equivalente x y) (
                           and (implica x y) (implica y x)
                           ))

