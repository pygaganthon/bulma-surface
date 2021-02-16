defmodule Bulma.Elements.Table.Column do
  use Surface.Component, slot: "columns"

  @doc "Column header text"
  prop label, :string, required: true
  prop class, :css_class
  prop heading_class, :css_class
end
