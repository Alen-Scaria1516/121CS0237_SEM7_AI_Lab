(define (domain ball_gripper_domain)
  (:predicates (BALL ?x) (GRIPPER ?x) (ROOM ?x) (at-ball ?x ?y) (at-robby ?x) (carry ?x ?y) (free ?x))

  (:action drop
    :parameters (?x ?y ?z)
    :precondition (and (BALL ?x) (ROOM ?y) (GRIPPER ?z) (carry ?x ?z) (at-robby ?y))
    :effect (and (at-ball ?x ?y) (free ?z) (not (carry ?x ?z)))
  )

  (:action move
    :parameters (?x ?y)
    :precondition (and (ROOM ?x) (ROOM ?y) (at-robby ?x))
    :effect (and (at-robby ?y) (not (at-robby ?x)))
  )

  (:action pickup
    :parameters (?x ?y ?z)
    :precondition (and (BALL ?x) (ROOM ?y) (GRIPPER ?z) (at-ball ?x ?y) (at-robby ?y) (free ?z))
    :effect (and (carry ?x ?z) (not (at-ball ?x ?y)) (not (free ?z)))
  )
)
