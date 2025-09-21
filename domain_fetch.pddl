(define (domain fetch)
  (:requirements :strips :typing)
  (:types room robot object)
  (:predicates (at ?r - robot ?rm - room)
              (connected ?from - room ?to - room)
              (at_obj ?o - object ?rm - room)
              (has ?r - robot ?o - object))

  (:action move
    :parameters (?r - robot ?from - room ?to - room)
    :precondition (and (at ?r ?from) (connected ?from ?to))
    :effect (and (not (at ?r ?from)) (at ?r ?to))
  )

  (:action pickup
    :parameters (?r - robot ?o - object ?rm - room)
    :precondition (and (at ?r ?rm) (at_obj ?o ?rm))
    :effect (and (not (at_obj ?o ?rm)) (has ?r ?o))
  )

  (:action drop
    :parameters (?r - robot ?o - object ?rm - room)
    :precondition (and (at ?r ?rm) (has ?r ?o))
    :effect (and (not (has ?r ?o)) (at_obj ?o ?rm))
  )
)
