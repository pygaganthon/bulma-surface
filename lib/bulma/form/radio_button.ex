defmodule Bulma.Form.RadioButton do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [radio_button: 4]

  prop radio_value, :string
  prop label, :string
  prop label_class, :css_class

  slot default

  @impl true
  def render(assigns) do
    props =
      get_non_nil_props(assigns, [:value, class: assigns.class])
      |> add_is_class(assigns.color)

    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form, field: name }}>
      <label class="radio" >
        {{ radio_button(form, name, @value, add_invalid_class(props, form, name) ++ @opts ++ event_opts) }}
        <slot>{{ @label }}</slot>
      </label>
    </Context>
    """
  end
end
