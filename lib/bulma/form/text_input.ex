defmodule Bulma.Form.TextInput do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [text_input: 3]

  def render(assigns) do
    props =
      get_non_nil_props(assigns, [
        :value,
        :placeholder,
        :type,
        :disabled,
        :readonly,
        class: "input"
      ])
      |> add_is_class(assigns.color)
      |> add_is_class(assigns.size)
      |> add_bool_class("rounded", assigns.rounded)
      |> add_bool_class("hovered", assigns.hovered)
      |> add_bool_class("focused", assigns.focused)
      |> add_bool_class("loading", assigns.loading)
      |> add_bool_class("disabled", assigns.disabled)
      |> add_bool_class("readonly", assigns.readonly)
      |> add_bool_class("static", assigns.static)

    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", @control_class, "has-icons-left": @icon_left, "has-icons-right": @icon_right, "is-#{@size}": @size, "is-loading": @loading}} >
        {{ text_input(form, field, add_invalid_class(props, form, field) ++ @opts ++ event_opts) }}
        <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }}/>
        <Bulma.Elements.Icon icon={{ @icon_right }} class="is-right" :if={{ @icon_right }}/>
      </div>
    </Context>
    """
  end
end
