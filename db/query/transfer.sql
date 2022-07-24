-- name: CreateTransfer :one
INSERT INTO transferes (
	from_account_id,
	to_account_id,
	amount
) VALUES (
	$1, $2, $3
) RETURNING *;


-- name: GetTransfer :one
SELECT * FROM transferes 
WHERE id = $1 LIMIT 1;

-- name: ListTransferes :many
SELECT * FROM transferes 
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateTransfer :one
UPDATE transferes 
SET amount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM transferes 
WHERE id = $1;

