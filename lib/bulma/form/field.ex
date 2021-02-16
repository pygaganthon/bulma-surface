defmodule Bulma.Form.Field do
  @moduledoc """
  Defines a form field.
  The `Field` component sets the provided field name into the context so child
  components like input fields and labels can retrieve it and use it as
  the default field.
  """

  use Surface.Component

  import Phoenix.HTML.Form, only: [label: 4]
  import Phoenix.HTML.Tag, only: [content_tag: 3]

  prop name, :atom, required: true
  prop label, :string
  prop class, :css_class, default: ""
  prop labale_class, :css_class

  @doc """
  The content for the field
  """
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class={{ "field", @class }}>
      <Context get={{ form: form }}>
          {{ label(form, @name, @label || @name, class: "label " <> @class) }}
            <Context put={{ field: @name ,form: form}}>
              <slot/>
            </Context>
          {{ error_tag form, @name }}
      </Context>
    </div>
    """
  end

  defp error_tag(form, name) do
    Enum.map(Keyword.get_values(form.errors, name), fn {msg, opts} ->
      error =
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)

      content_tag(:p, error, class: "help is-danger")
    end)
  end
end
