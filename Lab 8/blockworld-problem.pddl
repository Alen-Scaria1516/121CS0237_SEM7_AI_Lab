(define (problem blockworld-problem)
  (:domain blockworld-domain)

  (:objects
    A B C D - block
  )

  (:init
    (ontable A)   ; A is on the table
    (on B C)      ; B is on C
    (ontable C)   ; C is on the table
    (on D B)      ; D is on B
    (clear A)     ; A is clear
    (clear D)     ; D is clear
    (handempty)   ; Robot's hand is empty
  )

  (:goal
    (and
      (on A B)    ; A on B
      (on B C)    ; B on C
      (on C D)    ; C on D
      (ontable D) ; D on the table
    )
  )
)