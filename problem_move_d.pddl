(define (problem move_d)
  (:domain move)
  (:objects
    r1 - robot
    roomA roomB roomC roomD - room
  )
  (:init
    (at r1 roomA)
    ;; Grid topology:
    ;; roomA --- roomB
    ;; |         |
    ;; roomC --- roomD
    ;; horizontal edges
    (connected roomA roomB)
    (connected roomB roomA)
    (connected roomC roomD)
    (connected roomD roomC)
    ;; vertical edges
    (connected roomA roomC)
    (connected roomC roomA)
    (connected roomB roomD)
    (connected roomD roomB)
  )
  (:goal (at r1 roomD))
)