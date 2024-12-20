(define (problem ball_gripper_problem)
  (:domain ball_gripper_domain)
  (:objects ball1 ball2 ball3 ball4 left right rooma roomb)
  (:init (BALL ball1) (BALL ball2) (BALL ball3) (BALL ball4) (GRIPPER left) (GRIPPER right) (ROOM rooma) (ROOM roomb)
         (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 rooma)
         (at-robby rooma) (free left) (free right))
  (:goal (and (at-ball ball1 roomb) (at-ball ball2 roomb) (at-ball ball3 roomb) (at-ball ball4 roomb)))
)
