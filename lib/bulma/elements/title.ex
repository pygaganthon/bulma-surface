defmodule Bulma.Elements.Title do
  use Surface.Component

  prop label, :string
  prop size, :integer, values: [1, 2, 3, 4, 5, 6], default: 1
  prop spaced, :boolean, default: false

  @impl true
  def render(assigns) do
    ~H"""
      <p class={{
        "title",
        "is-#{@size}": @size,
        "is-spaced": @spaced
      }}>
        <slot>{{ @label }}</slot>
      </p>
    """
  end
end
