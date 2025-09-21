(define (domain wumpus_simple)
  (:requirements :strips :typing)
  (:types cell agent)
  (:predicates (at ?a - agent ?c - cell)
               (pit ?c - cell)
               (wumpus ?c - cell)
               (gold ?c - cell)
               (safe ?c - cell)
               (adjacent ?from - cell ?to - cell)
               (has_gold ?a - agent))

  (:action move
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and (at ?a ?from) (adjacent ?from ?to) (safe ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  (:action grab_gold
    :parameters (?a - agent ?c - cell)
    :precondition (and (at ?a ?c) (gold ?c))
    :effect (has_gold ?a)
  )

  (:action leave_gold
    :parameters (?a - agent ?c - cell)
    :precondition (and (at ?a ?c) (has_gold ?a))
    :effect (not (has_gold ?a))
  )
)
