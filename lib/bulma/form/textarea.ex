defmodule Bulma.Form.Textarea do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [textarea: 3]

  prop rows, :integer
  prop fixed_size, :boolean

  def render(assigns) do
    props =
      get_non_nil_props(assigns, [
        :value,
        :placeholder,
        :rows,
        :disabled,
        :readonly,
        class: "textarea"
      ])
      |> add_is_class(assigns.color)
      |> add_is_class(assigns.size)
      |> add_bool_class("hovered", assigns.hovered)
      |> add_bool_class("focused", assigns.focused)
      |> add_bool_class("loading", assigns.loading)
      |> add_bool_class("disabled", assigns.disabled)
      |> add_bool_class("readonly", assigns.readonly)
      |> add_bool_has_class("fixed-size", assigns.fixed_size)

    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", @control_class, "is-#{@size}": @size, "is-loading": @loading }} >
        {{ textarea(form, field, add_invalid_class(props, form, field) ++ @opts ++ event_opts) }}
      </div>
    </Context>
    """
  end
end
