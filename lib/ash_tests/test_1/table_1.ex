defmodule AshTests.Test1.Table1 do
  use Ash.Resource, data_layer: AshPostgres.DataLayer
  alias AshTests.Test1.Type.DateTimeUsec

  postgres do
    table "table_1"
    repo AshTests.Repo
  end

  attributes do
    uuid_primary_key :id
    create_timestamp :inserted_at
    update_timestamp :updated_at
    attribute :field_1, DateTimeUsec, do: allow_nil?(false)
  end

  code_interface do
    define_for AshTests.Test1
    define :create, action: :create
    define :read_all, action: :read
    define :update, action: :update
    define :destroy, action: :destroy
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
