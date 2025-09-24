(define (problem move-instance)
  (:domain move)

  (:objects
    r1 - agent
    l1 l2 l3 - location
  )

  (:init
    (at r1 l1)
    ;; undirected edges expressed both ways
    (connected l1 l2)
    (connected l2 l1)
    (connected l2 l3)
    (connected l3 l2)
  )

  (:goal
    (at r1 l3)
  )
)
