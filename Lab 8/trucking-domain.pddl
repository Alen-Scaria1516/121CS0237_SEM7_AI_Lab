(define (domain trucking-domain)
  (:requirements :strips :typing)

  (:types truck city package)

  (:predicates 
    (truck-at ?t - truck ?c - city)      ; A truck is at a city
    (package-at ?p - package ?c - city)  ; A package is at a city
    (empty ?t - truck)                   ; A truck is empty
    (loaded ?p - package ?t - truck)     ; A package is loaded into a truck
  )

  ;; Drive a truck from one city to another
  (:action drive
    :parameters (?t - truck ?from - city ?to - city)
    :precondition (truck-at ?t ?from)
    :effect (and (not (truck-at ?t ?from)) (truck-at ?t ?to))
  )

  ;; Load a package into an empty truck
  (:action load
    :parameters (?p - package ?t - truck ?c - city)
    :precondition (and (package-at ?p ?c) (truck-at ?t ?c) (empty ?t))
    :effect (and (not (package-at ?p ?c)) (not (empty ?t)) (loaded ?p ?t))
  )

  ;; Unload a package from a truck to a city
  (:action unload
    :parameters (?p - package ?t - truck ?c - city)
    :precondition (and (loaded ?p ?t) (truck-at ?t ?c))
    :effect (and (not (loaded ?p ?t)) (package-at ?p ?c) (empty ?t))
  )
)