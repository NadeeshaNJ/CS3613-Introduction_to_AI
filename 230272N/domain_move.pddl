(define (domain move)
  (:requirements :strips :typing)
  (:types room robot)
  (:predicates (at ?r - robot ?rm - room)
               (connected ?from - room ?to - room))

  (:action move
    :parameters (?r - robot ?from - room ?to - room)
    :precondition (and (at ?r ?from) (connected ?from ?to))
    :effect (and (not (at ?r ?from)) (at ?r ?to))
  )
)