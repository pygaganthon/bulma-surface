defmodule Bulma.Layout.Footer do
  use Surface.Component

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <footer class="footer">
        <slot/>
      </footer>
    """
  end
end
