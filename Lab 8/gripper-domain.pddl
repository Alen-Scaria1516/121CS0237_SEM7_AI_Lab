(define (domain gripper)
  (:requirements :strips :typing)
  (:types room ball gripper)

  (:predicates
    (at-robby ?r - room)
    (at ?b - ball ?r - room)
    (free ?g - gripper)
    (carry ?b - ball ?g - gripper)
  )

  ;; Action: Move the robot between rooms
  (:action move
    :parameters (?from ?to - room)
    :precondition (and (at-robby ?from))
    :effect (and (not (at-robby ?from))
                 (at-robby ?to))
  )

  ;; Action: Pick up a ball
  (:action pick
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and (at-robby ?r) (at ?b ?r) (free ?g))
    :effect (and (not (at ?b ?r))
                 (not (free ?g))
                 (carry ?b ?g))
  )

  ;; Action: Drop a ball
  (:action drop
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and (at-robby ?r) (carry ?b ?g))
    :effect (and (at ?b ?r)
                 (free ?g)
                 (not (carry ?b ?g)))
  )
)
