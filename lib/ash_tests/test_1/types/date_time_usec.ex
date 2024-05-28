defmodule AshTests.Test1.Type.DateTimeUsec do
  use Ash.Type

  @impl Ash.Type
  def storage_type, do: :utc_datetime_usec

  @impl Ash.Type
  def cast_input(nil, _), do: {:ok, nil}

  def cast_input(%DateTime{} = value, _) do
    Ecto.Type.cast(:utc_datetime_usec, value)
  end

  def cast_input(%NaiveDateTime{} = value, _) do
    time_zone = "America/Sao_Paulo"

    value =
      value
      |> DateTime.from_naive!(time_zone)

    Ecto.Type.cast(:utc_datetime_usec, value)
  end

  def cast_input(value, _) when is_binary(value) do
    if(String.length(value) == 16, do: value <> ":00", else: value)
    |> NaiveDateTime.from_iso8601!()
    |> cast_input(nil)
  end

  @impl Ash.Type
  def cast_stored(nil, _), do: {:ok, nil}

  def cast_stored(value, _) do
    time_zone = "America/Sao_Paulo"

    value =
      value
      |> DateTime.shift_zone!(time_zone)

    {:ok, value}
  end

  @impl Ash.Type
  def dump_to_native(nil, _), do: {:ok, nil}

  def dump_to_native(value, _) do
    Ecto.Type.dump(:utc_datetime_usec, value)
  end
end
