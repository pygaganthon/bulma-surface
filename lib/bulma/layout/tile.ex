defmodule Bulma.Layout.Tile do
  use Surface.Component

  prop context, :string, values: ~w(ancestor parent child)
  prop vertical, :boolean, default: false
  prop size, :integer, values: Enum.to_list(1..12)

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <div class={{
        "tile",
        "is-#{@context}": @context,
        "is-vertical": @vertical,
        "is-#{@size}": @size
      }}>
        <slot />
      </div>
    """
  end
end
