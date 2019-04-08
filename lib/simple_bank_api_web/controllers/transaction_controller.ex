defmodule SimpleBankApiWeb.TransactionController do
  use SimpleBankApiWeb, :controller

  alias SimpleBankApi.Bank
  alias SimpleBankApi.Guardian
  alias SimpleBankApi.Accounts

  action_fallback SimpleBankApiWeb.FallbackController

  def index(conn, _params) do
    transations = Bank.list_transations()
    render(conn, "index.json", transations: transations)
  end

  def transfer(conn, %{"to" => to, "amount" => amount}) do
    case Bank.transfer(%{
      from_user: Guardian.Plug.current_resource(conn),
      to_user: Accounts.get_by_account(to),
      amount: amount
    }) do
      {:ok, transfer} ->
        conn
        |> put_status(:created)
        |> render("transfer.json", transfer)
      {:error, reason} ->
        {:error, :bad_request, reason: reason}
      end
  end

  def transactions(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    balance = Bank.get_balance(user.id)
    transactions = Bank.get_transactions_by_user_id(user.id)
    conn
    |> render("transactions.json", %{balance: balance, transactions: transactions})
  end
end