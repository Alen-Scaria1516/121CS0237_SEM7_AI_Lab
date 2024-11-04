(define (domain blockworld-domain)
  (:requirements :strips :typing)

  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; Block x is on block y
    (ontable ?x - block)            ; Block x is on the table
    (clear ?x - block)              ; Block x is clear (nothing on it)
    (holding ?x - block)            ; Robot is holding block x
    (handempty)                     ; Robot’s hand is empty
  )

  ;; Pickup a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  ;; Put a block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  ;; Stack a block on another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )

  ;; Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )
)