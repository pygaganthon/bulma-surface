defmodule Bulma.Form.Input do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Surface.Component

      alias Bulma.Form.Input.InputContext

      prop form, :form
      prop field, :atom
      prop value, :string
      prop class, :css_class
      prop opts, :keyword, default: []

      prop blur, :event
      prop focus, :event
      prop capture_click, :event
      prop keydown, :event
      prop keyup, :event

      defp add_invalid_class(props, form, name) do
        case Keyword.get_values(form.errors, name) do
          [] ->
            props

          _ ->
            props
            |> Keyword.get(:class, "")
            |> case do
              "" -> props |> Keyword.put(:class, "is-danger")
              classes -> props |> Keyword.put(:class, classes <> " is-danger")
            end
        end
      end
    end
  end
end
