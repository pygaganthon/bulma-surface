defmodule Bulma.Form.Select do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [select: 4]
  prop options, :list, default: []

  @impl true
  def render(assigns) do
    props =
      get_non_nil_props(assigns, [:value, :placeholder, class: "input"])
      |> add_is_class(assigns.color)

    event_opts = get_events_to_opts(assigns)

    ~H"""
      <Context get={{ form: form, field: field }}>
      <div class={{ "control", "has-icons-left": @icon_left, "has-icons-right": @icon_right }} >
        <div class="select">
          {{ select(form, field, @options, add_invalid_class(props, form, field) ++ @opts ++ event_opts) }}
          <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }}/>
          <Bulma.Elements.Icon icon={{ @icon_right }} class="is-right" :if={{ @icon_right }}/>
        </div>
      </div>
    </Context>
    """
  end
end
