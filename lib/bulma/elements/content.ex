defmodule Bulma.Elements.Content do
  use Surface.Component

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <div class="content"><slot /></div>
    """
  end
end
