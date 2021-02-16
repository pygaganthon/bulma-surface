defmodule Bulma.Layout.Section do
  use Surface.Component

  prop spacing, :string, values: ~w(medium large)

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <section class={{"section", "is-#{@spacing}": @spacing}}>
        <slot />
      </section>
    """
  end
end
