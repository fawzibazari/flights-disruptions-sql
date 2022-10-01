SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports WHERE dst = 'A'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM planes
SELECT COUNT(*) FROM flights WHERE arr_delay = " "
SELECT COUNT(*), origin, airports.name FROM flights LEFT JOIN airports ON origin = airports.faa GROUP BY origin
SELECT COUNT(*) as count, dest, airports.name FROM flights LEFT JOIN airports ON origin = airports.faa GROUP BY dest ORDER BY count LIMIT 10
SELECT COUNT(flight) as count, dest FROM flights GROUP BY dest ORDER BY count
SELECT COUNT( DISTINCT dest) FROM flights
SELECT
	dest,
	count(nb_vols) AS nb_dest,
	airports.name
FROM (
	SELECT
		carrier,
		dest,
		COUNT(*) AS nb_vols
	FROM
		flights
	GROUP BY
		dest,
		carrier) p
	LEFT JOIN airports ON p.dest = airports.faa
GROUP BY
	dest
HAVING
	nb_dest = 1

-- #SELECT * from flights WHERE (SELECT dest,carrier, COUNT(*) as nb_vols FROM flights GROUP by dest, carrier) == 1
-- #SELECT * from LEFT JOIN (SELECT carrier,dest, COUNT(*) as nb_vols FROM flights GROUP by dest, carrier) B ON dest = B.dest
