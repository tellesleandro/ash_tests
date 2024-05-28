# AshTests

## Test 1

### [Custom types not casting on update](https://elixirforum.com/t/custom-types-not-casting-on-update/63813/1).

To reproduce, run `mix test`.

The test `update a record and returns field_1 in the correct time zone (AshTests.Test1.Table1Test)` fails.

After update, field_1 returns a DateTime in UTC, but it is expected to return a DateTime in "America/Sao_Paulo" time zone.