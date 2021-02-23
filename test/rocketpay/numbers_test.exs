defmodule Rocketpay.NumbersTest do
  use ExUnit.Case
  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when ther is a file, with the given name return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "when ther is no file, with the given name return an error" do
      response = Numbers.sum_from_file("numbersss")
      expected_response = {:error, "no file found"}
      assert response == expected_response
    end
  end
end
