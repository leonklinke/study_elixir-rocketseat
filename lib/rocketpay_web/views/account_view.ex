defmodule RocketpayWeb.AccountView do
  alias Rocketpay.{Account}

  def render("update.json", %{
        account: %Account{id: account_id, balance: balance},
      }) do
    %{
      message: "User created",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
