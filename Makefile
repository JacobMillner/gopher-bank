postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres13 createdb --username=root --owner=root gopher_bank

dropdb:
	docker exec -it postgres13 dropdb gopher_bank

migrateup:
	migrate -path db/migrations -database "posgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "posgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test

