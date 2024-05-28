defmodule AshTests.Test1.Table1Test do
  use ExUnit.Case
  use AshTests.DataCase
  alias AshTests.Test1.Table1

  test "create a record and returns field_1 in the correct time zone" do
    time_zone = "America/Sao_Paulo"

    datetime =
      DateTime.utc_now()
      |> DateTime.shift_zone!(time_zone)

    table_1 = Table1.create!(%{field_1: datetime})
    assert time_zone == table_1.field_1.time_zone
  end

  test "update a record and returns field_1 in the correct time zone" do
    time_zone = "America/Sao_Paulo"

    datetime =
      DateTime.utc_now()
      |> DateTime.shift_zone!(time_zone)

    table_1 =
      Table1.create!(%{field_1: datetime})
      |> Table1.update!(%{field_1: datetime})

    assert time_zone == table_1.field_1.time_zone
  end
end
