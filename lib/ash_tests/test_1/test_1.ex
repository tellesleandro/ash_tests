defmodule AshTests.Test1 do
  use Ash.Api

  resources do
    registry AshTests.Test1.Registry
  end
end
