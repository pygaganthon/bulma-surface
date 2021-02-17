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

      prop size, :string, values: ["small", "normal", "medium", "large"]
      prop color, :string, values: Bulma.Helpers.Color.colors()
      prop placeholder, :string
      prop type, :string
      prop opts, :keyword, default: []

      prop rounded, :boolean
      prop hovered, :boolean
      prop focused, :boolean
      prop loading, :boolean
      prop disabled, :boolean
      prop readonly, :boolean
      prop static, :boolean

      prop control_class, :css_class
      prop icon_left, :string, values: Bulma.Helpers.Icons.all_icons()
      prop icon_right, :string, values: Bulma.Helpers.Icons.all_icons()

      prop blur, :event
      prop focus, :event
      prop capture_click, :event
      prop keydown, :event
      prop keyup, :event

      defp add_invalid_class(props, nil, _), do: props

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

      defp add_is_class(props, nil), do: props
      defp add_is_class(props, class), do: props |> add_class("is-#{class}")

      defp add_bool_class(props, class, true), do: props |> add_class("is-#{class}")
      defp add_bool_class(props, _, _), do: props

      defp add_bool_has_class(props, class, true), do: props |> add_class("has-#{class}")
      defp add_bool_has_class(props, _, _), do: props

      defp add_class(props, class) do
        Keyword.put(props, :class, Keyword.get(props, :class, "") <> " #{class}")
      end
    end
  end
end
