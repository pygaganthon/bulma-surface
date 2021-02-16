defmodule Bulma.Components.Panel.LabelBlock do
  use Surface.Component

  prop active, :boolean, default: false

  slot default

  @impl true
  def render(assigns) do
    ~H"""
      <label class={{ "panel-block", "is-active": @active}}>
        <slot/>
      </label>
    """
  end
end
