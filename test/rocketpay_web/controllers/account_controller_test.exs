defmodule RocketpayWeb.AccountControllerTest do
  use RocketpayWeb.ConnCase
  alias Rocketpay.User
  alias Rocketpay.Account

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "leon",
        password: "123456",
        nickname: "leonklinke",
        email: "leon@salusapp.com",
        age: 28
      }
      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")
      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50"}

      response =
        conn
        |> post(Routes.account_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{"account" => %{"balance" => "50.00", "id" => _id}, "message" => "Balance changed successfully"} = response
    end
  end
end
