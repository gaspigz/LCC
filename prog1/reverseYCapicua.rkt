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
(define (intercala l r) (
                         cond
                          [(and (empty? l) (empty? r)) empty]
                          [(empty? r) (cons (first l) (intercala (rest l) empty))]
                          [(empty? l) (cons (first r) (intercala empty (rest r)))]
                          [else (cons (first l) (cons (first r) (intercala (rest l) (rest r))))]
                         
                         ))

(define-struct Usr (name pass perm))
; 0 es el identificador de permisos de administración del sistema
(define ADMIN 0)
;1 es el identificador de permisos de uso básico del sistema
(define USRPERMISO 1)

(define ANA (make-Usr "ana" "12345678" ADMIN))
(define LUIS (make-Usr "luis" "12345678" USRPERMISO))
(define MARTA (make-Usr "marta" "R34dlsoA" ADMIN))
(define L1 (list ANA LUIS))
(define L2 (list ANA LUIS MARTA))

(define (anulaClaves L reemplazo)(local[(define (cambiaClave usr) (make-Usr (Usr-name usr) reemplazo (Usr-perm usr)))]
                                   (map cambiaClave L)

                                   )
  )

(check-expect (anulaClaves L1 "nula") (list (make-Usr "ana" "nula" ADMIN)
(make-Usr "luis" "nula" USRPERMISO)))
(check-expect (anulaClaves empty "nula") empty)
  

