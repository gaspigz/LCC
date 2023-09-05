;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejFinal) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define NRO_CARTAS 40)
(require racket/list) 

(define (generaLista n) (shuffle (
                         cond
                          [(< 0 n) (cons n (generaLista (sub1 n)))]
                          [else empty]
                         )))

(define (jugarPartida n l) (
                          cond
                           [(= n 0) 1] ;Me quede sin cartas
                           [(= (first l) (add1 (- NRO_CARTAS n))) 0] ;La carta de la primer posicion es igual al numero de la posicion
                           [else (jugarPartida (- n 1) (rest l))] ;La carta de la primer posicion no es igual al numero de la posicion
                          ))

(define (jugarNPartidas N) (
                            if (< 0 N) (+ (jugarPartida NRO_CARTAS (shuffle (generaLista NRO_CARTAS))) (jugarNPartidas (- N 1))) 0
                            ))

(define (conviene? N) (if (> (jugarNPartidas N) (/ N 2)) "Tenes mas chances de ganar" "Tenes mas chances de perder")) ;QUE HACER CON 50?

;VALE LA PENA MEJORAR EL ALGORITMO PARA LOGRAR UNA MENOR COMPLEJIDAD DE PROCESAMIENTO?