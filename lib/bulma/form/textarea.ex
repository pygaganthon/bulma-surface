defmodule Bulma.Form.Textarea do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [textarea: 3]

  def render(assigns) do
    props = get_non_nil_props(assigns, [:value, class: "textarea"])
    event_opts = get_events_to_opts(assigns)

    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control" }} >
        {{ textarea(form, field, add_invalid_class(props, form, field) ++ @opts ++ event_opts) }}
      </div>
    </Context>
    """
  end
end
