defmodule Bulma.Text do
  use Surface.Component

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <p><slot /></p>
    """
  end
end
