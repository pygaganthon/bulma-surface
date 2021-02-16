defmodule Bulma.Layout.Container do
  use Surface.Component

  prop fluid, :boolean, default: false
  prop breakpoint, :string, values: Bulma.Helpers.Visibility.breakpoints()
  prop max_breakpoint, :string, values: Bulma.Helpers.Visibility.breakpoints()

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      class={{
        "container",
        "is-fluid": @fluid,
        "is-#{@breakpoint}": @breakpoint,
        "is-max-#{@max_breakpoint}": @max_breakpoint,
      }}
    >
      <slot />
    </div>
    """
  end
end
