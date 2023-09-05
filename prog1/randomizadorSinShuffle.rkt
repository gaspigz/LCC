;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname randomizadorSinShuffle) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (creaLista m n) (if (< 0 n) (cons (- m (sub1 n)) (creaLista m (sub1 n))) empty))

(define l (creaLista 40 40))

(define (shuffle2 l n)
  (let ([x (random 40)])
    (letrec ([mayor-x? (lambda (elem) (> elem x))]
             [menor-igual-x? (lambda (elem) (<= elem x))])
      (if (< 0 n)
          (if (odd? (random 10)) (shuffle2 (append (filter mayor-x? l) (filter menor-igual-x? l)) (sub1 n)) (shuffle2 (append (filter menor-igual-x? l) (filter mayor-x? l)) (sub1 n)))
          
          (append (filter mayor-x? l) (filter menor-igual-x? l))
      )
     )
    )
  )




                      