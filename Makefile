createdb:
	docker compose exec db createdb --user=postgres --owner=postgres simple_bank
dropdb:
	docker compose exec db dropdb --user=postgres simple_bank
migrationup:
	migrate -path db/migration -database "postgresql://postgres:test@localhost:5432/simple_bank?sslmode=disable" -verbose up
migrationdown:
	migrate -path db/migration -database "postgresql://postgres:test@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: createdb dropdb migrationup migrationdown