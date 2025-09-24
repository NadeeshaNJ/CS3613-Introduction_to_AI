(define (problem move_ab)
  (:domain move)
  (:objects
    r1 - robot
    roomA roomB roomC roomD - room
  )
  (:init
    (at r1 roomA)
    (connected roomA roomB)
    (connected roomB roomA)
    (connected roomB roomD)
    (connected roomD roomB)
    (connected roomA roomC)
    (connected roomC roomA)
  )
  (:goal (at r1 roomD))
)