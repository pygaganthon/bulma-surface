defmodule Bulma.Components.Dropdown.DividerItem do
  use Surface.Component

  @impl true
  def render(assigns) do
    ~H"""
      <hr class="dropdown-divider"/>
    """
  end
end
