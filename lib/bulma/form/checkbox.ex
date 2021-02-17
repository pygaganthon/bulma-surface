defmodule Bulma.Form.Checkbox do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [checkbox: 3]

  prop checked_value, :string, default: "true"
  prop unchecked_value, :string, default: "false"

  prop label, :string
  prop name, :atom, required: true

  slot default

  def render(assigns) do
    props =
      get_non_nil_props(assigns, [
        :value,
        :checked_value,
        :unchecked_value,
        class: ""
      ])
      |> add_is_class(assigns.color)

    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form }}>
      <div class="field">
        <div class="control">
          <label class="checkbox" >
            {{ checkbox(form, @name, add_invalid_class(props, form, @name) ++ @opts ++ event_opts) }}
            <slot>{{ @label }}</slot>
          </label>
        </div>
      </div>
    </Context>
    """
  end
end
