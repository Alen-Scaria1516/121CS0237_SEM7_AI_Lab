(define (problem trucking-problem)
  (:domain trucking-domain)

  (:objects
    truck1 truck2 - truck
    cityA cityB - city
    package1 - package
  )

  (:init
    (truck-at truck1 cityA)
    (truck-at truck2 cityB)
    (package-at package1 cityA)
    (empty truck1)
    (empty truck2)
  )

  (:goal
    (package-at package1 cityB)
  )
)