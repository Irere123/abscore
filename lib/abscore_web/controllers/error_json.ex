defmodule AbscoreWeb.ErrorJSON do
  def render("500.json", _assigns) do
    %{errors: %{detail: "Internal Server Error"}}
  end

  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
