;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname reverseYCapicua) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;listaCapicua:List(Number) ->Boolean
;Determina si la secuencia de una lista de números de un dígito forman un número capicúa.

(define lista (list 1 2 3 3 4 4 4 4 3 3 2 1))
(define (reverser l) (foldl cons empty l))
(define (quitaFinal l) (cond
                         [(empty? l) empty]
                         [else (if (empty? (rest l)) empty (cons (first l) (quitaFinal (rest l))))]))

(define (f l) (foldr cons empty l))

(check-expect (listaCapicua lista) #t)

(define (listaCapicua l) (
                          cond
                           [(empty? l) #t]
                           [else (if (= (first l) (first (reverser l))) (and #t (listaCapicua (quitaFinal (rest l)))) (and #f (listaCapicua (quitaFinal (rest l)))))]
                          ))


