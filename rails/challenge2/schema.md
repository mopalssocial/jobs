# Business

| field | type | indexed |       |
|-------|------|-------|-------|
| id    | int  |       |       |
| name  | string | n   |       |

# Balance

| field | type | indexed |       |
|-------|------|-------|-------|
| id    | int  |       |       |
| business_id | int | y | foreign_key |
| amount | int | n     |       |

# Reward

| field | type | indexed |       |
|-------|------|-------|-------|
| id    | int  |       |       |
| business_id | int | y | foreign_key |

