DELETE p1
FROM Person p1 Join Person p2
WHERE p1.email = p2.email && p1.id > p2.id;