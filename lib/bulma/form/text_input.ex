defmodule Bulma.Form.TextInput do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [text_input: 3]

  prop icon_left, :string, values: Bulma.Helpers.Icons.all_icons()
  prop icon_right, :string, values: Bulma.Helpers.Icons.all_icons()

  def render(assigns) do
    props = get_non_nil_props(assigns, [:value, class: "input"])
    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", "has-icons-left": @icon_left, "has-icons-right": @icon_right }} >
        {{ text_input(form, field, add_invalid_class(props, form, field) ++ @opts ++ event_opts) }}
        <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }}/>
        <Bulma.Elements.Icon icon={{ @icon_right }} class="is-right" :if={{ @icon_right }}/>
      </div>
    </Context>
    """
  end
end
