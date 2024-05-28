defmodule AshTests.Test1.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry AshTests.Test1.Table1
  end
end
