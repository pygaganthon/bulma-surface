defmodule Bulma.Form.Utils do
  require Surface
  import Surface, only: [prop_to_opts: 3]

  def put_opts_from_props(assigns, props) do
    opts = props |> Enum.map(&prop_to_opts(assigns, &1))

    event_opts = [
      Surface.event_to_opts(assigns.blur, :phx_blur),
      Surface.event_to_opts(assigns.focus, :phx_focus),
      Surface.event_to_opts(assigns.capture_click, :phx_capture_click),
      Surface.event_to_opts(assigns.keydown, :phx_keydown),
      Surface.event_to_opts(assigns.keyup, :phx_keyup)
    ]

    (opts ++ event_opts ++ prop_to_opts(assigns, :opts)) |> List.flatten()
  end

  def put_class_from_props(opts, assigns, default_class) do
    opts ++ [class: Map.get(assigns, :class) || default_class]
  end

  def put_is_classes(opts, assigns, props) do
    class = Keyword.get(opts, :class, "")

    new_class =
      Enum.reduce(props, class, fn prop, acc ->
        prop_value(assigns, prop)
        |> case do
          {_, nil} -> acc
          {_, value} -> acc <> " is-#{value}"
        end
      end)

    Keyword.put(opts, :class, new_class)
  end

  def put_bool_classes(opts, assigns, props, prefix \\ "is") do
    class = Keyword.get(opts, :class, "")

    new_class =
      Enum.reduce(props, class, fn prop, acc ->
        prop_value(assigns, prop)
        |> case do
          {_, true} -> acc <> " #{prefix}-#{prop |> Atom.to_string() |> String.replace("_", "-")}"
          _ -> acc
        end
      end)

    Keyword.put(opts, :class, new_class)
  end

  def prop_to_opts(assigns, prop) do
    {key, value} = prop_value(assigns, prop)
    Surface.prop_to_opts(value, key)
  end

  defp prop_value(assigns, prop_item) do
    case prop_item do
      {prop, default} -> {prop, assigns[prop] || List.wrap(default)}
      prop -> {prop, assigns[prop]}
    end
  end

  def put_invalid_class(props, nil, _), do: props

  def put_invalid_class(props, form, name) do
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
