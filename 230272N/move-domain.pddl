(define (domain move)
  (:requirements :strips :typing)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (connected ?from - location ?to - location)
  )

  (:action move
    :parameters (?r - agent ?from - location ?to - location)
    :precondition (and
      (at ?r ?from)
      (connected ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
    )
  )
)
