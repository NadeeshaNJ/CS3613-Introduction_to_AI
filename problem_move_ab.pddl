(define (problem move_ab)
  (:domain move)
  (:objects
    r1 - robot
    roomA roomB - room
  )
  (:init
    (at r1 roomA)
    (connected roomA roomB)
    (connected roomB roomA)
  )
  (:goal (at r1 roomB))
)