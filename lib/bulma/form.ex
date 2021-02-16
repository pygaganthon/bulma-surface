defmodule Bulma.Form do
  use Surface.Component

  import Phoenix.HTML.Form
  import Bulma.Form.Utils, only: [get_non_nil_props: 2]
  alias Surface.Components.Raw

  prop for, :any, required: true
  prop action, :string, default: "#"
  prop as, :atom
  prop method, :string, default: "post"
  prop multipart, :boolean, default: false

  @doc """
  For \"post\" requests, the form tag will automatically include an input
  tag with name _csrf_token. When set to false, this is disabled.
  """
  prop csrf_token, :any

  prop opts, :keyword, default: []

  prop change, :event
  prop submit, :event

  @doc "The content of the `<form>`"
  slot default, required: true, props: [:form]
  slot buttons

  def render(assigns) do
    ~H"""
      {{ form = form_for(@for, @action, get_opts(assigns)) }}
        <Context put={{ form: form }}>
          <slot />

          <div class="clearfix">
          <div class="float-end">
            <slot name="buttons" />
          </div>
          </div>
        </Context>
      <#Raw></form></#Raw>
    """
  end

  defp get_opts(assigns) do
    form_opts = get_non_nil_props(assigns, [:as, :method, :multipart, :csrf_token, :errors])

    form_opts ++
      assigns.opts ++
      event_to_opts(assigns.change, :phx_change) ++
      event_to_opts(assigns.submit, :phx_submit)
  end
end
