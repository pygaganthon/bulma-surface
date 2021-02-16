defmodule Bulma do
  defp aliases() do
    quote do
      alias Bulma.Text

      alias Bulma.Components.{
        Breadcrumb,
        Card,
        Dropdown,
        Menu,
        Message,
        # TODO: Modal,
        # TODO: Navbar,
        # TODO: Pagination,
        Panel,
        Tabs
      }

      alias Bulma.Elements.{
        Block,
        Box,
        Button,
        Buttons,
        Content,
        Delete,
        Icon,
        # TODO: IconText,
        # TODO: Image,
        Notification,
        ProgressBar,
        Subtitle,
        Table,
        Tag,
        Tags,
        Title
      }

      alias Bulma.Form

      alias Bulma.Form.{
        Field,
        HelpText,
        HiddenInput,
        Textarea,
        TextInput,
        Submit
      }

      # Checkbox,
      # EmailInput,
      # Field,
      # FileInput,
      # Form,
      # HiddenInput,
      # Label,
      # PasswordInput,
      # Radio,
      # Select,
      # Submit,
      # TextInput,
      # Textarea,
      # TelephoneInput
      alias Bulma.Layout.{
        Container,
        Column,
        Columns,
        Hero,
        Level,
        Media,
        Footer,
        Section,
        Tile
      }
    end
  end

  defmacro __using__(_) do
    quote do
      unquote(aliases())
    end
  end
end
