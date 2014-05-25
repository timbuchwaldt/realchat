defmodule Server do
  use GenEvent

  def handle_event({:message, message}, recipients) do
    IO.puts send_message(message,recipients)
    {:ok, recipients}
  end

  def handle_call({:register, pid}, recipients) do
    {:ok, :registered, [pid|recipients]}
  end

  def send_message(_, []) do
    :ok
  end

  def send_message(message, [recipient|rest]) do
    send(recipient, message)
    send_message(message, rest)
    IO.puts "Test"
  end

end
