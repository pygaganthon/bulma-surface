defmodule Bulma.Form.Submit do
  use Bulma.Form.Input
  import Bulma.Form.Utils

  import Phoenix.HTML.Form, only: [submit: 2]

  prop label, :string

  slot default

  def render(assigns) do
    props =
      get_non_nil_props(assigns, [:value, class: "button"])
      |> add_is_class(assigns.color)

    event_opts = get_events_to_opts(assigns)

    ~H"""
      {{ submit prop_to_opts(@class, :class) ++ @opts ++ props ++ event_opts, do: ~H"<slot>{{ @label }}</slot>" }}
    """
  end
end
