defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase
  alias Rocketpay.User
  alias Rocketpay.Users.Create
  alias Rocketpay.Repo

  describe "call/1" do
    test "when all parameters are valid, returns an user" do
      params = %{
        name: "leon",
        password: "123456",
        nickname: "leonklinke",
        email: "leon@salusapp.com",
        age: 28
      }
      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "leon", age: 28, id: ^user_id} = user
    end

    test "when parameters are invalid, returns an user" do
      params = %{
        name: "leon",
        nickname: "leonklinke",
        email: "leon@salusapp.com",
        age: 17
      }
      {:error, changeset} = Create.call(params)
      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}
      assert expected_response == errors_on(changeset)
    end
  end

end
