defmodule Ashes.Coherence.Web do
  @moduledoc false

  def view do
    quote do
      
      use Phoenix.View, root: "lib/ashes/web/templates/coherence"
      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Ashes.Web.Router.Helpers
      import Ashes.Web.ErrorHelpers
      import Ashes.Web.Gettext
      import Ashes.Coherence.ViewHelpers
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
