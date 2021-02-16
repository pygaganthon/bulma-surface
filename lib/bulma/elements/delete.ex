defmodule Bulma.Elements.Delete do
  use Surface.Component

  prop click, :event

  @impl true
  def render(assigns) do
    ~H"""
      <a class="delete" :on-click={{ @click }}></a>
    """
  end
end
